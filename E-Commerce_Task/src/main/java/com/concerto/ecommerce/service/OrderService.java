package com.concerto.ecommerce.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.persistence.LockModeType;

import org.hibernate.dialect.lock.OptimisticEntityLockException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.concerto.ecommerce.dto.OrderRequestDto;
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
	
	
	//Old Code for buying the product
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
	
	
	//New Buy product code
	public boolean buyNewProduct(OrderRequestDto orderDto,Customer customer) {
		try {
		Product product=this.productService.getProductById(orderDto.getProductId());
		int productQuantity=this.productService.getQuantity(orderDto.getProductId());
		if(productQuantity-orderDto.getOrderQuantity()>=0) {
		Order order=new Order();
		order.setCustomer(customer);
		order.setOrderQuantity(orderDto.getOrderQuantity());
		order.setAddress(orderDto.getOrderAddress());
		order.setOrderPrice(orderDto.getOrderPrice());
		order.setProduct(product);
		int deductedquantity=productQuantity-orderDto.getOrderQuantity();
		this.productService.deductQuantity(deductedquantity, orderDto.getProductId());
		this.orderRepository.save(order);
		return true;
		}
		return false;
		}catch(OptimisticEntityLockException e) {
			return false;
		}
		
	}
	
	//Checking for out of stocks by product id
	public boolean checkOutOfStocks(int productId) {
		int productQuantity=this.productService.getQuantity(productId);
		if(productQuantity>0) return true;
		return false;
	}
	
	//Getting all order by email to show in order history
	public List<Order> getAllOrderByEmail(Customer customer){
	return this.orderRepository.findAllByCustomerEmail(customer.getEmail());
	}
	
	//Getting specific order to show details in order history
	public Order getOrderByOrderId(int orderId) {
		
		Optional<Order> optionalOrder=this.orderRepository.findById(orderId);
		if(optionalOrder.isPresent()) {
			return optionalOrder.get();
		}
		throw new EntityNotFoundException("Entity not found");
	}
	
}
