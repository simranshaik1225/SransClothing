package com.sran.daoimplementation;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sran.dao.OrderDAO;
import com.sran.model.Customer;
import com.sran.model.OrderItem;
import com.sran.model.Orders;


@Repository
@Transactional
public class OrderDAOIMPL implements OrderDAO{
	
	@Autowired
    private SessionFactory sessionFactory;

   private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

   @Override
   public void addOrder(Orders order) {
       getSession().merge(order);
   }

	
	


	@Override
	public Orders getOrder(int orderId) {
		return getSession().get(Orders.class, orderId);
		
	}

	@Override
	public List<Orders> getOrderByCustomerId(int customerId) {
		String HQL="from Orders o where o.customer.customerId=:customerId";
		return getSession().createQuery(HQL,Orders.class).setParameter("customerId", customerId).getResultList();
	}
	


	@Override
	public void updateOrder(Orders order) {
		getSession().merge(order);
		
	}

	@Override
	public void deleteOrder(int orderId) {
		Orders order=getSession().get(Orders.class, orderId);
		getSession().remove(order);
		
	}

	@Override
	public List<Orders> getAllOrders() {
		String hql="from Orders o";
		return getSession().createQuery(hql,Orders.class).getResultList();
	}

}
