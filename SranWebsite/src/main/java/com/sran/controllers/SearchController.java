package com.sran.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sran.dao.ProductDAO;
import com.sran.model.Product;
@Controller
@RequestMapping("/searchController")
public class SearchController {
	
	
	@Autowired
	 private ProductDAO productDAO;
	
	
	@RequestMapping("/search")
	public String search(@RequestParam("search") String search, Model model) {
		model.addAttribute("search",search);
	    List<Product> products = productDAO.getProductsBySearch(search);
	    model.addAttribute("products", products);
	    return "search";
	}
	@GetMapping("/product")
	public String showProduct(@RequestParam("id") int productId, Model model) {
	    Product product = productDAO.getProduct(productId);
	    model.addAttribute("product", product);
	    return "product"; 
	}


}
