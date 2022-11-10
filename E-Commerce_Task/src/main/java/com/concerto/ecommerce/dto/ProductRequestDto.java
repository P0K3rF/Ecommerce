package com.concerto.ecommerce.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductRequestDto implements Serializable{

	private static final long serialVersionUID = 712361541555802962L;
	

	private int itemId;
	private String itemName;
	private String itemDescription;
	private String itemPhoto;
	private int itemQuantity;
	private double itemPrice;
}
