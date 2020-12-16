package com.tuling.tulingmall.properties;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.LinkedHashSet;


/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:网关跳过认证的配置类
* @author: smlz
* @createDate: 2020/1/22 10:56
* @version: 1.0
*/
@Data
@ConfigurationProperties("tuling.gateway")
public class NotAuthUrlProperties {

    private LinkedHashSet<String> shouldSkipUrls;
}
