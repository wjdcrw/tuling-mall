package com.tuling.tulingmall.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.google.common.collect.Maps;
import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import com.tuling.tulingmall.common.exception.BusinessException;
import com.tuling.tulingmall.component.trade.alipay.config.Configs;
import com.tuling.tulingmall.domain.ConfirmOrderResult;
import com.tuling.tulingmall.domain.MqCancelOrder;
import com.tuling.tulingmall.domain.OmsOrderDetail;
import com.tuling.tulingmall.domain.OrderParam;
import com.tuling.tulingmall.service.OmsPortalOrderService;
import com.tuling.tulingmall.service.SecKillOrderService;
import com.tuling.tulingmall.service.TradeService;
import com.tuling.tulingmall.util.MD5;
import com.tuling.tulingmall.util.RedisOpsUtil;
import com.tuling.tulingmall.util.VerifyCodeImgUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 订单管理Controller
 * 2018/8/30.
 */
@Slf4j
@Controller
@Api(tags = "OmsPortalOrderController",description = "订单管理")
@RequestMapping("/order")
public class OmsPortalOrderController {
    @Autowired
    private OmsPortalOrderService portalOrderService;

    @Autowired
    private TradeService tradeService;

    @Autowired
    private RedisOpsUtil redisOpsUtil;

    @Autowired
    private SecKillOrderService secKillOrderService;

    @ApiOperation("根据购物车信息生成确认单信息")
    @ApiImplicitParam(name = "itemId",value = "购物车选择购买的选项ID",allowMultiple = true,paramType = "query",dataType = "long")
    @RequestMapping(value = "/generateConfirmOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<ConfirmOrderResult> generateConfirmOrder(@RequestParam(value = "itemId") List<Long> itemIds,
                                                                 @RequestHeader("memberId") Long memberId) throws BusinessException {
        ConfirmOrderResult confirmOrderResult = portalOrderService.generateConfirmOrder(itemIds,memberId);
        return CommonResult.success(confirmOrderResult);
    }

    @ApiOperation("根据购物车信息生成订单")
    @RequestMapping(value = "/generateOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult generateOrder(@RequestBody OrderParam orderParam,
                                      @RequestHeader("memberId") Long memberId) throws BusinessException {
        return portalOrderService.generateOrder(orderParam,memberId);
    }

    /**
     * 秒杀订单确认页
     * @param productId
     * @param memberId
     * @return
     * @throws BusinessException
     */
    @RequestMapping(value = "/{token}/generateConfirmOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult generateMiaoShaConfirmOrder(@RequestParam("productId") Long productId,
                                                    @PathVariable("token") String token,
                                                    @RequestHeader("memberId") Long memberId) throws BusinessException {
        return secKillOrderService.generateConfirmMiaoShaOrder(productId,memberId,token);
    }

    @RequestMapping(value = "/{token}/generateOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult generateMiaoShaOrder(@RequestBody OrderParam orderParam,
                                             @PathVariable("token") String token,
                                             @RequestHeader("memberId") Long memberId) throws BusinessException {
        return secKillOrderService.generateSecKillOrder(orderParam,memberId,token);
    }

    /**
     * 秒杀结果页面
     * @param memberId
     * @return
     */
    @ApiOperation("根据购物车信息生成订单")
    @GetMapping("/miaosha/result")
    @ResponseBody
    public CommonResult miaoShaResult(@RequestParam("productId") Long productId,@RequestHeader("memberId") Long memberId){
        String status = redisOpsUtil.get(RedisKeyPrefixConst.MIAOSHA_ASYNC_WAITING_PREFIX + memberId
                + ":" + productId);

        if(ObjectUtils.isEmpty(status)){
            return CommonResult.success(null,"无正在秒杀中的订单！");
        }

        if(status.equals("-1")){
            return CommonResult.success(status,"秒杀失败！");
        }

        if(status.equals("1")){
            return CommonResult.success(status,"正在排队中,请耐心等待！");
        }
        //如果Status>1，则秒杀成功,返回订单编号
        return CommonResult.success(status);
    }

