package com.tuling.tulingmall.util;

import com.google.common.hash.BloomFilter;
import com.google.common.hash.Funnels;

import java.nio.charset.StandardCharsets;

/**
 *
 * @author ：杨过
 * @date ：Created in 2020/2/18
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 布隆过滤器-数字指纹存储在当前jvm当中
 **/
public class LocalBloomFilter {

    private static final BloomFilter<String> bloomFilter = BloomFilter.create(Funnels.stringFunnel(StandardCharsets.UTF_8),1000000,0.01);

    /**
     * 谷歌guava布隆过滤器
     * @param id
     * @return
     */
    public static boolean match(String id){
        return bloomFilter.mightContain(id);
    }

    public static void put(Long id){
        bloomFilter.put(id+"");
    }
}
