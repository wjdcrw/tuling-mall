package com.tuling.tulingmall.component;

import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import com.tuling.tulingmall.dao.FlashPromotionProductDao;
import com.tuling.tulingmall.domain.FlashPromotionParam;
import com.tuling.tulingmall.model.SmsFlashPromotion;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.ObjectUtils;

import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * @author ：杨过
 * @date ：Created in 2020/2/18
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 将秒杀活动信息load到redis，暂时不用#{yangguo}
 **/
public class LoadSeckillProduct2Cache implements InitializingBean {

    @Autowired
    private FlashPromotionProductDao dao;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 将秒杀活动信息load到redis，暂时不用#{yangguo}
     */
    public void loadFlashPromotion2Cache(){
        /*
         * 将秒杀商品读取到缓存
         */
        if(!redisTemplate.hasKey(RedisKeyPrefixConst.FLASH_PROMOTION_PRODUCT_KEY)){
            //从dbload出所有在进行当中的秒杀产品
            FlashPromotionParam promotion = dao.getFlashPromotion(null);
            if(!ObjectUtils.isEmpty(promotion)){
                //将产品缓存到redis-hash中
                promotion.getRelation().stream().forEach(item->{
                    redisTemplate.opsForHash().put(RedisKeyPrefixConst.FLASH_PROMOTION_PRODUCT_KEY,item.getProductId(),item);
                });

                SmsFlashPromotion smsFlashPromotion = new SmsFlashPromotion();
                BeanUtils.copyProperties(promotion,smsFlashPromotion);

                redisTemplate.opsForHash().put(RedisKeyPrefixConst.FLASH_PROMOTION_PRODUCT_KEY,
                        RedisKeyPrefixConst.ACTIVE_FLASH_PROMOTION_KEY, smsFlashPromotion);

                Date now = new Date();
                Long timeout = promotion.getEndDate().getTime() - now.getTime();
                //设置key过期时间
                redisTemplate.expire(RedisKeyPrefixConst.FLASH_PROMOTION_PRODUCT_KEY,timeout, TimeUnit.MILLISECONDS);
            }
        }
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        //loadFlashPromotion2Cache();
    }
}
