package com.tuling.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "tuling.jwt")
@Data
public class JwtCAProperties {
    private String keyPairName;
    private String keyPairAlias;
    private String keyPairSecret;
    private String keyPairStoreSecret;
}
