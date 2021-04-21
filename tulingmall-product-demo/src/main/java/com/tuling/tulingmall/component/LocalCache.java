package com.tuling.tulingmall.component;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.tuling.tulingmall.domain.PmsProductParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.concurrent.TimeUnit;

/**
 * @description: 缓存管理工具，采用LRU淘汰策略
 **/
@Slf4j
@Component
public class LocalCache {

    private Cache<String,PmsProductParam> localCache = null;

    @PostConstruct
    private void init(){
        localCache = CacheBuilder.newBuilder()
                //设置本地缓存容器的初始容量
                .initialCapacity(10)
                //设置本地缓存的最大容量
                .maximumSize(500)
                //设置写缓存后多少秒过期
                .expireAfterWrite(60, TimeUnit.SECONDS).build();
    }


    public void setLocalCache(String key,PmsProductParam object){
        localCache.put(key,object);
    }

    public PmsProductParam get(String key){
       return localCache.getIfPresent(key);
    }

}
