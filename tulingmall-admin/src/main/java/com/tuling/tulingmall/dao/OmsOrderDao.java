package com.tuling.tulingmall.dao;

import com.tuling.tulingmall.dto.OmsOrderDeliveryParam;
import com.tuling.tulingmall.dto.OmsOrderDetail;
import com.tuling.tulingmall.dto.OmsOrderQueryParam;
import com.tuling.tulingmall.model.OmsOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 订单自定义查询Dao
 * Created on 2018/10/12.
 */
public interface OmsOrderDao {
    /**
     * 条件查询订单
     */
    List<OmsOrder> getList(@Param("queryParam") OmsOrderQueryParam queryParam);

    /**
     * 批量发货
     */
    int delivery(@Param("list") List<OmsOrderDeliveryParam> deliveryParamList);

    /**
     * 获取订单详情
     */
    OmsOrderDetail getDetail(@Param("id") Long id);
}
