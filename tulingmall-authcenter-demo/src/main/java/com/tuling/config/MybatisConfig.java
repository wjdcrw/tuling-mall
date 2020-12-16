package com.tuling.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = {"com.tuling.tulingmall.mapper","com.tuling.tulingmall.portal.dao"})
public class MybatisConfig {
}
