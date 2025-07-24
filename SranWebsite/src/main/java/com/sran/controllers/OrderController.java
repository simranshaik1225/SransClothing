package com.sran.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.OrderDAO;
import com.sran.dao.OrderItemDAO;
import com.sran.model.Cart;
import com.sran.model.Customer;
import com.sran.model.OrderItem;
import com.sran.model.Orders;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("orderController")
public class OrderController {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@RequestMapping("/myOrders")
	public String orders(HttpSession session, Model model) {
	    Customer customer = (Customer) session.getAttribute("loggedInUser");

	    if (customer != null) {
	        List<Orders> orders = orderDAO.getOrderByCustomerId(customer.getCustomerId());
	        model.addAttribute("orders", orders);
	        return "orders"; // your JSP or Thymeleaf page name
	    }

	    return "redirect:/login"; // if not logged in, redirect to login page
	}
	
	@Autowired
    private OrderItemDAO orderItemDAO;

    @RequestMapping("/items")
    public String getOrderItems(@RequestParam("orderId") int orderId, Model model) {
        List<OrderItem> items = orderItemDAO.getItemsByOrderId(orderId);
        model.addAttribute("orderItems", items);
        return "orderitem"; // your JSP page: orderItems.jsp
    }

}
