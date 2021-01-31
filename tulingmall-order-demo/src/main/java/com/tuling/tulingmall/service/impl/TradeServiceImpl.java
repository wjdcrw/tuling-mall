package com.tuling.tulingmall.service.impl;

import com.alipay.api.AlipayResponse;
import com.alipay.api.domain.TradeFundBill;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.mapper.OmsOrderMapper;
import com.tuling.tulingmall.model.OmsOrder;
import com.tuling.tulingmall.model.OmsOrderItem;


import com.tuling.tulingmall.component.TradePayProp;
import com.tuling.tulingmall.component.trade.alipay.config.Configs;
import com.tuling.tulingmall.component.trade.alipay.model.ExtendParams;
import com.tuling.tulingmall.component.trade.alipay.model.GoodsDetail;
import com.tuling.tulingmall.component.trade.alipay.model.builder.AlipayTradePrecreateRequestBuilder;
import com.tuling.tulingmall.component.trade.alipay.model.builder.AlipayTradeQueryRequestBuilder;
import com.tuling.tulingmall.component.trade.alipay.model.result.AlipayF2FPrecreateResult;
import com.tuling.tulingmall.component.trade.alipay.model.result.AlipayF2FQueryResult;
import com.tuling.tulingmall.component.trade.alipay.service.AlipayTradeService;
import com.tuling.tulingmall.component.trade.alipay.service.impl.AlipayTradeServiceImpl;
import com.tuling.tulingmall.component.trade.alipay.utils.Utils;
import com.tuling.tulingmall.component.trade.alipay.utils.ZxingUtils;
import com.tuling.tulingmall.dao.PortalOrderDao;
import com.tuling.tulingmall.domain.OmsOrderDetail;
import com.tuling.tulingmall.service.TradeService;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *                  ,;,,;
 *                ,;;'(    社
 *      __      ,;;' ' \   会
 *   /'  '\'~~'~' \ /'\.)  主
 * ,;(      )    /  |.     义
 *,;' \    /-.,,(   ) \    码
 *     ) /       ) / )|    农
 *     ||        ||  \)     
 *     (_\       (_\
 * @author ：杨过
 * @date ：Created in 2020/1/12 19:37
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 交易服务
 **/
@Slf4j
@Service
public class TradeServiceImpl implements TradeService {

    @Autowired
    private TradePayProp tradePayProp;

    // 支付宝当面付2.0服务
    private static AlipayTradeService tradeService;

    @Autowired
    private PortalOrderDao portalOrderDao;

    @Autowired
    private OmsOrderMapper orderMapper;

    static {
        /**
         * 支付宝的初始化
         *
         * 一定要在创建AlipayTradeService之前调用Configs.init()设置默认参数
         *  Configs会读取classpath下的zfbinfo.properties文件配置信息，如果找不到该文件则确认该文件是否在classpath目录
         */
        Configs.init("zfbinfo.properties");

        /** 使用Configs提供的默认参数
         *  AlipayTradeService可以使用单例或者为静态成员对象，不需要反复new
         */
        tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();
    }

    /**
     * 根据订单生成支付二维码
     *
     * @param orderId
     * @param payType
     * @return
     */
    @Transactional
    @Override
    public CommonResult tradeQrCode(Long orderId, Integer payType,Long memberId) {
        try {
            OmsOrderDetail detail = portalOrderDao.getDetail(orderId);
            if(StringUtils.isEmpty(detail.getQrcode())){
                String path =  (detail.getPayType() == 1) ? aliPayQrCode(detail) : wechatPayQrCode(detail);
                OmsOrder omsOrder = new OmsOrder();
                omsOrder.setId(detail.getId());
                omsOrder.setMemberId(memberId);
                omsOrder.setQrcode(path);
                //把二维码地址插入到订单记录中
                orderMapper.updateByPrimaryKeySelective(omsOrder);
                return CommonResult.success(path);
            }else{
                return CommonResult.success(detail.getQrcode());
            }
        } catch (Exception e) {
            log.error("生成支付二维码异常:{}",e.getMessage(),e.getCause());
            throw new RuntimeException("生成支付二维码异常：请联系管理员！");
        }
    }

    /**
     * 查询订单支付状态
     *
     * @param orderId
     *          订单编号
     * @param payType
     *
     * @return
     */
    @Override
    public CommonResult tradeStatusQuery(Long orderId, Integer payType) {
        OmsOrderDetail orderDetail = portalOrderDao.getDetail(orderId);
        if(payType == 1){//支付宝支付
            CommonResult result = alipayTradeQuery(orderDetail.getOrderSn());
            if(result.getCode() == 200){
                //订单查询详情信息
                AlipayTradeQueryResponse response = (AlipayTradeQueryResponse) result.getData();
                /*
                 * 支付详情处理逻辑，根据需要处理
                 */
                //更新新订单支付状态
                if(orderDetail.getPayType() == 0){
                    OmsOrder order = new OmsOrder();
                    order.setId(orderId);
                    order.setStatus(1);
                    order.setPayType(payType);
                    order.setPaymentTime(new Date());
                    orderMapper.updateByPrimaryKeySelective(order);
                    //恢复所有下单商品的锁定库存，扣减真实库存
                    int count = portalOrderDao.updateSkuStock(orderDetail.getOrderItemList());
                }
                return CommonResult.success("订单编号："+orderDetail.getOrderSn()+":支付成功!");
            }
        }else{//微信支付

        }
        return CommonResult.failed();
    }

    private CommonResult alipayTradeQuery(String orderSn){
        // (必填) 商户订单号，通过此商户订单号查询当面付的交易状态
        String outTradeNo = orderSn;

        // 创建查询请求builder，设置请求参数
        AlipayTradeQueryRequestBuilder builder = new AlipayTradeQueryRequestBuilder()
                .setOutTradeNo(outTradeNo);

        AlipayF2FQueryResult result = tradeService.queryTradeResult(builder);
        switch (result.getTradeStatus()) {
            case SUCCESS:
                log.info("查询返回该订单支付成功: )");
                AlipayTradeQueryResponse response = result.getResponse();
                dumpResponse(response);
                log.info(response.getTradeStatus());
                if (Utils.isListNotEmpty(response.getFundBillList())) {
                    for (TradeFundBill bill : response.getFundBillList()) {
                        log.info(bill.getFundChannel() + ":" + bill.getAmount());
                    }
                }
                return CommonResult.success(response);
            case FAILED:
                log.error("查询返回该订单支付失败或被关闭!!!");
                break;

            case UNKNOWN:
                log.error("系统异常，订单支付状态未知!!!");
                break;

            default:
                log.error("不支持的交易状态，交易返回异常!!!");
                break;
        }
        return CommonResult.failed();
    }

    /**
     * 支付宝方式
     * @return
     */
    private String aliPayQrCode(OmsOrderDetail orderDetail){
        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
        String outTradeNo = orderDetail.getId()+"";

        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
        if(CollectionUtils.isEmpty(orderDetail.getOrderItemList())){
            throw new IllegalArgumentException("空订单,不允许支付");
        }
        OmsOrderItem omsOrderItem = orderDetail.getOrderItemList().get(0);
        String subject = omsOrderItem.getProductBrand() + "品牌"
                + omsOrderItem.getProductName()+"产品购买扫码消费";

        // (必填) 订单总金额，单位为元，不能超过1亿元
        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
        String totalAmount = orderDetail.getPayAmount().toString();

        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
        String undiscountableAmount = "0";

        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
        String sellerId = "";

        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
        String body = "购买商品"+orderDetail.getOrderItemList().size()
                +"件共"+totalAmount+"元";

        // 商户操作员编号，添加此参数可以为商户操作员做销售统计
        String operatorId = "yangguo";

        // (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
        String storeId = "tuling";

        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
        ExtendParams extendParams = new ExtendParams();
        extendParams.setSysServiceProviderId("2088100200300400500");

        // 支付超时，定义为120分钟
        String timeoutExpress = "120m";

        // 商品明细列表，需填写购买商品详细信息，
        List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();
        orderDetail.getOrderItemList().stream().forEach((item)->{
            GoodsDetail goods = GoodsDetail.newInstance(item.getProductId()+"",
                    item.getProductName(),
                    //将金额单位[元]转为[分]
                    item.getProductPrice().multiply(new BigDecimal(100)).longValue(),
                    item.getProductQuantity());
            // 创建好一个商品后添加至商品明细列表
            goodsDetailList.add(goods);
        });

        // 创建扫码支付请求builder，设置请求参数
        AlipayTradePrecreateRequestBuilder builder = new AlipayTradePrecreateRequestBuilder()
                .setSubject(subject).setTotalAmount(totalAmount).setOutTradeNo(outTradeNo)
                .setSellerId(sellerId).setBody(body)
                .setUndiscountableAmount(undiscountableAmount)
                .setOperatorId(operatorId).setStoreId(storeId).setExtendParams(extendParams)
                .setTimeoutExpress(timeoutExpress)
                .setNotifyUrl(tradePayProp.getPaySuccessCallBack()+"/1")//支付宝服务器主动通知商户服务器里指定的页面http路径,根据需要设置
                .setGoodsDetailList(goodsDetailList);
        log.info("alipay callback url:--->"+builder.getNotifyUrl());
        AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);
        switch (result.getTradeStatus()) {
            case SUCCESS:
                log.info("支付宝预下单成功: )");
                AlipayTradePrecreateResponse response = result.getResponse();
                dumpResponse(response);
                // 需要修改为运行机器上的路径
                String filePath = String.format(tradePayProp.getAliPayPath() + "/qr-%s.png",
                        response.getOutTradeNo());
                log.info("filePath:" + tradePayProp.getStorePath()+ filePath);
                //写到图片当中
                ZxingUtils.getQRCodeImge(response.getQrCode(), 256, tradePayProp.getStorePath()+filePath);
                return tradePayProp.getHttpBasePath() + filePath;
            case FAILED:
                log.error("支付宝预下单失败!!!");
                break;
            case UNKNOWN:
                log.error("系统异常，预下单状态未知!!!");
                break;
            default:
                log.error("不支持的交易状态，交易返回异常!!!");
                break;
        }
        return null;
    }

    // 简单打印应答
    private void dumpResponse(AlipayResponse response) {
        if (response != null) {
            log.info(String.format("code:%s, msg:%s", response.getCode(), response.getMsg()));
            if (StringUtils.isNotEmpty(response.getSubCode())) {
                log.info(String.format("subCode:%s, subMsg:%s", response.getSubCode(),
                        response.getSubMsg()));
            }
            log.info("body:" + response.getBody());
        }
    }



    /**
     * 微信支付方式
     * @return
     */
    private String wechatPayQrCode(OmsOrderDetail orderDetail){
        return null;
    }
}
