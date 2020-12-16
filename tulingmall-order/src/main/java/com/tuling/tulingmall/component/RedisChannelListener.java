package com.tuling.tulingmall.component;

import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.lang.Nullable;

import java.nio.charset.StandardCharsets;

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
 * @date ：Created in 2020/4/17 19:20
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 
 **/
@Slf4j
public class RedisChannelListener implements MessageListener {

    @Autowired
    private LocalCache localCache;

    @Override
    public void onMessage(Message message, @Nullable byte[] pattern) {
        log.info("sub message :) channel[cleanNoStockCache] !");
        String productId = new String(message.getBody(), StandardCharsets.UTF_8);
        localCache.remove(RedisKeyPrefixConst.MIAOSHA_STOCK_CACHE_PREFIX + productId);
    }

}
