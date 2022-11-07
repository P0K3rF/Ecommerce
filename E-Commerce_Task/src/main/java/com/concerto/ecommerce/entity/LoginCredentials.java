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
public class LoginCredentials {
	@Id
	private String email;
	private String password;
	private String role;
}
