package com.tuling.tulingmall.feignapi.ums;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.domain.CartPromotionItem;
import com.tuling.tulingmall.domain.SmsCouponHistoryDetail;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:会员优惠卷服务
* @author: smlz
* @createDate: 2020/1/23 17:00
* @version: 1.0
*/
@FeignClient(name = "tulingmall-coupons",path = "/coupon")
public interface UmsCouponFeignApi {

    @RequestMapping(value = "/listCart", method = RequestMethod.POST)
    @ResponseBody
    CommonResult<List<SmsCouponHistoryDetail>> listCart2Feign(@RequestParam("type") Integer type,
                                                                     @RequestBody List<CartPromotionItem> cartPromotionItemList);

}
