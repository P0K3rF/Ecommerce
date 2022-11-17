package com.concerto.ecommerce.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.concerto.ecommerce.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	

	public List<Product> findByItemNameContaining(String productName);
	
	@Query(nativeQuery = true,value = "select itemQuantity from product where itemId=?")
	int countProductQuantity(@Param("itemId") int id);
	
	@Transactional
	@Modifying
	@Query(nativeQuery = true,value = "update product set itemQuantity=? where itemId=?")
	void updateQuantityOfProductAfterOrder(@Param("itemQuantity") int deductedQuantity,@Param("itemId")  int itemId);
	
}
