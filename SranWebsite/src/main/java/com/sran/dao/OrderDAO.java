package com.sran.dao;

import java.util.List;

import com.sran.model.OrderItem;
import com.sran.model.Orders;

public interface OrderDAO {
	void addOrder(Orders order);
	
	Orders getOrder(int orderId);
	List<Orders> getOrderByCustomerId(int customerId);
	void updateOrder(Orders order);
	void deleteOrder(int orderId);
	List<Orders> getAllOrders();
	

}
