package com.sran.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.ProductDAO;
import com.sran.model.Cart;
import com.sran.model.CartItem;
import com.sran.model.Product;
import com.sran.model.Size;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cartController")
public class CartController {

    @Autowired
    private ProductDAO productDAO;

    @RequestMapping("/cartView")
    public String cartView(HttpSession session, Model model) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("totalPrice", cart.getTotalPrice());
            model.addAttribute("cart", cart);
        }
        return "cart";
    }

    @RequestMapping("/action")
    public String actionCheck(
            @RequestParam("action") String action,
            @RequestParam("productId") int productId,
            @RequestParam("selectedSize") String selectedSize,
            @RequestParam(value = "quantity", required = false, defaultValue = "0") int quantity,
            HttpSession session,
            Model model) {

        Product product = productDAO.getProduct(productId);

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String viewName;

        if ("add".equals(action)) {
            viewName = addItemToCart(product, selectedSize, quantity, cart);
        } else if ("update".equals(action)) {
            viewName = updateCartItem(product, selectedSize, quantity, cart);
        } else if ("remove".equals(action)) {
            viewName = deleteCartItem(product, selectedSize, cart);
        } else {
            return "errorPage";
        }

        model.addAttribute("totalPrice", cart.getTotalPrice());
        model.addAttribute("cart", cart);

        return viewName;
    }

    public String addItemToCart(Product product, String size, int quantity, Cart cart) {
        CartItem item = new CartItem();
        item.setProduct(product);
        item.setSize(Size.valueOf(size));
        item.setQuantity(quantity);

        cart.addCartItem(item);

        System.out.println("Item added: " + product.getProductId() + "-" + size);
        return "cart";
    }

    public String updateCartItem(Product product, String size, int quantity, Cart cart) {
        cart.updateCartItem(product.getProductId(), size, quantity);
        System.out.println("Item updated: " + product.getProductId() + "-" + size + " => " + quantity);
        return "cart";
    }

    public String deleteCartItem(Product product, String size, Cart cart) {
        cart.removeCartItem(product.getProductId(), size);
        System.out.println("Item removed: " + product.getProductId() + "-" + size);
        return "cart";
    }

    @RequestMapping("/clear")
    public String clearCart(HttpSession session, Model model) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.clear();
            model.addAttribute("totalPrice", 0);
            model.addAttribute("cart", cart);
        }
        return "cart";
    }
}
