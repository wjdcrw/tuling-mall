package com.tuling.tulingmall.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * MyBatis配置类
 * Created on 2019/4/8.
 */
@Configuration
@EnableTransactionManagement
//@MapperScan({"com.macro.mall.mapper","com.macro.mall.dao"})
@MapperScan({"com.tuling.tulingmall.mapper","com.tuling.tulingmall.dao"})
public class MyBatisConfig {
}
