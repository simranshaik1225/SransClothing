package com.sran.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="orderItem")
public class OrderItem {
	
	@Id
	@Column(name="orderItemId")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int orderItemId;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="totalAmount")
	private float totalAmount;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "productId")
	private Product product;
	
	
	@ManyToOne(cascade= {CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH})
	@JoinColumn(name="orderId")
	private Orders orders;
	

	public OrderItem() {
		super();
	}

	public OrderItem(int quantity,float totalAmount) {
		super();
		this.quantity = quantity;
		this.totalAmount = totalAmount;
	}


	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
	
	

}
