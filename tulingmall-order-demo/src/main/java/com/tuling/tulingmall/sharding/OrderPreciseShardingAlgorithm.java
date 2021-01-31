package com.tuling.tulingmall.sharding;

import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.api.sharding.standard.PreciseShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.PreciseShardingValue;

import java.util.Collection;

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
 * @date ：Created in 2020/4/27 9:49
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 精确分片算法，支持=,in查询，结合standardShardingStrategy标准分片策略使用
 * 只支持单分片字段条件路由，不支持多分片字段
 **/
@Slf4j
public class OrderPreciseShardingAlgorithm implements PreciseShardingAlgorithm {
    @Override
    public String doSharding(Collection collection, PreciseShardingValue preciseShardingValue) {

        // 真实节点
        collection.stream().forEach((item)->{
            log.info("actual node table:{}",item);
        });

        log.info("logic table name:{},rout column:{}",preciseShardingValue.getLogicTableName(),preciseShardingValue.getColumnName());

        //精确分片
        log.info("column value:{}",preciseShardingValue.getValue());
        return null;
    }
}
