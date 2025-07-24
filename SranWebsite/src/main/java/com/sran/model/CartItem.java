package com.sran.model;

public class CartItem {
	
	private int cartItemId;
	private Product product;
	private Size size;
	private int quantity;
	
	public CartItem() {
		super();
	}

	public CartItem(int cartItemId, Product product, Size size, int quantity) {
		super();
		this.cartItemId = cartItemId;
		this.product = product;
		this.size = size;
		this.quantity = quantity;
	}

	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	

}
