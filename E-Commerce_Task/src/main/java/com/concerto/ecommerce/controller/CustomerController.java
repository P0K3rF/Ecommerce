package com.concerto.ecommerce.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	
	@RequestMapping("/register")
	public String registration(Model m) {
		m.addAttribute("customerDto", new CustomerRequestDto());
		return "registration";
	}
	
	@PostMapping("/register")
	public String processFormRegister(@Valid @ModelAttribute("customerDto") CustomerRequestDto customerRequestDto,BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "registration";
		}
		this.customerService.insertCustomer(customerRequestDto);
		return "redirect:/login?msg=successfully register";
	}
	
	
	
}
