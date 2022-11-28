package com.concerto.ecommerce.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class OrderRequestDto {
	private int productId;
	private int orderQuantity;
	private String orderAddress;
	private int orderPrice;

}
