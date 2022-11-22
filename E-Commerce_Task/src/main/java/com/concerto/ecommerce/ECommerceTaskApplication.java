package com.concerto.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.retry.annotation.EnableRetry;

import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.service.OrderService;

@SpringBootApplication
@EnableRetry
public class ECommerceTaskApplication {

	@Autowired
	OrderService orderService;

	public static void main(String[] args) {
	SpringApplication.run(ECommerceTaskApplication.class, args);
			
	}

	@Bean
	public void setup() {
		
		Customer customer=new Customer();
		customer.setEmail("khalil@gmail.com");
		System.out.println("Printing all order");
		this.orderService.getAllOrderByEmail(customer).forEach(System.out::println);
	}
}
