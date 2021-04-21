package com.tuling.tulingmall.dao;

import com.tuling.tulingmall.domain.FlashPromotionParam;
import com.tuling.tulingmall.domain.FlashPromotionProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 首页内容管理自定义Dao
 * Created by macro on 2019/1/28.
 */
public interface FlashPromotionProductDao {

    /**
     * 获取秒杀商品
     * @param flashPromotionId 秒杀活动ID，关联秒杀活动设置
     * @param sessionId 场次活动ID，for example：13:00-14:00场等
     */
    List<FlashPromotionProduct> getFlashProductList(@Param("flashPromotionId") Long flashPromotionId, @Param("sessionId") Long sessionId);


    List<FlashPromotionProduct> getHomePromotionProductList(@Param("promotionIds") List<Long> promotionIds);

    /**
     * 查找所有的秒杀活动商品
     * @return
     */
    FlashPromotionParam getFlashPromotion(@Param("pid") Long pid);
}
