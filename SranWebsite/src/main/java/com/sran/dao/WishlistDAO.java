package com.sran.dao;

import com.sran.model.Customer;
import com.sran.model.Product;
import com.sran.model.Wishlist;

public interface WishlistDAO {
    Wishlist getWishlistByCustomer(Customer customer);
    void saveOrUpdateWishlist(Wishlist wishlist);
    void addProductToWishlist(Customer customer, Product product);
    void removeProductFromWishlist(Customer customer, int productId);
}


