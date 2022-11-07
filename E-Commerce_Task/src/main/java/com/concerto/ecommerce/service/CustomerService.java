package com.concerto.ecommerce.service;

import javax.persistence.EntityExistsException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.LoginCredentials;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.repository.CustomerRepository;
import com.concerto.ecommerce.repository.LoginCredentialsRepository;


@Service
public class CustomerService {
	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	LoginCredentialsRepository loginRepository;
	
	public boolean insertCustomer(CustomerRequestDto customerRequestDto) {

		Customer customer=ValueMapper.convertCustomerRequestDtoToCustomer(customerRequestDto);
		LoginCredentials credentials=ValueMapper.convertCustomerDtoToLogin(customerRequestDto);
		if(!this.customerRepository.existsById(customer.getEmail()))
		{
			this.customerRepository.save(customer);
			this.loginRepository.save(credentials);
			return true;
		}else {
			throw new EntityExistsException("Customer With the given Email id : "+customerRequestDto.getEmail() + " already exist");
		}
	}
}
