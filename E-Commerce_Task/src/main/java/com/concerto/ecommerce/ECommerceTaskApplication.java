package com.concerto.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.repository.ProductRepository;
import com.concerto.ecommerce.service.ProductService;

@SpringBootApplication
public class ECommerceTaskApplication {
	
	
	@Autowired
	ProductRepository productRepository;

	public static void main(String[] args) {
	ConfigurableApplicationContext context=	SpringApplication.run(ECommerceTaskApplication.class, args);
			
	}

	
//	@Bean
	public void insert() {
		Product product=new Product(1, "Lenovo Phone", "Lenovo smartphones are marketed as the \"LePhone\" in Mainland China and the \"IdeaPhone\" overseas. Motorola Mobility, ZUK Mobile and Medion, divisions of Lenovo, sell smartphones under their own brands", "LenovoPhone", 2,2000.00);
		Product product1=new Product(2, "Lenovo Legion", "With revolutionary performance and efficiency cores, 12th Gen Intel® Core™ processors. Strike out your opponents with speed, precision, & satisfying keystrokes. No Cost EMI. Get Up to 10% Cashback. Types: Slim, Flex, Performance, Detachable.", "Lenovo Legion", 2,2000.00);
	
		
		
		this.productRepository.save(product);
	this.productRepository.save(product1);
	}
}
