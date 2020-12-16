package com.tuling.tulingmall.service.impl;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.mapper.OmsOrderMapper;
import com.tuling.tulingmall.model.OmsOrder;
import com.tuling.tulingmall.model.OmsOrderExample;
import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.transaction.annotation.ShardingTransactionType;
import org.apache.shardingsphere.transaction.core.TransactionType;
import org.apache.shardingsphere.transaction.core.TransactionTypeHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * ,;,,;
 * ,;;'(    社
 * __      ,;;' ' \   会
 * /'  '\'~~'~' \ /'\.)  主
 * ,;(      )    /  |.     义
 * ,;' \    /-.,,(   ) \    码
 * ) /       ) / )|    农
 * ||        ||  \)
 * (_\       (_\
 *
 * @author ：杨过
 * @date ：Created in 2020/3/19
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Slf4j
@Service
public class Transaction2PcServiceImpl {

    @Autowired
    private OmsOrderMapper orderMapper;

    @Autowired
    private DataSource dataSource;

    @Transactional
    @ShardingTransactionType(TransactionType.XA)
    public CommonResult insertOrder(){
        OmsOrder omsOrder = new OmsOrder();
        omsOrder.setMemberId(1L);
        omsOrder.setReceiverName("yangguo");
        omsOrder.setReceiverPhone("10101010");
        omsOrder.setDeleteStatus(0);

        try {
            orderMapper.insertSelective(omsOrder);
            log.info("yangguo snowflake-id:{}",omsOrder.getId());
        } catch (Exception e) {
            log.error("yangguo insert error:",e.getMessage(),e.getCause());
            throw new RuntimeException("insert yangguo 异常");
        }
        omsOrder = new OmsOrder();
        omsOrder.setMemberId(4L);
        omsOrder.setReceiverName("xiaolongnv");
        omsOrder.setReceiverPhone("11111111111111111111111111111111111");
        omsOrder.setDeleteStatus(111);

        try{
            orderMapper.insertSelective(omsOrder);
            log.info("xiaolongnv snowflake-id:{}",omsOrder.getId());
        } catch (Exception e) {
            log.error("xiaolongnv snowflake-id:{} insert error:{},cause:{}",omsOrder.getId(),e.getMessage(),e.getCause());
            throw new RuntimeException("insert xiaolongnv 异常");
        }
        return CommonResult.success(null);
    }

    public CommonResult selectOrder(Long memberId){
        OmsOrderExample omsOrderExample = new OmsOrderExample();
        omsOrderExample.createCriteria()
                .andMemberIdEqualTo(memberId)
                .andIdBetween(10L,20L);
        //.andIdIn(CollectionUtils.arrayToList(new Long[]{99L,74L,68L}));
        return CommonResult.success(orderMapper.selectByExample(omsOrderExample));
    }

}
