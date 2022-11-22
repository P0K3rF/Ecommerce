package com.concerto.ecommerce.service;

import java.util.List;

import javax.persistence.LockModeType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Retryable(value = RuntimeException.class)
	@Lock(LockModeType.OPTIMISTIC)
	@Transactional(isolation = Isolation.SERIALIZABLE)
	public boolean buyProduct(String email,int productId) {                
		Customer customer=this.customerService.getCustomerById(email);
		Product product=this.productService.getProductById(productId);
	int productQuantity=this.productService.getQuantity(productId);
	if(productQuantity>0) {
		Order order=new Order();
		order.setCustomer(customer);
		order.setProduct(product);
		this.orderRepository.save(order);
		int deductedquantity=productQuantity-1;
		this.productService.deductQuantity(deductedquantity, productId);
		return true;
	}
		return false;
	}
	
	public boolean checkOutOfStocks(int productId) {
		int productQuantity=this.productService.getQuantity(productId);
		if(productQuantity>0) return true;
		return false;
	}
	
	
	public List<Order> getAllOrderByEmail(Customer customer){
	return this.orderRepository.findAllByCustomerEmail(customer.getEmail());
	}
}
