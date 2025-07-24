package com.sran.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.CustomerDAO;
import com.sran.model.Customer;

@Controller
@RequestMapping("/registrationController")
public class RegistrationController {
	@Autowired
	private CustomerDAO customerDAO;

	
	@RequestMapping("/registration")
	public String registration() {
		return "registration";
	}
	@RequestMapping("/success")
	public String success(@RequestParam("customerName") String customerName,
	                      @RequestParam("phoneNumber") long phoneNumber,
	                      @RequestParam("email") String email,
	                      @RequestParam("password") String password) {

	    Customer customer = new Customer(customerName, phoneNumber, email, password);
	    customerDAO.addCustomer(customer); // Saves to DB

	    return "/login"; // JSP page name
	}

}
