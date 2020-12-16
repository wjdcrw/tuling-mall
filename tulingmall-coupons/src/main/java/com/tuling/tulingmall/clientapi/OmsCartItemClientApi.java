package com.tuling.tulingmall.clientapi;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.clientapi.interceptor.config.FeignConfig;
import com.tuling.tulingmall.domain.CartPromotionItem;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:远程调用订单中心购物车详细客户端
* @author: smlz
* @createDate: 2020/1/14 22:17
* @version: 1.0
*/
@FeignClient(name = "tulingmall-order",configuration = FeignConfig.class)
public interface OmsCartItemClientApi {

    @RequestMapping(value = "/cart/list/promotion", method = RequestMethod.GET)
    @ResponseBody
    CommonResult<List<CartPromotionItem>> listPromotionByMemberId();

}
