package com.tuling.tulingmall.sharding;

import com.google.common.collect.Range;
import org.apache.shardingsphere.api.sharding.complex.ComplexKeysShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.complex.ComplexKeysShardingValue;

import java.util.ArrayList;
import java.util.Collection;
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
 * @date ：Created in 2020/4/27 9:47
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 复合分片算法配合复合策略使用，支持范围与精确查询
 **/
public class OrderComplexShardingAlgorithm implements ComplexKeysShardingAlgorithm {



    @Override
    public Collection<String> doSharding(Collection collection, ComplexKeysShardingValue complexKeysShardingValue) {
        //Collection有多少张表
        //collection:真实的节点oms_order_0,oms_order_1

        collection.stream().forEach((item)->{
            System.out.println("item:)"+item);
        });

        List<String> list = new ArrayList<>();
        /**
         * 范围查询
         */
        Range range =  (Range)complexKeysShardingValue.getColumnNameAndRangeValuesMap().get("id");

        /*google guava Range定义了连续跨度的范围边界，这个连续跨度是一个可以比较的类型(Comparable type)。比如1到100之间的整型数据。

　　     在数学里面的范围是有边界和无边界之分的；同样，在Guava中也有这个说法。如果这个范围是有边界的，那么这个范围又可以
        分为包括开集（不包括端点）和闭集（包括端点）；如果是无解的可以用+∞表示。如果枚举的话，一共有九种范围表示：

        概念	       表示范围	        guava对应功能方法
        (a..b)	{x | a < x < b}	    open(C, C)
        [a..b]	{x | a <= x <= b} 	closed(C, C)
        [a..b)	{x | a <= x < b}	closedOpen(C, C)
        (a..b]	{x | a < x <= b}	openClosed(C, C)
        (a..+∞)	{x | x > a}	        greaterThan(C)
        [a..+∞)	{x | x >= a}	    atLeast(C)
        (-∞..b)	{x | x < b}	        lessThan(C)
        (-∞..b]	{x | x <= b}	    atMost(C)
        (-∞..+∞)	all values	    all()*/

        Range rangeBase = Range.closed(1,10000);
        /**
         * 让所有1<= X <= 10000的数据落到table_0表上,分库分表规则就这么简单制定好了
         * so easy add by <author>yangguo<author/>,这里可以根据复杂业务的分库分表
         * 不断的迭代根据需求去做
         */
        if(rangeBase.encloses(range)){
            list.add("table_0");
        }
        return list;
    }

    
}
