package com.concerto.ecommerce.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PaymentCard {
	private String cardHolderName;
	private String cardNumber;
	private String exiprationMonth;
	private int expirationYear;
	private int cvv;
	
}
