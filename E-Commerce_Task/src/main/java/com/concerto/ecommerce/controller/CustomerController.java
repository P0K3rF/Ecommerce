package com.concerto.ecommerce.controller;

import java.security.Principal;
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
import org.springframework.web.bind.annotation.RequestMapping;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Order;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.service.CustomerService;
import com.concerto.ecommerce.service.OrderService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;
	
	
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
	
	@GetMapping("/order")
	public String orderPage(HttpSession session,Model m) {
		if(session.getAttribute("user")==null)
			return "redirect:/login";
	CustomerRequestDto customerRequestDto=(CustomerRequestDto)session.getAttribute("user");
	Customer customer=ValueMapper.convertCustomerRequestDtoToCustomer(customerRequestDto);
		List<Order> orders=this.orderService.getAllOrderByEmail(customer);
		m.addAttribute("orders",orders);
		return "order";
	}
	
	
}
