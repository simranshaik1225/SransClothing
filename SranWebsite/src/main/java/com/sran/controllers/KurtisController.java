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
@RequestMapping("/kurtisController")
public class KurtisController {
	@Autowired
    private ProductDAO productDAO;

	@GetMapping("/kurtis")
	public String kurtis(@RequestParam(defaultValue = "1") int page, Model model) {
	    List<Product> allKurtis = productDAO.getProductsByCategory("Kurti");
	    int size=allKurtis.size();
	    int pageSize = 10;
	    int totalPages = (int) Math.ceil(allKurtis.size() / (double) pageSize);

	    if (page < 1) page = 1;
	    if (page > totalPages) page = totalPages;

	    int fromIndex = (page - 1) * pageSize;
	    int toIndex = Math.min(fromIndex + pageSize, allKurtis.size());

	    if (fromIndex >= allKurtis.size() || fromIndex < 0) {
	        fromIndex = 0;
	        toIndex = Math.min(pageSize, allKurtis.size());
	    }

	    List<Product> pagedKurtis = allKurtis.subList(fromIndex, toIndex);
	    model.addAttribute("size", size);
	    model.addAttribute("kurtis", pagedKurtis);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "kurtis"; // name of your JSP file
	}
	
	@GetMapping("/product")
	public String showProduct(@RequestParam("id") int productId, Model model) {
	    Product product = productDAO.getProduct(productId);
	    model.addAttribute("product", product);
	    return "product"; 
	}


}
