package com.concerto.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.retry.annotation.EnableRetry;

import com.concerto.ecommerce.service.OrderService;

@SpringBootApplication
@EnableRetry
public class ECommerceTaskApplication {

	@Autowired
	OrderService orderService;

	public static void main(String[] args) {
	SpringApplication.run(ECommerceTaskApplication.class, args);
			
	}
}
