package com.tuling.tulingmall.dto;

import com.tuling.tulingmall.model.OmsOrder;
import com.tuling.tulingmall.model.OmsOrderItem;
import com.tuling.tulingmall.model.OmsOrderOperateHistory;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 订单详情信息
 * Created on 2018/10/11.
 */
public class OmsOrderDetail extends OmsOrder {
    @Getter
    @Setter
    private List<OmsOrderItem> orderItemList;
    @Getter
    @Setter
    private List<OmsOrderOperateHistory> historyList;
}
