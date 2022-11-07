package com.concerto.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.ecommerce.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, String>{
	
}