    @ApiOperation("查看订单详情#杨过添加")
    @RequestMapping(value = "/orderDetail",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public CommonResult orderDetail(@RequestParam Long orderId){
        return portalOrderService.getDetailOrder(orderId);
    }

    @ApiOperation("支付成功的回调")
    @ApiImplicitParams({@ApiImplicitParam(name = "payType", value = "支付方式:0->未支付,1->支付宝支付,2->微信支付",
            allowableValues = "1,2", paramType = "query", dataType = "integer")})
    @RequestMapping(value = "/paySuccess/{payType}",method = RequestMethod.POST)
    @ResponseBody
    public void paySuccess(@PathVariable Integer payType,
                             HttpServletRequest request,
                             HttpServletResponse response) throws AlipayApiException {
        if(payType > 2 || payType < 0){
            throw new IllegalArgumentException("支付类型不正确，平台目前仅支持支付宝与微信支付");
        }
        if(payType == 1){//支付宝支付
            //1、获取request里所有与alipay相关的参数，封装成一个map
            Map<String,String> param = Maps.newHashMap();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()){
                String parameterName = parameterNames.nextElement();
                log.info("alipay callback parameters:-->"
                        +parameterName+":->" +request.getParameter(parameterName));
                if(!parameterName.toLowerCase().equals("sign_type")){
                    param.put(parameterName,request.getParameter(parameterName));
                }
            }
            // 2、验证请求是否是alipay返回的请求内容【验证请求合法性】
            // 很重要
            boolean isPassed = AlipaySignature.rsaCheckV2(param, Configs.getAlipayPublicKey(),"utf-8",Configs.getSignType());
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            if(isPassed){
                Long orderId = Long.parseLong(param.get("out_trade_no"));
                int count = portalOrderService.paySuccess(orderId,payType);
                if(count > 0){
                    log.info("支付成功，订单完成支付");
                    out.print("success");
                }else{
                    log.info("支付失败，订单未能完成支付");
                    out.print("unSuccess");
                }
            }else{
                log.info("支付失败，订单未能完成支付");
                out.print("unSuccess");
            }
        }else if(payType == 2){//微信支付

        }
    }

    @ApiOperation("自动取消超时订单")
    @RequestMapping(value = "/cancelTimeOutOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult cancelTimeOutOrder(){
        return portalOrderService.cancelTimeOutOrder();
    }

    @ApiOperation("取消单个超时订单")
    @RequestMapping(value = "/cancelOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult cancelOrder(Long orderId,@RequestHeader("memberId") Long memberId){
        //todo
        MqCancelOrder mqCancelOrder = new MqCancelOrder();
        mqCancelOrder.setMemberId(memberId);
        mqCancelOrder.setOrderId(orderId);

        portalOrderService.sendDelayMessageCancelOrder(mqCancelOrder);
        return CommonResult.success(null);
    }

