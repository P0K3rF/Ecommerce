package com.concerto.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Order;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.repository.OrderRepository;
import com.concerto.ecommerce.repository.ProductRepository;

@SpringBootApplication
@EnableAspectJAutoProxy
public class ECommerceTaskApplication {
	
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	OrderRepository orderRepository;

	public static void main(String[] args) {
	SpringApplication.run(ECommerceTaskApplication.class, args);
			
	}

	
	@Bean
	public void insert() {
//	System.out.println(this.orderRepository.countProduct(1));
//	System.out.println(this.productRepository.countProductQuantity(1));
//		sysout
//		Product product=new Product(1, "Lenovo Phone", "Lenovo smartphones are marketed as the \"LePhone\" in Mainland China and the \"IdeaPhone\" overseas. Motorola Mobility, ZUK Mobile and Medion, divisions of Lenovo, sell smartphones under their own brands", "LenovoPhone", 2,2000.00);
//		Product product1=new Product(2, "Lenovo Legion", "With revolutionary performance and efficiency cores, 12th Gen Intel® Core™ processors. Strike out your opponents with speed, precision, & satisfying keystrokes. No Cost EMI. Get Up to 10% Cashback. Types: Slim, Flex, Performance, Detachable.", "Lenovo Legion", 2,2000.00);
//	
//		
//		
//		this.productRepository.save(product);
//	this.productRepository.save(product1);
		
//	System.out.println(this.productRepository.findByItemNameContaining("Lenovo"));
		
//		Customer customer=new Customer("khalil@gmail.com", null, null, null, null, null, null);
//		Product product=new Product(8, null, null, null, 0, 0);
//		Order order=new Order();
//		order.setCustomers(customer);
//		order.setProducts(product);
//		this.orderRepository.save(order);
		
	}
}
