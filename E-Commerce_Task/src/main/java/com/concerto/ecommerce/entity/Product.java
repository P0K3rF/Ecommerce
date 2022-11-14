package com.concerto.ecommerce.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.NoArgsConstructor;


@NoArgsConstructor


@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int itemId;
	private String itemName;
	@Column(columnDefinition = "longtext")
	private String itemDescription;
	private String itemPhoto;
	private int itemQuantity;
	private double itemPrice;
	
	
	@OneToMany(mappedBy = "product",cascade = CascadeType.ALL)
	 private List<Order> order;
	
	
	
	
	@Override
	public String toString() {
		return "Product [itemId=" + itemId + ", itemName=" + itemName + ", itemDescription=" + itemDescription
				+ ", itemPhoto=" + itemPhoto + ", itemQuantity=" + itemQuantity + ", itemPrice=" + itemPrice + "]";
	}



	public Product(int itemId, String itemName, String itemDescription, String itemPhoto, int itemQuantity,
			double itemPrice) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemDescription = itemDescription;
		this.itemPhoto = itemPhoto;
		this.itemQuantity = itemQuantity;
		this.itemPrice = itemPrice;
	}



	public int getItemId() {
		return itemId;
	}



	public void setItemId(int itemId) {
		this.itemId = itemId;
	}



	public String getItemName() {
		return itemName;
	}



	public void setItemName(String itemName) {
		this.itemName = itemName;
	}



	public String getItemDescription() {
		return itemDescription;
	}



	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}



	public String getItemPhoto() {
		return itemPhoto;
	}



	public void setItemPhoto(String itemPhoto) {
		this.itemPhoto = itemPhoto;
	}



	public int getItemQuantity() {
		return itemQuantity;
	}



	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}



	public double getItemPrice() {
		return itemPrice;
	}



	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	
}
