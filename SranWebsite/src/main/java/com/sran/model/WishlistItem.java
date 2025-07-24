package com.sran.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="wishlistitem")
public class WishlistItem implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="wishlistItemId")
    private int wishlistItemId;
	
	@ManyToOne
	@JoinColumn(name = "productId")
    private Product product;
	
	 @ManyToOne
	 @JoinColumn(name = "wishlist_id")
	 private Wishlist wishlist;

    public WishlistItem() {}

    public WishlistItem(int wishlistItemId, Product product) {
        this.wishlistItemId = wishlistItemId;
        this.product = product;
    }

    public int getWishlistItemId() {
        return wishlistItemId;
    }

    public void setWishlistItemId(int wishlistItemId) {
        this.wishlistItemId = wishlistItemId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

	public Wishlist getWishlist() {
		return wishlist;
	}

	public void setWishlist(Wishlist wishlist) {
		this.wishlist = wishlist;
	}
    
    
}
