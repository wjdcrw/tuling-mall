package com.tuling.tulingmall.service;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.SmsCouponHistory;
import com.tuling.tulingmall.domain.CartPromotionItem;
import com.tuling.tulingmall.domain.SmsCouponHistoryDetail;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户优惠券管理Service
 * Created by macro on 2018/8/29.
 */
public interface UmsCouponService {
    /**
     * 会员添加优惠券
     */
    @Transactional
    CommonResult add(Long couponId,Long memberId,String nickName);

    /**
     * 获取优惠券列表
     * @param useStatus 优惠券的使用状态
     */
    List<SmsCouponHistory> list(Integer useStatus,Long memberId);

    /**
     * 根据购物车信息获取可用优惠券
     */
    List<SmsCouponHistoryDetail> listCart(List<CartPromotionItem> cartItemList, Integer type,Long memberId);
}
