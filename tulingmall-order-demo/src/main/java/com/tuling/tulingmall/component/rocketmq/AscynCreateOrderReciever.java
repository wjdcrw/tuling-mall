package com.tuling.tulingmall.component.rocketmq;

import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import com.tuling.tulingmall.component.LocalCache;
import com.tuling.tulingmall.domain.OrderMessage;
import com.tuling.tulingmall.service.SecKillOrderService;
import com.tuling.tulingmall.util.RedisOpsUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.concurrent.TimeUnit;

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
 * @date ：Created in 2020/2/27 13:19
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 消费监听rocketmq-订单超时消息
 **/
@Slf4j
@Component
@RocketMQMessageListener(topic = "${rocketmq.tulingmall.asyncOrderTopic}",consumerGroup = "${rocketmq.tulingmall.asyncOrderGroup}")
public class AscynCreateOrderReciever implements RocketMQListener<OrderMessage> {

    @Autowired
    private SecKillOrderService secKillOrderService;

    @Autowired
    private RedisOpsUtil redisOpsUtil;

    @Autowired
    private LocalCache<Object> cache;

    /**
     * 异步下单消费消息
     * @param orderMessage
     */
    @Override
    public void onMessage(OrderMessage orderMessage) {
        log.info("listen the rocketmq message");
        Long memberId = orderMessage.getOrder().getMemberId();
        Long productId = orderMessage.getOrderItem().getProductId();
        //订单编号,分库分表不用该编号做订单结果标记
        String orderSn = orderMessage.getOrder().getOrderSn();
        Integer limit = orderMessage.getFlashPromotionLimit();
        Date endDate = orderMessage.getFlashPromotionEndDate();

        try {
            Long orderId = secKillOrderService.asyncCreateOrder(orderMessage.getOrder(),orderMessage.getOrderItem(),orderMessage.getFlashPromotionRelationId());

            //更改排队标记状态,代表已经下单成功,ID设置为snowflake后,用ID作为状态标记
            redisOpsUtil.set(RedisKeyPrefixConst.MIAOSHA_ASYNC_WAITING_PREFIX + memberId
                    + ":" + productId,orderId.toString(),60L, TimeUnit.SECONDS);

            /*
             * 设置用户购买次数,(不限制购买次数了,需要可自行放开此处,
             * 并在secKillOrderService.checkConfirm中加入验证)
             */
            /*Integer rebuy = redisOpsUtil.get(RedisKeyPrefixConst.MEMBER_BUYED_MIAOSHA_PREFIX + memberId + ":" + productId,Integer.class);

            if(rebuy != null){
                redisOpsUtil.decr(RedisKeyPrefixConst.MEMBER_BUYED_MIAOSHA_PREFIX + memberId + ":" + productId);
            }else{
                //剩余时间
                Date now = new Date();
                Long expired = endDate.getTime()-now.getTime();
                //打上购买次数标记
                redisOpsUtil.set(RedisKeyPrefixConst.MEMBER_BUYED_MIAOSHA_PREFIX + memberId + ":" + productId,limit-1
                        ,expired,TimeUnit.MILLISECONDS);
            }*/
        } catch (Exception e) {
            log.error(e.getMessage(),e.getCause());
            /*
             * 下单失败
             */
            redisOpsUtil.set(RedisKeyPrefixConst.MIAOSHA_ASYNC_WAITING_PREFIX + memberId
                    + ":" + productId,Integer.toString(-1),60L, TimeUnit.SECONDS);
            //还原预减库存
            secKillOrderService.incrRedisStock(productId);
            //清除掉本地guava-cache已经售完的标记
            cache.remove(RedisKeyPrefixConst.MIAOSHA_STOCK_CACHE_PREFIX + productId);
            //通知服务群,清除本地售罄标记缓存
            if(secKillOrderService.shouldPublishCleanMsg(productId)) {
                redisOpsUtil.publish("cleanNoStockCache", productId);
            }
        }
    }

}
