package com.concerto.ecommerce.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

@Entity
@Table(name = "order_Table")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int orderId;
	@ManyToOne
	@JoinColumn(name = "itemId")
	private Product product;
	@ManyToOne
	@JoinColumn(name="email")
	private Customer customer;
	
	private String address;
	
	@Column(name="orderDate", nullable = false,
		    columnDefinition="TIMESTAMP default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP")
	private Date orderDate = new Date();

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", customer=" + customer + ", OrderDate=" + orderDate + "]";
	}
	
	
	
	
}
