package com.sran.dao;

import java.util.List;

import com.sran.model.OrderItem;


public interface OrderItemDAO {
	void addOrderItem(OrderItem orderItem);
    OrderItem getOrderItem(int orderItemId);
    List<OrderItem> getItemsByOrderId(int orderId);
    void updateOrderItem(OrderItem orderItem);
    void deleteOrderItem(int orderItemId);

}
