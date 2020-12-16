package com.tuling;

import com.tuling.properties.NotAuthUrlProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.lang.annotation.Annotation;

/**
 * @Description: 全局过滤器
 * @Author dcr
 * @Date 2020/12/13 11:16
 */
@Component
@Slf4j
public class GlobalAuthFilter implements GlobalFilter, Ordered {

    @Autowired
    private NotAuthUrlProperties notAuthUrlProperties;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String currentUrl = exchange.getRequest().getURI().getPath();

        // 不应该拦截的路径
        if(shouldSkip(currentUrl)){

        }
        return null;
    }

    /** 
     * @Description: 不需要授权的路径
     * @Param: [currentUrl] 
     * @return: boolean 
     * @Author: dcr
     * @Date: 2020/12/13 11:22
     */
    public boolean shouldSkip(String currentUrl){
        PathMatcher pathMatcher=new AntPathMatcher();
        for (String skipPath:notAuthUrlProperties.getShouldSkipUrls()){
            if (pathMatcher.match(skipPath,currentUrl)){
                return true;
            }
        }
        return false;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
