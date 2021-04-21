package com.tuling.tulingmall.config;

import com.tuling.tulingmall.component.zklock.ZKLock;
import com.tuling.tulingmall.component.zklock.ZKLockImpl;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.RetryNTimes;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author ：杨过
 * @date ：Created in 2020/2/20
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: zookeeper配置
 **/
@Configuration
public class ZkCuratorConfig {
    @Value("${zk.curator.retryCount}")
    private int retryCount;
    @Value("${zk.curator.elapsedTimeMs}")
    private int elapsedTimeMs;
    @Value("${zk.curator.connectUrl}")
    private String connectUrl;
    @Value("${zk.curator.sessionTimeOutMs}")
    private int sessionTimeOutMs;
    @Value("${zk.curator.connectionTimeOutMs}")
    private int connectionTimeOutMs;

    /**
     * 初始化客户端
     * @return
     */
    @Bean(initMethod = "start",destroyMethod = "close")
    public CuratorFramework curatorFramework(){
        return CuratorFrameworkFactory.newClient(
                connectUrl
                , sessionTimeOutMs
                , connectionTimeOutMs
                , new RetryNTimes(retryCount,elapsedTimeMs));
    }

    @Bean
    public ZKLock zkLock(){
        return new ZKLockImpl();
    }
}
