package com.tuling.tulingmall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDiscoveryClient
public class TulingmallProductDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(TulingmallProductDemoApplication.class, args);
	}

}
