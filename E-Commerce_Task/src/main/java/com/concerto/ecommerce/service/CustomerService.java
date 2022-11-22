package com.concerto.ecommerce.service;

import java.util.Optional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
		if(!this.customerRepository.existsByEmail(customer.getEmail()))
		{
			this.customerRepository.save(customer);
			this.loginRepository.save(credentials);
			return true;
		}else {
			throw new EntityExistsException("Customer With the given Email id : "+customerRequestDto.getEmail() + " already exist");
		}
	}
	
	public Customer getCustomerById(String email) {
	Optional<Customer> optCustomer=this.customerRepository.findByEmail(email);
	if(optCustomer.isPresent()) 
		return optCustomer.get();
	throw new EntityNotFoundException("Customer Not Found " + email);
	}
	
	
	public boolean checkForEmail(String email) {
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if(this.customerRepository.existsByEmail(email))
			return true;
		return false;
					
	}
	
	public boolean updateEmail(String mobileNo,String oldEmail,String newEmail) {
	Optional<Customer>	optionalCustomer=this.customerRepository.findByMobileNo(mobileNo);

	if(optionalCustomer.isPresent()) {
		Customer customer=optionalCustomer.get();
		
			this.loginRepository.deleteById(oldEmail);
			
			CustomerRequestDto customerRequestDto=ValueMapper.convertCustomerToCustomerRequestDto(customer);
			customerRequestDto.setEmail(newEmail);
			LoginCredentials credentials=ValueMapper.convertCustomerDtoToLogin(customerRequestDto);

			this.loginRepository.save(credentials);
		
		customer.setEmail(newEmail);
		this.customerRepository.save(customer);
		
		return true;
	}
	return false;
	}
	
}