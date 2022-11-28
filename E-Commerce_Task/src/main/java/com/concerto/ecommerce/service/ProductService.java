package com.concerto.ecommerce.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.concerto.ecommerce.dto.ProductRequestDto;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	//Inserting new product
	public boolean insertProduct(ProductRequestDto productRequestDto) {
		Product product=ValueMapper.convertProductDtoToProduct(productRequestDto);
		if(!this.productRepository.existsById(product.getItemId()))
		{
			this.productRepository.save(product);
			return true;
		}
		return false;
	}
	
	//Updating product 
	public boolean updateProduct(ProductRequestDto productRequestDto) {
		if(this.productRepository.existsById(productRequestDto.getItemId()))
		{
		Product product=ValueMapper.convertProductDtoToProduct(productRequestDto);
		this.productRepository.save(product);
		return true;
		}
		
		return false;
	}
	//Getting all product to show in homepage
	
	public List<Product> getAllProducts(){
		
		List<Product> getProducts=new ArrayList<>();
		this.productRepository.findAll().forEach(getProducts::add);
		return getProducts;
	}
	
	//Adding paging to all products
	public Page<Product> getAllProductsPageable(int page){
		Pageable pageable=PageRequest.of(page, 5);
		return this.productRepository.findAll(pageable);
	}
	
	//Getting product count to add pagination
	public int getProductCount() {
		int countProduct=(int) this.productRepository.count();
		float page=(float)countProduct/5;
		return (int) Math.ceil(page);	
	}
	
	//Getting product by id
	public Product getProductById(int pid) {  
	Optional<Product> optionalProduct=this.productRepository.findById(pid);
	if(optionalProduct.isPresent()) {
		return optionalProduct.get();
	}
	throw new EntityNotFoundException("Ëntity not found with the given product :"+ pid);
	}
	
	//Getting all product depending on search
	public List<Product> getProductBySearch(String productName){
		return this.productRepository.findByItemNameContaining(productName);
		
	}
	
	//Adming deleting the product
	public boolean deleteProuctById(int id) {
		this.productRepository.deleteById(id);
		return true;
	}
	
		//Getting product count to see out of stock
	public int getQuantity(int productId) {
		return this.productRepository.countProductQuantity(productId);
	}
//		@Transactional(isolation = Isolation.SERIALIZABLE)
	public void deductQuantity(int productQuantity,int itemId) {
		this.productRepository.updateQuantityOfProductAfterOrder(productQuantity, itemId);
	}
	
}
