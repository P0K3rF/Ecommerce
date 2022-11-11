package com.concerto.ecommerce.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.concerto.ecommerce.dto.ResponseStatus;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.repository.ProductRepository;
import com.concerto.ecommerce.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	@Autowired
	ProductService productService;
	
	@GetMapping("/dashboard")
	public String adminDashboard(Model m) {
		List<Product> products=this.productService.getAllProducts();
		m.addAttribute("products",products);
		return "dashboard";
	}
	
	@PostMapping("/getproductbyid")
	public @ResponseBody ResponseStatus<Product> getProductById(@RequestBody String pid){
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");	
		System.out.println(prodId);
		
	Product product=this.productService.getProductById(prodId);
		
		return new ResponseStatus<Product>(200, product);
	
	}

}
