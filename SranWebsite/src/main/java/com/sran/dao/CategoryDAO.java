package com.sran.dao;

import java.util.List;

import com.sran.model.Category;

public interface CategoryDAO {
	 	void addCategory(Category category);
	    Category getCategory(int categoryId);
	    List<Category> getAllCategories();
	    void updateCategory(Category category);
	    void deleteCategory(int categoryId);

}
