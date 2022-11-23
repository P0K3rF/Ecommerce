package com.concerto.ecommerce.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.concerto.ecommerce.dto.CustomerRequestDto;
import com.concerto.ecommerce.dto.ResponseStatus;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Order;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.service.CustomerService;
import com.concerto.ecommerce.service.OrderService;
import com.concerto.ecommerce.service.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
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
	
	@GetMapping("/payment")
	public String paymentPage(HttpSession session, @RequestParam("product_id")String pid,Model m) throws JsonProcessingException {
		if(session.getAttribute("user")==null)
			return "redirect:/login";
	Product p=this.productService.getProductById(Integer.parseInt(pid));
	ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
	List<Product> products=this.productService.getAllProducts();
	String json = ow.writeValueAsString(products);
	
		m.addAttribute("product",json);
		return "payment";
	}
	
	@PostMapping("/checkforEmail")
	public @ResponseBody ResponseStatus<String> checkEmail(@RequestBody String email){
		JSONObject jsonObj = new JSONObject(email);
		String customerEmail = jsonObj.getString("email");

		if(this.customerService.checkForEmail(customerEmail))
			return new ResponseStatus<>(200,"SUCCESS");
		return new ResponseStatus<>(401,"This email does not match your current email please recheck");

	}
	
	
	@PostMapping("/updateEmail")
	public @ResponseBody ResponseStatus<String> updateEmail(@RequestBody String email,HttpSession session){
		JSONObject jsonObj = new JSONObject(email);
		String customerEmail = jsonObj.getString("email");
	CustomerRequestDto customerRequestDto=(CustomerRequestDto)session.getAttribute("user");
		if(this.customerService.updateEmail(customerRequestDto.getMobileNo(),customerRequestDto.getEmail(),customerEmail))
			return new ResponseStatus<>(200,"SUCCESS");
		return new ResponseStatus<>(500,"Something Went wrong please Try again later");
		
		
		
	}
	
}
