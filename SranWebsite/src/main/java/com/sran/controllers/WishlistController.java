package com.sran.controllers;

import com.sran.dao.ProductDAO;
import com.sran.dao.WishlistDAO;
import com.sran.model.Customer;
import com.sran.model.Product;
import com.sran.model.Wishlist;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {

    @Autowired
    private WishlistDAO wishlistDAO;

    @Autowired
    private ProductDAO productDAO;

    @GetMapping
    public String viewWishlist(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("loggedInUser");

        if (customer == null) {
            return "redirect:/loginController/login";
        }

        Wishlist wishlist = wishlistDAO.getWishlistByCustomer(customer);

        model.addAttribute("wishlist", wishlist);
        model.addAttribute("loggedInUser", customer);

        return "wishlist";  // your JSP page name
    }

    @RequestMapping(value = "/add", method = {RequestMethod.GET, RequestMethod.POST})
    public String addToWishlist(@RequestParam("productId") int productId, HttpSession session) {
        
        Customer customer = (Customer) session.getAttribute("loggedInUser");

        if (customer == null) {
            return "redirect:/loginController/login";
        }

        Product product = productDAO.getProduct(productId);
        wishlistDAO.addProductToWishlist(customer, product);

        return "redirect:/wishlist";
    }

    @GetMapping("/remove")
    public String removeFromWishlist(@RequestParam("productId") int productId, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("loggedInCustomer");
        if (customer == null) {
            return "redirect:/loginController/login";
        }

        wishlistDAO.removeProductFromWishlist(customer, productId);

        return "redirect:/wishlist";
    }
    
    @GetMapping("/product")
	public String showProduct(@RequestParam("id") int productId, Model model) {
	    Product product = productDAO.getProduct(productId);
	    model.addAttribute("product", product);
	    return "product"; 
	}
}
