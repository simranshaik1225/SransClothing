package com.sran.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sran.dao.CategoryDAO;
import com.sran.dao.ProductDAO;
import com.sran.dao.ProductVariantDAO;
import com.sran.model.Category;
import com.sran.model.Product;
import com.sran.model.ProductVariant;
import com.sran.model.Size;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	

	    @Autowired
	    private ProductDAO productDAO;
	    
	    
	    
	    @RequestMapping("/")
	    public String home(Model model,HttpSession session) {
	        List<Product> kurtis = productDAO.getProductsByCategory("Kurti");
	        List<Product> tops = productDAO.getProductsByCategory("Tops");
	        List<Product> dresses = productDAO.getProductsByCategory("Dresses");
	        List<Product> shrugs = productDAO.getProductsByCategory("Shrugs");
	        // limit each list to 4 items
	        model.addAttribute("kurtis", kurtis.size() > 5 ? kurtis.subList(0, 5) : kurtis);
	        model.addAttribute("tops", tops.size() > 5 ? tops.subList(0, 5) : tops);
	        model.addAttribute("dresses", dresses.size() > 5 ? dresses.subList(0, 5) : dresses);
	        model.addAttribute("shrugs", shrugs.size() > 5 ? shrugs.subList(0, 5) : shrugs);
	        model.addAttribute("loggedInUser", session.getAttribute("loggedInUser"));
	        System.out.println("Session loggedInUser: " + session.getAttribute("loggedInUser"));

	        return "home"; // view name
	    }
	   
	    
	    


	    
	    
	    

	    
	    
	    

	
	
	

}
