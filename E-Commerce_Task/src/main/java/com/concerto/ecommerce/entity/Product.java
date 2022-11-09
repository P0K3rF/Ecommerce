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
public class Product {
	@Id
	private int itemId;
	private String itemName;
	private String itemDescription;
	private String itemPhoto;
	private int itemQuantity;
	private double itemPrice;
}
