package com.tuling.tulingmall.component.rocketmq;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import com.tuling.tulingmall.feignapi.pms.PmsProductFeignApi;
import com.tuling.tulingmall.util.RedisOpsUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
 * @date ：Created in 2020/3/9 14:21
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Slf4j
@Component
@RocketMQMessageListener(topic = "stock-sync",consumerGroup = "stock-sync-worker")
public class StockSyncReciever implements RocketMQListener<String> {

    @Autowired
    private RedisOpsUtil redisOpsUtil;

    @Autowired
    private PmsProductFeignApi stockManageFeignApi;

    @Override
    public void onMessage(String message) {
        String[] param = message.split(":");
        if(param.length <= 1){
            log.error("库存同步，消费消息参数不完整!");
            return;
        }
        Long productID = Long.parseLong(param[0]);
        Long promotionId =  Long.parseLong(param[1]);
        /*
         * 有此标记,代表还没有做同步,需要同步DB到redis,如果标记被删除说明肯定不久前
         * 刚刚同步过。同步过就没有必要多次去同步，多条同步延时消息来源于高并发下发送
         * 库存同步消息。这里任然没有办法绝对避免多次查询DB，但是可以大大减少查询次数.
         */
        if(redisOpsUtil.hasKey(RedisKeyPrefixConst.STOCK_REFRESHED_MESSAGE_PREFIX + promotionId)){
            log.info("start sync mysql stock to redis");
            //todo 同步一下库存到缓存当中
            Integer stock = stockManageFeignApi.selectStock(productID,promotionId).getData();
            if(stock > 0){
                //重置库存
                redisOpsUtil.set(RedisKeyPrefixConst.MIAOSHA_STOCK_CACHE_PREFIX + productID,stock);
                //删除同步标记
                redisOpsUtil.delete(RedisKeyPrefixConst.STOCK_REFRESHED_MESSAGE_PREFIX + promotionId);
            }
        }
    }

}
