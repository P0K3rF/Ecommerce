package com.concerto.ecommerce.controller;

import java.util.List;

import javax.persistence.EntityExistsException;
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
import com.concerto.ecommerce.dto.OrderRequestDto;
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
	
	private  static final String REDIRECTTOLOGIN="redirect:/login";
	
//Register Page
	@RequestMapping("/register")
	public String registration(Model m) {
		m.addAttribute("customerDto", new CustomerRequestDto());
		return "registration";
	}

	//Processing Register
	@PostMapping("/register")
	public String processFormRegister(@Valid @ModelAttribute("customerDto") CustomerRequestDto customerRequestDto,
			BindingResult bindingResult,@RequestParam(required = false,name = "msg") String message,Model m) {
		if (bindingResult.hasErrors()) {
			return "registration";
		}
		if(message!=null) {
			m.addAttribute("errormsg",message);
		}
		try {
		 this.customerService.insertCustomer(customerRequestDto); 
		 return "redirect:/login?msg=successfully register";
		}catch(EntityExistsException e) {
			return "redirect:register?msg=Email already exists";
		}
			
	}
	
	//Logout Functionality
	@RequestMapping("/logout")
		public String logoutUser(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}

	
	
	//Profile page
	@GetMapping("/profile")
	public String profile(@RequestParam(name = "msg",required = false)String msg,HttpSession session,Model m) {
		if(session.getAttribute("user")==null)
			return REDIRECTTOLOGIN;
		
		m.addAttribute("customerDto", new CustomerRequestDto());
		return "profile";
	}
	
	//Processing profile update
	@PostMapping("/profile")
	public String updateProfile(@Valid @ModelAttribute("customerDto") CustomerRequestDto customerRequestDto,
			BindingResult bindingResult,HttpSession session,Model m) {	
		if (bindingResult.hasErrors()) {
			
			return "profile";
		}
		CustomerRequestDto customerDtoFromSession = (CustomerRequestDto) session.getAttribute("user");
		String oldEmail=customerDtoFromSession.getEmail();
	Customer customer=this.customerService.getCustomerByEmail(oldEmail);
	customerRequestDto.setCustomerId(customer.getCustomerId());
	try {
		if(this.customerService.updateCustomer(customerRequestDto,oldEmail))
		{
			session.setAttribute("user", customerRequestDto);
			return "redirect:profile?msg=Succesfully updated";
		}
		m.addAttribute("msg","Email Already exists");
		return "redirect:profile?msg=Email already exists";
	}catch(EntityExistsException e) {
		return "redirect:profile?msg=Email already exists";
	}
	}
	
	
	
	//Showing Order Page
	@GetMapping("/order")
	public String orderPage(HttpSession session, Model m) {
		if (session.getAttribute("user") == null)
			return REDIRECTTOLOGIN;
		CustomerRequestDto customerRequestDto = (CustomerRequestDto) session.getAttribute("user");
		Customer customer = ValueMapper.convertCustomerRequestDtoToCustomer(customerRequestDto);
		List<Order> orders = this.orderService.getAllOrderByEmail(customer);
		m.addAttribute("orders", orders);
		return "order";
	}

	//
	@GetMapping("/payment")
	public String paymentPage(HttpSession session, @RequestParam("product_id") String pid, Model m)
			throws JsonProcessingException {
		if (session.getAttribute("user") == null)
			return REDIRECTTOLOGIN;
		Product product = this.productService.getProductById(Integer.parseInt(pid));
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		ResponseStatus<Product> pro = new ResponseStatus<>(200, product);
		String json = ow.writeValueAsString(pro);
		m.addAttribute("product", json);
		m.addAttribute("count", 1);
		return "payment";
	}

	
	//Checking Email from order page
	@PostMapping("/checkforEmail")
	public @ResponseBody ResponseStatus<String> checkEmail(@RequestBody String email) {
		JSONObject jsonObj = new JSONObject(email);
		String customerEmail = jsonObj.getString("email");

		if (this.customerService.checkForEmail(customerEmail))
			return new ResponseStatus<>(200, "SUCCESS");
		return new ResponseStatus<>(401, "This email does not match your current email please recheck");

	}

	
	//Updating Email from order page
	@PostMapping("/updateEmail")
	public @ResponseBody ResponseStatus<String> updateEmail(@RequestBody String email, HttpSession session) {
		JSONObject jsonObj = new JSONObject(email);
		String customerEmail = jsonObj.getString("email");
		CustomerRequestDto customerRequestDto = (CustomerRequestDto) session.getAttribute("user");
		if (this.customerService.updateEmail(customerRequestDto.getMobileNo(), customerRequestDto.getEmail(),
				customerEmail))
			return new ResponseStatus<>(200, "SUCCESS");
		return new ResponseStatus<>(500, "Something Went wrong please Try again later");
	}

	//Buying product method
	@PostMapping("/buyproduct")
	public @ResponseBody ResponseStatus<String> buyProduct(@RequestBody OrderRequestDto orderDto, HttpSession session) {
		CustomerRequestDto customerRequestDto = (CustomerRequestDto) session.getAttribute("user");
	Customer customer=this.customerService.getCustomerById(customerRequestDto.getEmail());
		if(this.orderService.buyNewProduct(orderDto,customer))
			return new ResponseStatus<>(200,"Success");
		return new ResponseStatus<>(500, "Something Went wrong please Try again later");
		
	}
	
	//Getting order by orderId
	@PostMapping("/getOrderById")
	public @ResponseBody ResponseStatus<Order> getOrderById(@RequestBody String ajaxOrderId){
		
		JSONObject jsonObject=new JSONObject(ajaxOrderId);
		int orderId=jsonObject.getInt("orderId");
		Order order=this.orderService.getOrderByOrderId(orderId);
		return new ResponseStatus<>(200, order);
	}
	

}
