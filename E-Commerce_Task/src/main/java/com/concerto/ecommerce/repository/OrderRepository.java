package com.concerto.ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{
	
	List<Order> findAllByCustomer(Customer customer);
	
	@Query(nativeQuery = true,value = "select count(*) from order_table where itemId=?")
	int countProduct(@Param("itemId") int id);
}
