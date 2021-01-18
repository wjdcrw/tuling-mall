package com.tuling.filter;

import com.alibaba.fastjson.JSON;
import com.tuling.component.TulingRestTemplate;
import com.tuling.properties.NotAuthUrlProperties;
import com.tuling.tulingmall.common.api.ResultCode;
import com.tuling.tulingmall.common.exception.GateWayException;
import com.tuling.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.lang.annotation.Annotation;
import java.security.PublicKey;
import java.util.Map;

/**
 * @Description: 全局过滤器
 * @Author dcr
 * @Date 2020/12/13 11:16
 */
@Component
@Slf4j
public class GlobalAuthFilter implements GlobalFilter, Ordered, InitializingBean {

    /**
     * 拿到公钥
     */
    private PublicKey publicKey;

    @Autowired
    private TulingRestTemplate tulingRestTemplate;

    @Autowired
    private NotAuthUrlProperties notAuthUrlProperties;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //当前请求的uri
        String currentUrl = exchange.getRequest().getURI().getPath();

        // 不应该拦截的路径
        if(shouldSkip(currentUrl)){
            log.info("跳过拦截路径:{}",currentUrl);
            return chain.filter(exchange);
        }

        log.info("需要认证的URL:{}",currentUrl);

        //1、解析出Authorization的请求头是否为空
        String authorization = exchange.getRequest().getHeaders().getFirst("Authorization");

        //2、判断Authorization的请求头是否为空
        if (StringUtils.isEmpty(authorization)){
            log.warn("需要认证的url，请求头为空");
            throw new GateWayException(ResultCode.AUTHORIZATION_HEADER_IS_EMPTY);
        }
        //3、校验jwt
        Claims claims=JwtUtils.validateJwtToken(authorization,this.publicKey);

        //4、把从jwt中解析出来的 用户登陆信息存储到请求头中
        ServerWebExchange webExchange = wrapHeader(exchange,claims);
        return chain.filter(webExchange);
    }


    /**
     * 方法实现说明:把我们从jwt解析出来的用户信息存储到请求中
     */
    private ServerWebExchange wrapHeader(ServerWebExchange serverWebExchange,Claims claims) {

        String loginUserInfo = JSON.toJSONString(claims);

        //log.info("jwt的用户信息:{}",loginUserInfo);
        String memberId = claims.get("additionalInfo", Map.class).get("memberId").toString();
        String nickName = claims.get("additionalInfo",Map.class).get("nickName").toString();

        //向headers中放文件，记得build
        ServerHttpRequest request = serverWebExchange.getRequest().mutate()
                .header("username",claims.get("user_name",String.class))
                .header("memberId",memberId)
                .header("nickName",nickName)
                .build();

        //将现在的request 变成 change对象
        return serverWebExchange.mutate().request(request).build();
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

    @Override
    public void afterPropertiesSet() throws Exception {
        this.publicKey= JwtUtils.genPulicKey(tulingRestTemplate);
    }
}
