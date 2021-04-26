package com.tuling.tulingmall.component.rocketmq;

import com.tuling.tulingmall.service.OmsPortalOrderService;
import com.tuling.tulingmall.service.SecKillOrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * 消费监听rocketmq-订单超时消息
 * @author yangguo
 */
@Slf4j
@Component
@RocketMQMessageListener(consumerGroup = "${rocketmq.tulingmall.cancelGroup}", topic = "${rocketmq.tulingmall.scheduleTopic}")
public class RocketMqCancelOrderReciever implements RocketMQListener<String> {

    @Autowired
    private OmsPortalOrderService omsPortalOrderService;

    @Autowired
    private SecKillOrderService secKillOrderService;

    /**
     * 延时消息,取消超时订单
     * @param cancelId
     */
    @Override
    public void onMessage(String cancelId) {
        if(StringUtils.isEmpty(cancelId)){
            return;
        }
        Long orderId = Long.parseLong(cancelId.split(":")[0]);
        Long promotionId = Long.parseLong(cancelId.split(":")[1]);
        Long productId = Long.parseLong(cancelId.split(":")[2]);
        try {
            //取消的订单,释放DB库存
            omsPortalOrderService.cancelOrder(orderId,promotionId);
            //取消的订单-还原缓存库存
            secKillOrderService.incrRedisStock(productId);
        } catch (Exception e) {
            log.error("订单取消异常 : 还原库存失败，please check:{}",e.getMessage(),e.getCause());
            throw new RuntimeException();//抛异常出去,rocketmq会重新投递
        }

    }

}
