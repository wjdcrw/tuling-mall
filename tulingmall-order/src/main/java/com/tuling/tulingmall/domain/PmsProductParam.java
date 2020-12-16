package com.tuling.tulingmall.domain;

import com.tuling.tulingmall.model.*;
import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 创建和修改商品时使用的参数
 * Created by tuling on 2018/4/26.
 */
public class PmsProductParam extends PmsProduct {
    @ApiModelProperty("商品阶梯价格设置")
    private List<PmsProductLadder> productLadderList;
    @ApiModelProperty("商品满减价格设置")
    private List<PmsProductFullReduction> productFullReductionList;
    @ApiModelProperty("商品会员价格设置")
    private List<PmsMemberPrice> memberPriceList;
    @ApiModelProperty("商品的sku库存信息")
    private List<PmsSkuStock> skuStockList;
    @ApiModelProperty("商品参数及自定义规格属性")
    private List<PmsProductAttributeValue> productAttributeValueList;
    //秒杀活动信息
    /**
     * 秒杀活动价格
     */
    private BigDecimal flashPromotionPrice;
    /**
     * 活动商品库存数
     */
    private Integer flashPromotionCount;
    /**
     * 活动限购数量
     */
    private Integer flashPromotionLimit;
    /**
     * 秒杀活动状态
     * 0->关闭，1->开启
     */
    private Integer flashPromotionStatus;
    /**
     * 秒杀活动开始日期
     */
    private Date flashPromotionStartDate;
    /**
     * 秒杀活动结束日期
     */
    private Date flashPromotionEndDate;
    /**
     * 秒杀活动记录-对应记录存有库存，限购数量，秒杀价格信息
     */
    private Long flashPromotionRelationId;

    public Long getFlashPromotionRelationId() {
        return flashPromotionRelationId;
    }

    public void setFlashPromotionRelationId(Long flashPromotionRelationId) {
        this.flashPromotionRelationId = flashPromotionRelationId;
    }

    public BigDecimal getFlashPromotionPrice() {
        return flashPromotionPrice;
    }

    public void setFlashPromotionPrice(BigDecimal flashPromotionPrice) {
        this.flashPromotionPrice = flashPromotionPrice;
    }

    public Integer getFlashPromotionCount() {
        return flashPromotionCount;
    }

    public void setFlashPromotionCount(Integer flashPromotionCount) {
        this.flashPromotionCount = flashPromotionCount;
    }

    public Integer getFlashPromotionLimit() {
        return flashPromotionLimit;
    }

    public void setFlashPromotionLimit(Integer flashPromotionLimit) {
        this.flashPromotionLimit = flashPromotionLimit;
    }

    public Integer getFlashPromotionStatus() {
        return flashPromotionStatus;
    }

    public void setFlashPromotionStatus(Integer flashPromotionStatus) {
        this.flashPromotionStatus = flashPromotionStatus;
    }

    public Date getFlashPromotionStartDate() {
        return flashPromotionStartDate;
    }

    public void setFlashPromotionStartDate(Date flashPromotionStartDate) {
        this.flashPromotionStartDate = flashPromotionStartDate;
    }

    public Date getFlashPromotionEndDate() {
        return flashPromotionEndDate;
    }

    public void setFlashPromotionEndDate(Date flashPromotionEndDate) {
        this.flashPromotionEndDate = flashPromotionEndDate;
    }

    public List<PmsProductLadder> getProductLadderList() {
        return productLadderList;
    }

    public void setProductLadderList(List<PmsProductLadder> productLadderList) {
        this.productLadderList = productLadderList;
    }

    public List<PmsProductFullReduction> getProductFullReductionList() {
        return productFullReductionList;
    }

    public void setProductFullReductionList(List<PmsProductFullReduction> productFullReductionList) {
        this.productFullReductionList = productFullReductionList;
    }

    public List<PmsMemberPrice> getMemberPriceList() {
        return memberPriceList;
    }

    public void setMemberPriceList(List<PmsMemberPrice> memberPriceList) {
        this.memberPriceList = memberPriceList;
    }

    public List<PmsSkuStock> getSkuStockList() {
        return skuStockList;
    }

    public void setSkuStockList(List<PmsSkuStock> skuStockList) {
        this.skuStockList = skuStockList;
    }

    public List<PmsProductAttributeValue> getProductAttributeValueList() {
        return productAttributeValueList;
    }

    public void setProductAttributeValueList(List<PmsProductAttributeValue> productAttributeValueList) {
        this.productAttributeValueList = productAttributeValueList;
    }
}
