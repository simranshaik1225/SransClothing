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
@RequestMapping("/dressController")
public class DressController {
	
	@Autowired
    private ProductDAO productDAO;
	

	    @GetMapping("/dress")
	    public String dress(@RequestParam(defaultValue = "1") int page, Model model) {
	        List<Product> allDresses = productDAO.getProductsByCategory("Dresses");
	        int size=allDresses.size();
	        int pageSize = 10;
	        int totalPages = (int) Math.ceil(allDresses.size() / (double) pageSize);

	        if (page < 1) page = 1;
	        if (page > totalPages) page = totalPages;

	        int fromIndex = (page - 1) * pageSize;
	        int toIndex = Math.min(fromIndex + pageSize, allDresses.size());

	        List<Product> pagedDresses = allDresses.subList(fromIndex, toIndex);

	        System.out.println("Page: " + page);
	        System.out.println("From: " + fromIndex + ", To: " + toIndex);
	        model.addAttribute("size", size);
	        model.addAttribute("dresses", pagedDresses);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);

	        return "dress";
	    }
	
	    @GetMapping("/product")
		public String showProduct(@RequestParam("id") int productId, Model model) {
		    Product product = productDAO.getProduct(productId);
		    model.addAttribute("product", product);
		    return "product"; 
		}


}
