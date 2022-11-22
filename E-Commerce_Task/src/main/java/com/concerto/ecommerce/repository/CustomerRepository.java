package com.concerto.ecommerce.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.ecommerce.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	Optional<Customer> findByEmail(String email);
	boolean existsByEmail(String email);
	
	Optional<Customer> findByMobileNo(String mobileNo);
}
