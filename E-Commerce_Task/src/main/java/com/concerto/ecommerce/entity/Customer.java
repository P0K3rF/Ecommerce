package com.concerto.ecommerce.entity;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

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
	@Embedded
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private Order order;
}
