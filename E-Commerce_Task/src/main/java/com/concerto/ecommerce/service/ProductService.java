package com.concerto.ecommerce.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.ecommerce.dto.ProductRequestDto;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	public boolean insertProduct(ProductRequestDto productRequestDto) {
		Product product=ValueMapper.convertProductDtoToProduct(productRequestDto);
		System.out.println(product);
		if(!this.productRepository.existsById(product.getItemId()))
		{
			System.out.println("Inserting product to database");
			this.productRepository.save(product);
			return true;
		}
		return false;
	}
	
	
	public List<Product> getAllProducts(){
		List<Product> getProducts=new ArrayList<>();
		this.productRepository.findAll().forEach(getProducts::add);
		return getProducts;
	}
	
	public Product getProductById(int pid) {
      
		return this.productRepository.findById(pid).get();
	}
	
	public List<Product> getProductBySearch(String productName){
		return this.productRepository.findByItemNameContaining(productName);
		
	}
	
	public boolean deleteProuctById(int id) {
		this.productRepository.deleteById(id);
		return true;
	}
	
	public int getQuantity(int productId) {
		return this.productRepository.countProductQuantity(productId);
	}
}
