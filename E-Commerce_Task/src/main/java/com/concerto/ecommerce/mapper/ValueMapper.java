package com.concerto.ecommerce.mapper;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.dto.LoginCredentialsRequestDto;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.LoginCredentials;

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
}
