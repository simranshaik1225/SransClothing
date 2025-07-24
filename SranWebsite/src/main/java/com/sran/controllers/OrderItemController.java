package com.sran.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.OrderItemDAO;
import com.sran.model.OrderItem;

@Controller
@RequestMapping("/orderItemController")
public class OrderItemController {

	@Autowired
    private OrderItemDAO orderItemDAO;

    @RequestMapping("/items")
    public String getOrderItems(@RequestParam("orderId") int orderId, Model model) {
        List<OrderItem> items = orderItemDAO.getItemsByOrderId(orderId);
        model.addAttribute("orderItems", items);
        return "orderItems"; // your JSP page: orderItems.jsp
    }
}
