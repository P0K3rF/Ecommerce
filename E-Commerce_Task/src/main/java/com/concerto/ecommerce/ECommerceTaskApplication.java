package com.concerto.ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.retry.annotation.EnableRetry;

@SpringBootApplication
@EnableRetry
public class ECommerceTaskApplication {


	public static void main(String[] args) {
	SpringApplication.run(ECommerceTaskApplication.class, args);
			
	}

}
