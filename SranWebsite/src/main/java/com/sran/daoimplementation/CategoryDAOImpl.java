package com.sran.daoimplementation;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sran.dao.CategoryDAO;
import com.sran.model.Category;

@Repository
@Transactional
public class CategoryDAOImpl  implements CategoryDAO {
	 @Autowired
	    private SessionFactory sessionFactory;

	    private Session getSession() {
	        return sessionFactory.getCurrentSession();
	    }

	    @Override
	    public void addCategory(Category category) {
	        getSession().merge(category);
	        System.out.println("Category added successfully.");
	    }

	    @Override
	    public Category getCategory(int categoryId) {
	        return getSession().get(Category.class, categoryId);
	    }

	    @Override
	    public List<Category> getAllCategories() {
	        return getSession()
	                .createQuery("from Category", Category.class)
	                .getResultList();
	    }

	    @Override
	    public void updateCategory(Category category) {
	        getSession().merge(category);
	    }

	    @Override
	    public void deleteCategory(int categoryId) {
	        Category category = getSession().get(Category.class, categoryId);
	        if (category != null) {
	            getSession().remove(category);
	            System.out.println("Category deleted successfully.");
	        } else {
	            System.out.println("Category not found.");
	        }
	    }

}
