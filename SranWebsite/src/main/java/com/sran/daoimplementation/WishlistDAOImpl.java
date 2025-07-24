package com.sran.daoimplementation;

import com.sran.dao.WishlistDAO;
import com.sran.model.Customer;
import com.sran.model.Product;
import com.sran.model.Wishlist;
import com.sran.model.WishlistItem;

import java.util.Iterator;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class WishlistDAOImpl implements WishlistDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Wishlist getWishlistByCustomer(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Wishlist WHERE customer = :customer", Wishlist.class)
                      .setParameter("customer", customer)
                      .uniqueResult();
    }

    @Override
    public void saveOrUpdateWishlist(Wishlist wishlist) {
        sessionFactory.getCurrentSession().saveOrUpdate(wishlist);
    }

    @Override
    public void addProductToWishlist(Customer customer, Product product) {
        Session session = sessionFactory.getCurrentSession();

        Wishlist wishlist = getWishlistByCustomer(customer);

        if (wishlist == null) {
            wishlist = new Wishlist();
            wishlist.setCustomer(customer);
        }

        boolean exists = wishlist.getItems().stream()
            .anyMatch(item -> item.getProduct().getProductId() == product.getProductId());

        if (!exists) {
            WishlistItem item = new WishlistItem();
            item.setWishlist(wishlist);
            item.setProduct(product);
            wishlist.getItems().add(item);
        }

        saveOrUpdateWishlist(wishlist);
    }

    @Override
    public void removeProductFromWishlist(Customer customer, int productId) {
        Session session = sessionFactory.getCurrentSession();

        Wishlist wishlist = getWishlistByCustomer(customer);

        if (wishlist != null) {
            Iterator<WishlistItem> iterator = wishlist.getItems().iterator();
            while (iterator.hasNext()) {
                WishlistItem item = iterator.next();
                if (item.getProduct().getProductId() == productId) {
                    iterator.remove();
                    session.delete(item);
                }
            }

            saveOrUpdateWishlist(wishlist);
        }
    }
}
