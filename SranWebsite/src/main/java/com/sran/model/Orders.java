package com.sran.model;

import java.time.LocalDateTime;
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
@Table(name="orders")
public class Orders {
	
	@Id
	@Column(name="orderId")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int orderId;
	
	
	@Column(name="phoneNumber")
	private long phoneNumber;
	
	@Column(name="address")
	private String address;
	
	@Column(name="orderDate")
	private LocalDateTime  orderDate;
	
	@Column(name="status")
	private String status;
	
	@Column(name="totalAmount")
	private float totalAmount;
	
	@Column(name="paymentMode")
	private String paymentMode;

	
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
			@JoinColumn(name = "customerId")
			private Customer customer;
	
	@OneToMany(mappedBy="orders",cascade=CascadeType.ALL)
	List<OrderItem> orderItem;
	
	public Orders() {
		
	}

	

	public Orders(long phoneNumber, String address, String status, float totalAmount,
			String paymentMode) {
		super();
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.orderDate = LocalDateTime.now();
		this.status = status;
		this.totalAmount = totalAmount;
		this.paymentMode = paymentMode;
	}



	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LocalDateTime  getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime  orderDate) {
		this.orderDate = orderDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}



	public Customer getCustomer() {
		return customer;
	}



	public void setCustomer(Customer customer) {
		this.customer = customer;
	}



	public List<OrderItem> getOrderItem() {
		return orderItem;
	}



	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}

	



	
	
	
	

}
