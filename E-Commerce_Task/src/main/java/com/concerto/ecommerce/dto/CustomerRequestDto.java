package com.concerto.ecommerce.dto;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import com.concerto.ecommerce.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class CustomerRequestDto implements Serializable{

	private static final long serialVersionUID = -2197545781937894900L;

	private int customerId;
	@NotBlank(message = "Email cannot Be Empty")
	@Pattern(regexp = "[a-zA-Z0-9][a-zA-Z0-9_.]*@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)+",message = "Invalid Email Format")
	private String email;
	@NotBlank(message = "Required Field")
	/* @Pattern(regexp = "[a-zA-Z]",message="Invalid name") */
	private String firstName;
	@NotBlank(message = "Required Field")
	/* @Pattern(regexp = "[a-zA-Z]",message="Invalid name") */
	private String lastName;
	@NotBlank(message = "Required Field")
	@Pattern(regexp = "\\d{10}$",message = "Invalid Mobile Number")
	private String mobileNo;
	@NotBlank(message = "Required Field")
	
	private String address;
	@NotBlank(message = "Required Field")
	private String password;
	
	private List<Product> products;
}
