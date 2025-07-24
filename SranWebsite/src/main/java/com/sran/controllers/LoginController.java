package com.sran.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.CustomerDAO;
import com.sran.model.Customer;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/loginController")
public class LoginController {
	
	
	@Autowired
	private CustomerDAO customerDAO;
	@RequestMapping("/login")
	public String login() {
		return "login";	
		}
	
	 @PostMapping("/loginCheck")
	    public String loginCheck(@RequestParam("email") String email,
	                             @RequestParam("password") String password,
	                             HttpSession session) {

	        Customer customer = customerDAO.getCustomerByEmail(email);

	        if (customer != null && customer.getPassword().equals(password)) {
	            session.setAttribute("loggedInUser", customer);
	            return "redirect:/"; // redirects to home page
	        } else {
	            return "redirect:/loginController/login?error=true"; // reloads login page with error
	        }
	    }
	 
	 
	 

}
