package com.concerto.ecommerce.service;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.ecommerce.dto.LoginCredentialsRequestDto;
import com.concerto.ecommerce.entity.LoginCredentials;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.repository.LoginCredentialsRepository;

@Service
public class LoginCredentialsService {
	@Autowired
	LoginCredentialsRepository credentialsRepository;
	
	
	public boolean validate(LoginCredentialsRequestDto credentialsRequestDto) {
		LoginCredentials credentials= ValueMapper.convertLoginCredentialsRequestDto(credentialsRequestDto);
		if(this.credentialsRepository.existsById(credentials.getEmail()))
		{
			Optional<LoginCredentials> optionalCredentials=this.credentialsRepository.findById(credentials.getEmail());
			if(optionalCredentials.isPresent()) {
				String password=optionalCredentials.get().getPassword();
				if(password.equals(credentials.getPassword()))
					return true;
			}
		}
		throw new EntityNotFoundException("Entity Not Found");
	}
	
}
