package com.tuling.tulingmall.domain;

import lombok.Data;

/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:mq取消订单封装对象
* @author: smlz
* @createDate: 2020/1/23 17:26
* @version: 1.0
*/
@Data
public class MqCancelOrder {

    private Long orderId;

    private Long memberId;
}
