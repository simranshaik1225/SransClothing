package com.sran.dao;

import java.util.List;

import com.sran.model.Product;

public interface ProductDAO {
	void addProduct(Product product, int categoryId);
    Product getProduct(int productId);
    List<Product> getAllProducts();
    List<Product> getProductsByCategory(String categoryName);
    void updateProduct(Product product);
    void deleteProduct(int productId);
	List<Product> getProductsBySearch(String categoryName);
    
}
