package com.tuling.config;

import com.tuling.component.TulingTokenEnhancer;
import com.tuling.component.TulingUserDetailService;
import com.tuling.properties.JwtCAProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;
import org.springframework.security.oauth2.provider.token.store.jwk.JwkTokenStore;
import org.springframework.security.rsa.crypto.KeyStoreKeyFactory;

import javax.sql.DataSource;
import java.security.KeyPair;
import java.util.Arrays;

/**
 * @Description: 认证服务器配置。认证需要知道三方面的信息：
 *                              1）用户的信息
 *                              2）微服务的信息
 *                              3）接入app的信息
 * @Author dcr
 * @Date 2020/12/12 17:58
 */
@EnableAuthorizationServer
@Configuration
@EnableConfigurationProperties(JwtCAProperties.class)
public class TulingAuthServerConfig extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private JwtCAProperties jwtCAProperties;

    @Autowired
    private TulingUserDetailService tulingUserDetailService;

    @Autowired
    private AuthenticationManager authenticationManager;

    /**
     * 认证服务器能够给哪些 客户端颁发token  我们需要把客户端的配置 存储到数据库中 可以基于内存存储和db存储
     * @param clients
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.withClientDetails(clientDetails());
    }

    /**
     * 用于查找我们第三方客户端的组件 主要用于查找 数据库表 oauth_client_details
     * @return
     */
    @Bean
    public ClientDetailsService clientDetails(){
        return new JdbcClientDetailsService(dataSource);
    }

    /**
     * @Description: 我们颁发的token通过jwt存储。四种存储方式：内存、数据库、redis、JWT
     * @Param: []
     * @return: org.springframework.security.oauth2.provider.token.TokenStore
     * @Author: dcr
     * @Date: 2020/12/12 17:59
     */
    public TokenStore tokenStore(){

        return new JwtTokenStore(jwtAccessTokenConverter());
    }

    /**
     * JWT转换器
     * @return
     */
    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter(){
        JwtAccessTokenConverter jwtAccessTokenConverter=new JwtAccessTokenConverter();
        //jwt的密钥
        jwtAccessTokenConverter.setKeyPair(keyPair());
        return jwtAccessTokenConverter;
    }

    @Bean
    public KeyPair keyPair(){
        KeyStoreKeyFactory keyStoreKeyFactory = new KeyStoreKeyFactory(new ClassPathResource(jwtCAProperties.getKeyPairName()), jwtCAProperties.getKeyPairSecret().toCharArray());
        return keyStoreKeyFactory.getKeyPair(jwtCAProperties.getKeyPairAlias(), jwtCAProperties.getKeyPairStoreSecret().toCharArray());
    }

    @Bean
    public TulingTokenEnhancer tulingTokenEnhancer(){
        return new TulingTokenEnhancer();
    }

    /**
     * @Description: 授权服务器的配置的配置
     * @Param: [endpoints]
     * @return: void
     * @Author: dcr
     * @Date: 2020/12/13 10:30
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        TokenEnhancerChain tokenEnhancerChain=new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(tulingTokenEnhancer(),jwtAccessTokenConverter()));
        endpoints.tokenStore(tokenStore())//授权服务器颁发的token 怎么存储的
                .tokenEnhancer(tokenEnhancerChain)
                .userDetailsService(tulingUserDetailService)//用户来获取token的时候需要进行账号密码
                .authenticationManager(authenticationManager);
    }


    /**
     * @Description:  授权服务器安全配置
     * @Param: [security]
     * @return: void
     * @Author: dcr
     * @Date: 2021/1/9 16:28
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        //第三方客户端校验token需要带入 clientId 和clientSecret来校验
        security .checkTokenAccess("isAuthenticated()")
                .tokenKeyAccess("isAuthenticated()");//来获取我们的tokenKey需要带入clientId,clientSecret

        security.allowFormAuthenticationForClients();
    }
}
