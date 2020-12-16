package com.tuling.tulingmall.portal.component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by tuling on 2018/8/24.
 * 订单超时取消并解锁库存的定时器
 */
@Slf4j
@Component
public class OrderTimeOutCancelTask {

    /*@Autowired
    private OmsPortalOrderService portalOrderService;*/

    /**
     * cron表达式：Seconds Minutes Hours DayofMonth Month DayofWeek [Year]
     * 每10分钟扫描一次，扫描设定超时时间之前下的订单，如果没支付则取消该订单
     */
    @Scheduled(cron = "0 0/10 * ? * ?")
    private void cancelTimeOutOrder(){
        //CommonResult result = portalOrderService.cancelTimeOutOrder();
    }
}
