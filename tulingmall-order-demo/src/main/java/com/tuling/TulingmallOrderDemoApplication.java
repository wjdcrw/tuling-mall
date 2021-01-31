package com.tuling;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableFeignClients
public class TulingmallOrderDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(TulingmallOrderDemoApplication.class, args);
	}

}
