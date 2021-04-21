package com.tuling.tulingmall.component;

import com.google.common.base.Preconditions;
import com.tuling.tulingmall.util.BloomFilterHelper;
import org.springframework.data.redis.core.RedisTemplate;

/**
 *
 * @author ：杨过
 * @date ：Created in 2020/2/18
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 布隆过滤器service
 **/
public class BloomRedisService {

    private RedisTemplate<String, Object> redisTemplate;

    private BloomFilterHelper bloomFilterHelper;

    public void setBloomFilterHelper(BloomFilterHelper bloomFilterHelper) {
        this.bloomFilterHelper = bloomFilterHelper;
    }

    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    /**
     * 根据给定的布隆过滤器添加值
     */
    public <T> void addByBloomFilter(String key, T value) {
        Preconditions.checkArgument(bloomFilterHelper != null, "bloomFilterHelper不能为空");
        int[] offset = bloomFilterHelper.murmurHashOffset(value);
        for (int i : offset) {
            redisTemplate.opsForValue().setBit(key, i, true);
        }
    }

    /**
     * 根据给定的布隆过滤器判断值是否存在
     */
    public <T> boolean includeByBloomFilter(String key, T value) {
        Preconditions.checkArgument(bloomFilterHelper != null, "bloomFilterHelper不能为空");
        int[] offset = bloomFilterHelper.murmurHashOffset(value);
        for (int i : offset) {
            if (!redisTemplate.opsForValue().getBit(key, i)) {
                return false;
            }
        }
        return true;
    }
}
