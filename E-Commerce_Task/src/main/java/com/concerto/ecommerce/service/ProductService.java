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
		if(!this.productRepository.existsById(product.getItemId()))
		{
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
	
	public Product getProductById(String pid) {
		JSONObject jsonObj = new JSONObject(pid);
//        String prodId = jsonObj.getString("pid");
       int prodId=jsonObj.getInt("pid");        
		return this.productRepository.findById(prodId).get();
	}
	
}
