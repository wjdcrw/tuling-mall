package com.tuling;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class TulingmallCouponsApplication {

	public static void main(String[] args) {
		SpringApplication.run(TulingmallCouponsApplication.class, args);
	}

}
