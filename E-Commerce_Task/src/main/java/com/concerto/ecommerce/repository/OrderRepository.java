package com.concerto.ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{
	
	List<Order> findAllByCustomer(Customer customer);
}
