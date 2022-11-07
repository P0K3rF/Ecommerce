package com.concerto.ecommerce.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class LoginCredentialsRequestDto {
	
	@NotBlank(message = "Required Field")
	@Email
	private String email;
	@NotBlank(message = "Required Field")
	private String password;
	private String role;
	
	
}
