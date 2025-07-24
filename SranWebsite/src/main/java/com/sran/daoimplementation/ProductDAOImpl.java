package com.sran.daoimplementation;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sran.dao.ProductDAO;
import com.sran.model.Category;
import com.sran.model.Product;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO{
	 @Autowired
	    private SessionFactory sessionFactory;

	    private Session getSession() {
	        return sessionFactory.getCurrentSession();
	    }

	    @Override
	    public void addProduct(Product product, int categoryId) {
	        Category category = getSession().get(Category.class, categoryId);
	        if (category != null) {
	            product.setCategory(category);  // Link product to category
	            getSession().merge(product); // Save product
	            System.out.println("Product added with category.");
	        } else {
	            System.out.println("Category not found.");
	        }
	    }
	    @Override
	    public Product getProduct(int productId) {
	        Product product = getSession().get(Product.class, productId);


	        return product;
	    }

	    
	    @Override
	    public List<Product> getProductsByCategory(String categoryName) {
	        String hql = "SELECT p FROM Product p JOIN FETCH p.category c WHERE c.categoryName = :categoryName";
	        return getSession().createQuery(hql, Product.class)
	                .setParameter("categoryName", categoryName)
	                .getResultList();
	    }

	    @Override
	    public List<Product> getProductsBySearch(String categoryName) {
	        String hql = "SELECT p FROM Product p JOIN FETCH p.category c " +
	                     "WHERE c.categoryName LIKE :categoryName";
	        return getSession().createQuery(hql, Product.class)
	                .setParameter("categoryName", "%" + categoryName + "%")
	                .getResultList();
	    }

	    @Override
	    public List<Product> getAllProducts() {
	        String hql = "from Product";
	        return getSession().createQuery(hql, Product.class).getResultList();
	    }

	    @Override
	    public void updateProduct(Product product) {
	        getSession().merge(product);
	    }

	    @Override
	    public void deleteProduct(int productId) {
	        Product product = getSession().get(Product.class, productId);
	        if (product != null) {
	            getSession().remove(product);
	            System.out.println("Product deleted.");
	        } else {
	            System.out.println("Product not found.");
	        }
	    }

		
	

}
