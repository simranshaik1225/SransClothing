package com.sran.daoimplementation;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sran.dao.OrderItemDAO;
import com.sran.model.OrderItem;

@Repository
@Transactional
public class OrderItemDAOImpl implements OrderItemDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void addOrderItem(OrderItem orderItem) {
    	getSession().merge(orderItem);

    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        return getSession().get(OrderItem.class, orderItemId);
    }

    @Override
    public List<OrderItem> getItemsByOrderId(int orderId) {
        String hql = "from OrderItem oi where oi.orders.orderId = :orderId";
        return getSession()
                .createQuery(hql, OrderItem.class)
                .setParameter("orderId", orderId)
                .getResultList();
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        getSession().merge(orderItem);
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        OrderItem item = getSession().get(OrderItem.class, orderItemId);
        if (item != null) {
            getSession().remove(item);
        } else {
            System.out.println("Order item not found.");
        }
    }
}
