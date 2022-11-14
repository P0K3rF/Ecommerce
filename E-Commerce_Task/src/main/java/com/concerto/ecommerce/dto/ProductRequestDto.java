package com.concerto.ecommerce.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductRequestDto implements Serializable{

	private static final long serialVersionUID = 712361541555802962L;
	
	MultipartFile image; 

	private int itemId;
	private String itemName;
	private String itemDescription;
	private String itemPhoto;
	private int itemQuantity;
	private double itemPrice;
	
	
	
}
