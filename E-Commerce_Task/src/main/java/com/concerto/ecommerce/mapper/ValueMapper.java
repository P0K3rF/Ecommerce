package com.concerto.ecommerce.mapper;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.dto.LoginCredentialsRequestDto;
import com.concerto.ecommerce.dto.ProductRequestDto;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.LoginCredentials;
import com.concerto.ecommerce.entity.Product;

public class ValueMapper {
	
	private ValueMapper() {
		
	}
	
	public static Customer convertCustomerRequestDtoToCustomer(CustomerRequestDto customerRequestDto)
	{
		//Real entity
		Customer c=new Customer();
		c.setEmail(customerRequestDto.getEmail());
		c.setFirstName(customerRequestDto.getFirstName());
		c.setLastName(customerRequestDto.getLastName());
		c.setMobileNo(customerRequestDto.getMobileNo());
		c.setAddress(customerRequestDto.getAddress());
		c.setPassword(customerRequestDto.getPassword());
		return c;
		
	}
	
	
	public static CustomerRequestDto convertCustomerToCustomerRequestDto(Customer customer)
	{
		//Real entity
		CustomerRequestDto c=new CustomerRequestDto();
		c.setEmail(customer.getEmail());
		c.setFirstName(customer.getFirstName());
		c.setLastName(customer.getLastName());
		c.setMobileNo(customer.getMobileNo());
		c.setAddress(customer.getAddress());
		c.setPassword(customer.getPassword());
		return c;
		
	}
	
	public static LoginCredentials convertCustomerDtoToLogin(CustomerRequestDto customerRequestDto)
	{
		LoginCredentials credentials=new LoginCredentials();
		credentials.setEmail(customerRequestDto.getEmail());
		credentials.setPassword(customerRequestDto.getPassword());
		credentials.setRole("ROLE_CUSTOMER");
		return credentials;
	}
	
	public static LoginCredentials convertLoginCredentialsRequestDto(LoginCredentialsRequestDto credentialsRequestDto) {
		LoginCredentials credentials=new LoginCredentials();
		credentials.setEmail(credentialsRequestDto.getEmail());
		credentials.setPassword(credentialsRequestDto.getPassword());
		credentials.setRole("ROLE_CUSTOMER");
		return credentials;
	}
	
	public static Product convertProductDtoToProduct(ProductRequestDto productDto) {
		Product product=new Product();
		product.setItemDescription(productDto.getItemDescription());
		product.setItemName(productDto.getItemName());
		product.setItemPhoto(productDto.getItemPhoto());
		product.setItemPrice(productDto.getItemPrice());
		product.setItemQuantity(productDto.getItemQuantity());
		return product;
	}
	
}