    /**
     * 删除订单[逻辑删除],只能status为：3->已完成；4->已关闭；5->无效订单，才可以删除
     * ，否则只能先取消订单然后删除。
     * @param orderId
     * @return
     */
    @ApiOperation(value = "删除会员订单#杨过添加",notes = "status为：3->已完成；4->已关闭；5->无效订单，才可以删除，否则只能先取消订单然后删除")
    @RequestMapping(value = "/deleteOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult deleteOrder(Long orderId){
        int total = portalOrderService.deleteOrder(orderId);
        if(total > 0){
            return CommonResult.success("有："+total+"：条订单被删除");
        }else{
            return CommonResult.failed("订单已经被删除或者没有符合条件的订单");
        }
    }
    /**
     * 订单服务由会员服务调用，会员服务传来会员：ID
     * @param memberId
     * @param status
     *      null查询所有
     *      订单状态0->待付款；1->待发货；2->已发货；3->已完成;4->已关闭；
     * @return
     */
    @ApiOperation("会员订单查询#杨过添加")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "memberId", value = "会员ID", required = true, paramType = "query", dataType = "integer"),
            @ApiImplicitParam(name = "status", value = "订单状态:0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭",
                    allowableValues = "0,1,2,3,4", paramType = "query", dataType = "integer")})
    @RequestMapping(value = "/list/userOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<List<OmsOrderDetail>> findMemberOrderList(
            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "memberId") Long memberId,
            @RequestParam(value = "status",required = false) Integer status){
        if(memberId == null || (status!=null && status > 4)){
            return CommonResult.validateFailed();
        }
        return portalOrderService.findMemberOrderList(pageSize,pageNum,memberId,status);
    }

    /**
     * 订单支付逻辑：支付支持两种方式：alipay,wechat
     * @param orderId
     * @param payType
     * @return
     */
    @ApiOperation("订单支付#实现支付宝支付{微信支付暂未实现}")
    @ApiImplicitParams({@ApiImplicitParam(name = "payType", value = "支付方式:0->未支付,1->支付宝支付,2->微信支付",
                    allowableValues = "1,2", paramType = "query", dataType = "integer")})
    @RequestMapping(value = "/tradeQrCode",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult tradeQrCode(@RequestParam(value = "orderId") Long orderId,
                                    @RequestHeader("memberId") Long memberId,
                                    @RequestParam(value = "payType") Integer payType){
        if(payType > 2 || payType < 0){
            throw new IllegalArgumentException("支付类型不正确，平台目前仅支持支付宝与微信支付");
        }
        return tradeService.tradeQrCode(orderId,payType,memberId);
    }


    @ApiOperation("订单支付状态查询,手动查询#实现支付宝查询")
    @ApiImplicitParams({@ApiImplicitParam(name = "payType", value = "支付方式:0->未支付,1->支付宝支付,2->微信支付",
            allowableValues = "1,2", paramType = "query", dataType = "integer")})
    @RequestMapping(value = "/tradeStatusQuery",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult tradeStatusQuery(@RequestParam(value = "orderId") Long orderId,
                                         @RequestParam(value = "payType") Integer payType){

        if(payType > 2 || payType < 0){
            throw new IllegalArgumentException("支付类型不正确，平台目前仅支持支付宝与微信支付");
        }
        return tradeService.tradeStatusQuery(orderId,payType);
    }

    /*--------------------------------限流防刷部分---------------------------------------*/
    @RequestMapping(value="/token", method=RequestMethod.GET)
    @ResponseBody
    public CommonResult getMiaoshaToken(HttpServletRequest request
            , @RequestParam("productId") Long productId
            , @RequestHeader("memberId") Long memberId
            , @RequestParam Integer verifyCode) {
        /*
         * 用redis限流，限制接口1分钟最多访问10000次
         */
        String requestURI = request.getRequestURI().toString();
        Long requestNum = redisOpsUtil.incr(requestURI);
        if (requestNum == 1) {
            redisOpsUtil.expire(requestURI,60, TimeUnit.SECONDS);
        } else if (requestNum > 10000) {
            return CommonResult.failed("访问超载，请稍后再试");
        }

        String verifyCodeKey = RedisKeyPrefixConst.MIAOSHA_VERIFY_CODE_PREFIX + memberId + ":" + productId;
        /*
         * 校验验证码，防止接口被刷
         */
        Integer redisCode = redisOpsUtil.get(verifyCodeKey,Integer.class);

        if(StringUtils.isEmpty(redisCode) || !redisCode.equals(verifyCode)) {
            return CommonResult.failed("验证码错误");
        }
        //验证成功,删除该验证码
        redisOpsUtil.delete(verifyCodeKey);

        //todo 创建token
        String token = MD5.md5(UUID.randomUUID().toString());

        log.info("miaosha token:{}",token);

        redisOpsUtil.set(RedisKeyPrefixConst.MIAOSHA_TOKEN_PREFIX + memberId + ":" + productId
                ,token
                ,300
                ,TimeUnit.SECONDS);

        return CommonResult.success(token);
    }

    @RequestMapping(value="/verifyCode", method=RequestMethod.GET)
    @ResponseBody
    public CommonResult getVerifyCode(HttpServletRequest request,
                                      HttpServletResponse response,
                                      @RequestParam("productId") Long productId,
                                      @RequestHeader("memberId") Long memberId){
        try {
            VerifyCodeImgUtil.VerifyCodeInfo imageInfo = VerifyCodeImgUtil.createVerifyCode();

            log.info("验证码答案:{}",imageInfo.getResult());

            //todo 验证码答案写入到redis
            redisOpsUtil.set(RedisKeyPrefixConst.MIAOSHA_VERIFY_CODE_PREFIX + memberId + ":" + productId
                    ,imageInfo.getResult()
                    ,300
                    ,TimeUnit.SECONDS);

            response.setHeader("Content-Type", "image/jpeg");
            OutputStream out = response.getOutputStream();
            ImageIO.write(imageInfo.getBufferedImage(), "JPEG", out);
            out.flush();
            out.close();
            return null;
            /**
             * 返回图片的base64编码,js解码成图片
             */
            /*ByteArrayOutputStream baos = new ByteArrayOutputStream();//io流
            ImageIO.write(imageInfo.getBufferedImage(), "png", baos);//写入流中
            byte[] bytes = baos.toByteArray();//转换成字节
            BASE64Encoder encoder = new BASE64Encoder();
            String png_base64 =  encoder.encodeBuffer(bytes).trim();//转换成base64串
            png_base64 = png_base64.replaceAll("\n", "").replaceAll("\r", "");//删除 \r\n
            return CommonResult.success(png_base64);*/
        }catch(Exception e) {
            e.printStackTrace();
            return CommonResult.failed("秒杀失败");
        }
    }

}
