package com.tuling.tulingmall.service.impl;



import com.tuling.tulingmall.common.exception.BusinessException;
import com.tuling.tulingmall.mapper.OmsCartItemMapper;
import com.tuling.tulingmall.model.OmsCartItem;
import com.tuling.tulingmall.model.OmsCartItemExample;
import com.tuling.tulingmall.domain.CartProduct;
import com.tuling.tulingmall.domain.CartPromotionItem;
import com.tuling.tulingmall.feignapi.pms.PmsProductFeignApi;
import com.tuling.tulingmall.service.OmsCartItemService;
import com.tuling.tulingmall.service.OmsPromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 购物车管理Service实现类
 * Created by macro on 2018/8/2.
 */
@Service
public class OmsCartItemServiceImpl implements OmsCartItemService {
    @Autowired
    private OmsCartItemMapper cartItemMapper;

    @Autowired
    private OmsPromotionService promotionService;

    @Autowired
    private PmsProductFeignApi pmsProductFeignApi;


    @Override
    public int add(OmsCartItem cartItem,Long memberId,String nickName) {
        int count;
        cartItem.setMemberId(memberId);
        cartItem.setMemberNickname(nickName);
        cartItem.setDeleteStatus(0);
        OmsCartItem existCartItem = getCartItem(cartItem);
        if (existCartItem == null) {//创建购物车
            cartItem.setCreateDate(new Date());
            //todo 查询产品信息 需要远程调用商品服务获取，这里暂时写死
            CartProduct cartProduct = pmsProductFeignApi.getCartProduct(cartItem.getProductId()).getData();

            cartItem.setProductName(cartProduct.getName());
            cartItem.setPrice(cartProduct.getPrice());
            cartItem.setProductPic(cartProduct.getPic());
            cartItem.setProductBrand(cartProduct.getBrandName());
            cartItem.setProductCategoryId(cartProduct.getProductCategoryId());
            cartItem.setProductSn(cartProduct.getProductSn());
            cartItem.setProductSubTitle(cartProduct.getSubTitle());
            cartItem.setPrice(cartProduct.getPrice());
            //遍历产品sku，设置购买规格
            cartProduct.getSkuStockList().stream().forEach((skuItem)->{
                if(cartItem.getProductSkuId() == skuItem.getId()){
                    cartItem.setSp1(skuItem.getSp1());
                    cartItem.setSp2(skuItem.getSp2());
                    cartItem.setSp3(skuItem.getSp3());
                    cartItem.setProductPic(skuItem.getPic());
                    cartItem.setPrice(skuItem.getPrice());
                    cartItem.setProductSkuCode(skuItem.getSkuCode());
                    //product_attr,此处有设计缺陷，不太好拿，暂时留空
                }
            });
            count = cartItemMapper.insert(cartItem);
        } else {
            cartItem.setModifyDate(new Date());
            existCartItem.setQuantity(existCartItem.getQuantity() + cartItem.getQuantity());
            count = cartItemMapper.updateByPrimaryKey(existCartItem);
        }
        return count;
    }

    /**
     * 购物车产品数量
     * @return
     */
    public Long cartItemCount(){
        return cartItemMapper.countByExample(new OmsCartItemExample());
    }

    /**
     * 根据会员id,商品id和规格获取购物车中商品
     */
    private OmsCartItem getCartItem(OmsCartItem cartItem) {
        OmsCartItemExample example = new OmsCartItemExample();
        OmsCartItemExample.Criteria criteria = example.createCriteria().andMemberIdEqualTo(cartItem.getMemberId())
                .andProductIdEqualTo(cartItem.getProductId()).andDeleteStatusEqualTo(0);
        if (!StringUtils.isEmpty(cartItem.getSp1())) {
            criteria.andSp1EqualTo(cartItem.getSp1());
        }
        if (!StringUtils.isEmpty(cartItem.getSp2())) {
            criteria.andSp2EqualTo(cartItem.getSp2());
        }
        if (!StringUtils.isEmpty(cartItem.getSp3())) {
            criteria.andSp3EqualTo(cartItem.getSp3());
        }
        List<OmsCartItem> cartItemList = cartItemMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(cartItemList)) {
            return cartItemList.get(0);
        }
        return null;
    }


    @Override
    public List<OmsCartItem> list(Long memberId) {
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andMemberIdEqualTo(memberId);
        return cartItemMapper.selectByExample(example);
    }

    /**
     * 获取被选择的包含促销活动信息的购物车列表
     * add by yangguo
     * @param memberId
     * @param itemIds
     * @return
     */
    public List<CartPromotionItem> listSelectedPromotion(Long memberId, List<Long> itemIds) throws BusinessException {
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria()
                .andDeleteStatusEqualTo(0)
                .andMemberIdEqualTo(memberId)
                .andIdIn(itemIds);
        List<OmsCartItem> cartItemList = cartItemMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(cartItemList)){
            throw new BusinessException("没有选择购物车购买的商品!");
        }
        List<CartPromotionItem> cartPromotionItemList = new ArrayList<>();
        if(!CollectionUtils.isEmpty(cartItemList)){
            cartPromotionItemList = promotionService.calcCartPromotion(cartItemList);
        }
        return cartPromotionItemList;
    }

    @Override
    public List<CartPromotionItem> listPromotion(Long memberId) {
        List<OmsCartItem> cartItemList = list(memberId);
        List<CartPromotionItem> cartPromotionItemList = new ArrayList<>();
        if(!CollectionUtils.isEmpty(cartItemList)){
            cartPromotionItemList = promotionService.calcCartPromotion(cartItemList);
        }
        return cartPromotionItemList;
    }

    @Override
    public int updateQuantity(Long id, Long memberId, Integer quantity) {
        OmsCartItem cartItem = new OmsCartItem();
        cartItem.setQuantity(quantity);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andDeleteStatusEqualTo(0)
                .andIdEqualTo(id).andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(cartItem, example);
    }

    @Override
    public int delete(Long memberId, List<Long> ids) {
        OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andIdIn(ids).andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record, example);
    }

    @Override
    public CartProduct getCartProduct(Long productId) {

        return pmsProductFeignApi.getCartProduct(productId).getData();
    }

    @Override
    public int updateAttr(OmsCartItem cartItem,Long memberId,String nickName) {
        //删除原购物车信息
        OmsCartItem updateCart = new OmsCartItem();
        updateCart.setId(cartItem.getId());
        updateCart.setModifyDate(new Date());
        updateCart.setDeleteStatus(1);
        cartItemMapper.updateByPrimaryKeySelective(updateCart);
        cartItem.setId(null);
        add(cartItem,memberId,nickName);
        return 1;
    }

    @Override
    public int clear(Long memberId) {
        OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record,example);
    }
}
