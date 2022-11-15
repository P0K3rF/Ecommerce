package com.concerto.ecommerce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.stereotype.Service;

import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Order;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.repository.OrderRepository;

@Service
public class OrderService {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderRepository orderRepository;
	
	public boolean buyProduct(String email,int productId) {
		
		Customer customer=this.customerService.getCustomerById(email);
		Product product=this.productService.getProductById(productId);
	int productQuantity=this.productService.getQuantity(productId);
	int countOrder=this.orderRepository.countProduct(productId);
	if(productQuantity>countOrder) {
		Order order=new Order();
		order.setCustomer(customer);
		order.setProduct(product);
		this.orderRepository.save(order);
		return true;
	}
		return false;
	}
	
	public List<Order> getAllOrderByEmail(Customer customer){
		System.out.println("Email of customer "+customer.getEmail());
	return this.orderRepository.findAllByCustomer(customer);
	}
}
