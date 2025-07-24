package com.sran.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="product")
public class Product {
	
	@Id
	@Column(name="productId")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productId;
	
	
	@Column(name="productDescription")
	private String productDescription;
	
	@Column(name="price")
	private float price;
	
	
	@Column(name="imageUrl")
	private String imageUrl;
	
	@ManyToOne(cascade= {CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH})
	@JoinColumn(name="categoryId")
	private Category category;

	
	

	@OneToMany(mappedBy = "product")
	private List<OrderItem> orderItems;

	public Product() {
		super();
	}


	public Product(int productId, String productDescription, float price,  String imageUrl) {
		super();
		this.productId = productId;
		this.productDescription = productDescription;
		this.price = price;
		
		this.imageUrl = imageUrl;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public String getProductDescription() {
		return productDescription;
	}


	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public List<OrderItem> getOrderItems() {
		return orderItems;
	}


	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
	

}
