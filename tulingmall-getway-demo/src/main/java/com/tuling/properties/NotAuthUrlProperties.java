package com.tuling.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.LinkedHashSet;

@Data
@Component
@ConfigurationProperties(prefix = "tuling.getway")
public class NotAuthUrlProperties {
    private LinkedHashSet<String> shouldSkipUrls;
}
