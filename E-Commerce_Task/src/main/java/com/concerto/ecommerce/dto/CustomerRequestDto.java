package com.concerto.ecommerce.dto;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class CustomerRequestDto implements Serializable{

	private static final long serialVersionUID = -2197545781937894900L;

	@NotBlank(message = "Email cannot Be Empty")
	@Email(message = "Invalid Email Format")
	private String email;
	@NotBlank(message = "Required Field")
	private String firstName;
	@NotBlank(message = "Required Field")
	private String lastName;
	@NotBlank(message = "Required Field")
	@Pattern(regexp = "\\d{10}$",message = "Invalid Mobile Number")
	private String mobileNo;
	@NotBlank(message = "Required Field")
	private String address;
	@NotBlank(message = "Required Field")
	private String password;
}
