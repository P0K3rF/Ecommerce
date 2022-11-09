package com.concerto.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.ecommerce.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
