package com.tuling.tulingmall.portal.feignapi.pms;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.portal.domain.FlashPromotionProduct;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
 * @date ：Created in 2020/3/2 15:52
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 
 **/
@FeignClient(name = "tulingmall-product",path = "/pms")
public interface PmsProductFeignApi {
    
    @RequestMapping(value = "/flashPromotion/getHomeSecKillProductList", method = RequestMethod.GET)
    @ResponseBody
    CommonResult<List<FlashPromotionProduct>> getHomeSecKillProductList();
}
