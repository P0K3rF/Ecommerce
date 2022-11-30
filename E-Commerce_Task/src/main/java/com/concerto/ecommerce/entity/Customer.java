package com.concerto.ecommerce.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int customerId;
	@Column(unique = true)
	private String email;
	private String firstName;
	private String lastName;
	private String mobileNo;
	private String address;
	private String password;
	@Transient
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private Order order;
	
}
