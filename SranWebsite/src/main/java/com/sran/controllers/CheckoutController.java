package com.sran.controllers;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.OrderDAO;
import com.sran.dao.OrderItemDAO;
import com.sran.model.Cart;
import com.sran.model.CartItem;
import com.sran.model.Customer;
import com.sran.model.OrderItem;
import com.sran.model.Orders;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/checkoutController")
public class CheckoutController {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private OrderItemDAO orderItemDAO;

    @RequestMapping("/checkout")
    public String checkout() {
        return "checkout";
    }

    @PostMapping("/orderConfirmation")
    public String orderConfirmation(
            @RequestParam("doorno") String doorno,
            @RequestParam("street") String street,
            @RequestParam("city") String city,
            @RequestParam("pincode") String pincode,
            @RequestParam("phonenumber") long phonenumber,
            @RequestParam("paymentMethod") String paymentMethod,
            HttpSession session) {

        Cart cart = (Cart) session.getAttribute("cart");
        Customer customer = (Customer) session.getAttribute("loggedInUser");

        if (cart != null && customer != null && !cart.getItems().isEmpty()) {

            float totalAmount = 0;
            for (CartItem item : cart.getItems().values()) {
                totalAmount += item.getProduct().getPrice() * item.getQuantity();
            }

            Orders order = new Orders();
            order.setAddress(doorno + "," + street + "," + city + "," + pincode);
            order.setCustomer(customer);
            order.setPaymentMode(paymentMethod);
            order.setStatus("confirmed");
            order.setTotalAmount(totalAmount);
            order.setPhoneNumber(phonenumber);
            order.setOrderDate(LocalDateTime.now());

            // ✅ Build OrderItems list
            List<OrderItem> orderItems = new ArrayList<>();
            for (CartItem item : cart.getItems().values()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setQuantity(item.getQuantity());
                orderItem.setProduct(item.getProduct());
                orderItem.setTotalAmount(item.getProduct().getPrice() * item.getQuantity());
                orderItem.setOrders(order); // link to parent order

                orderItems.add(orderItem);
            }

            // ✅ Attach children to parent
            order.setOrderItem(orderItems);

            // ✅ Persist only the parent
            orderDAO.addOrder(order);

            System.out.println("Order placed successfully with all items!");

            session.removeAttribute("cart");
            return "success";
        }

        return "redirect:/checkoutController/checkout";
    }
}