package com.concerto.ecommerce.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class CustomerRequestDto {
	@NotBlank(message = "Email cannot Be Empty")
	@Email(message = "")
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
