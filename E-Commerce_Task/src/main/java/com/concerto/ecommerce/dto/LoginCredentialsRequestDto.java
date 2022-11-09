package com.concerto.ecommerce.dto;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class LoginCredentialsRequestDto implements Serializable{

	private static final long serialVersionUID = -2197545781937894900L;
	
	@NotBlank(message = "Required Field")
	@Email
	private String email;
	@NotBlank(message = "Required Field")
	private String password;
	private String role;
	
	
}
