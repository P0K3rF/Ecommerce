package com.concerto.ecommerce.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
public class Customer {
	@Id
	private String email;
	private String firstName;
	private String lastName;
	private String mobileNo;
	private String address;
	private String password;
}
