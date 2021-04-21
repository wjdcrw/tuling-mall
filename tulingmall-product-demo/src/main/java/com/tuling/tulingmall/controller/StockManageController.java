package com.tuling.tulingmall.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.domain.CartPromotionItem;
import com.tuling.tulingmall.service.StockManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author ：杨过
 * @date ：Created in 2020/2/19
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@RestController
@RequestMapping("/stock")
public class StockManageController {

    @Autowired
    private StockManageService stockManageService;

    /**
     * 减库存
     * @param productId
     *        产品ID
     * @param skuId
     *        sku-ID
     * @param quanlity
     *        数量
     * @param miaosha
     *      1->减秒杀库存,0->减sku库存
     * @return
     */
    @RequestMapping(value = "/descStock",method = {RequestMethod.GET,RequestMethod.POST})
    public CommonResult descStock(@RequestParam Long productId, Long skuId, Integer quanlity, Integer miaosha){

        return null;
    }

    /**
     * 加库存
     * @param productId
     *        产品ID
     * @param skuId
     *        sku-ID
     * @param quanlity
     *        数量
     * @param miaosha
     *        1->加回秒杀库存,0->加回sku库存
     * @return
     */
    @RequestMapping(value = "/incrStock",method = {RequestMethod.GET,RequestMethod.POST})
    public CommonResult incrStock(@RequestParam Long productId,Long skuId,Integer quanlity,Integer miaosha){
        return null;
    }

    /**
     * 查询当前产品的库存
     * @param productId
     * @return
     */
    @RequestMapping(value = "/selectStock",method = {RequestMethod.GET,RequestMethod.POST})
    public CommonResult<Integer> selectStock(@RequestParam("productId") Long productId,@RequestParam("flashPromotionRelationId") Long flashPromotionRelationId){
        return stockManageService.selectStock(productId,flashPromotionRelationId);
    }

    /**
    * @vlog: 高于生活，源于生活
    * @desc: 类的描述:锁定库存
    * @author: smlz
    * @createDate: 2020/3/16 19:31
    * @version: 1.0
    */
    @RequestMapping("/lockStock")
    public CommonResult lockStock(@RequestBody List<CartPromotionItem> cartPromotionItemList) {
        return stockManageService.lockStock(cartPromotionItemList);
    }
}
