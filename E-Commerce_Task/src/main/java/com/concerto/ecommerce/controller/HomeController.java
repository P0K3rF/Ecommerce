package com.concerto.ecommerce.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.dto.LoginCredentialsRequestDto;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.service.CustomerService;
import com.concerto.ecommerce.service.LoginCredentialsService;
import com.concerto.ecommerce.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	LoginCredentialsService credentialsService; 
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CustomerService customerService;
	
	List<Product> cartProduct=new ArrayList<>();
	
	@RequestMapping({"/","index"})
	public String home(Model m) {
		m.addAttribute("products", this.productService.getAllProducts());
		return "homepage";
	}

	@RequestMapping("/login")
	public String login(Model m) {
		m.addAttribute("loginCredentialDto",new LoginCredentialsRequestDto());
		return "login";
	}
	
	@PostMapping("/login")
	public String postLogin(@Valid @ModelAttribute("loginCredentialDto") LoginCredentialsRequestDto credentials ,BindingResult bindingResult,HttpSession session) {
		if(bindingResult.hasErrors()) {
			return "login";
		}
		if(this.credentialsService.validate(credentials)) {
	CustomerRequestDto customerRequestDto=ValueMapper.convertCustomerToCustomerRequestDto(this.customerService.getCustomerById(credentials.getEmail()));	
	
	session.setAttribute("user", customerRequestDto);
			return "redirect:/";
		}else {
		return "redirect:login?msg=Invalid Credentials";
		}
	}
	
	@PostMapping("/proudctId")
	public @ResponseBody Product getProductById(@RequestBody String pid,Model m) {
	Product product=this.productService.getProductById(pid);
	cartProduct.add(product);
	m.addAttribute("cartProduct",cartProduct);
	System.out.println(m.getAttribute("cartProduct"));
	return product;
	}
	
}
