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
@RequestMapping("/shrugsController")
public class ShrugsController {
	
	@Autowired
    private ProductDAO productDAO;
	
	@GetMapping("/shrugs")
	public String shrugs(@RequestParam(defaultValue = "1") int page, Model model) {
	    List<Product> allShrugs = productDAO.getProductsByCategory("Shrugs");
	    int size=allShrugs.size();
	    int pageSize = 10;
	    int totalPages = (int) Math.ceil(allShrugs.size() / (double) pageSize);

	    if (page < 1) page = 1;
	    if (page > totalPages) page = totalPages;

	    int fromIndex = (page - 1) * pageSize;
	    int toIndex = Math.min(fromIndex + pageSize, allShrugs.size());

	    List<Product> pagedShrugs = allShrugs.subList(fromIndex, toIndex);

	    System.out.println("Page: " + page);
	    System.out.println("From: " + fromIndex + ", To: " + toIndex);
	    model.addAttribute("size", size);
	    model.addAttribute("shrugs", pagedShrugs);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "shrugs"; // View name must match your template: shrugs.jsp or shrugs.html
	}
	
	@GetMapping("/product")
	public String showProduct(@RequestParam("id") int productId, Model model) {
	    Product product = productDAO.getProduct(productId);
	    model.addAttribute("product", product);
	    return "product"; 
	}

}
