package com.tuling.tulingmall.config;

import com.tuling.tulingmall.Component.TulingRestTemplate;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by smlz on 2019/12/26.
 */
@Configuration
public class RibbonConfig {

    /**
     * 方法实现说明:原生的RestTemplate +@LB不行 因为在
     * InitializingBean方法执行前我们的RestTemplate还没有被增强
     * 需要自己改写RestTemplate
     * @author:smlz
     * @return:
     * @exception:
     * @date:2020/1/22 14:28
     */
    @Bean
    public TulingRestTemplate restTemplate(DiscoveryClient discoveryClient) {
        return new TulingRestTemplate(discoveryClient);
    }
}
