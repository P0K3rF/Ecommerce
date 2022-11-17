package com.concerto.ecommerce.controller;

import java.util.ArrayList;
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
import com.concerto.ecommerce.dto.LoginCredentialsRequestDto;
import com.concerto.ecommerce.dto.OrderRequestDto;
import com.concerto.ecommerce.dto.ResponseStatus;
import com.concerto.ecommerce.entity.Customer;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.service.CustomerService;
import com.concerto.ecommerce.service.LoginCredentialsService;
import com.concerto.ecommerce.service.OrderService;
import com.concerto.ecommerce.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	LoginCredentialsService credentialsService;

	@Autowired
	ProductService productService;

	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;

	List<Product> cartProduct = new ArrayList<>();

	@RequestMapping({ "/", "index" })
	public String home(Model m) {
		m.addAttribute("products", this.productService.getAllProducts());
		return "homepage";
	}

	@RequestMapping("/login")
	public String login(Model m) {
		m.addAttribute("loginCredentialDto", new LoginCredentialsRequestDto());
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(@Valid @ModelAttribute("loginCredentialDto") LoginCredentialsRequestDto credentials,
			BindingResult bindingResult, HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "login";
		}
		
		if (this.credentialsService.validate(credentials)) {
			if(this.credentialsService.getCredentails(credentials.getEmail()).getRole().equals("ROLE_ADMIN"))
				{
				session.setAttribute("admin", "admin");
				return "redirect:admin/dashboard";
				}
			CustomerRequestDto customerRequestDto = ValueMapper
					.convertCustomerToCustomerRequestDto(this.customerService.getCustomerById(credentials.getEmail()));

			session.setAttribute("user", customerRequestDto);
			return "redirect:/";
		} else {
			return "redirect:login?msg=Invalid Credentials";
		}
	}
	
	@PostMapping("/getCartProduct")
	public @ResponseBody List<Product> getProductsInCart(@RequestBody String data,HttpSession session) throws Exception {
		
		if(session.getAttribute("user")==null) {
			return null;
		}
		if(!this.cartProduct.isEmpty())
			return this.cartProduct;
		return null;
	}
	
	
	
	@PostMapping("/removeproduct")
	public @ResponseBody List<Product> removeProduct(@RequestBody String pid){
		
		List<Product> afterRemovingCart=new ArrayList<>();
		JSONObject jsonObj = new JSONObject(pid);
		int prodId = jsonObj.getInt("pid");
		
	this.cartProduct.stream().filter(cartp->cartp.getItemId()!=prodId).forEach(afterRemovingCart::add);
	
	cartProduct=afterRemovingCart;
		return cartProduct;
	}
	
	

	@PostMapping("/proudctId")
	public @ResponseBody List<Product> getProductById(@RequestBody String pid, HttpSession session) throws Exception {
		
		if(session.getAttribute("user")==null) {
			return null;
		}
		
		JSONObject jsonObj = new JSONObject(pid);
		int prodId = jsonObj.getInt("pid");
		Product product = this.productService.getProductById(prodId);
		if (cartProduct.isEmpty()) {
			cartProduct.add(product);
		} else {
			for (Product p : cartProduct) {
				if (p.getItemId() == prodId) {
					return cartProduct;
				}
			}
			cartProduct.add(product);
		}
		System.out.println(cartProduct);
		return cartProduct;
	}
	
	
	@PostMapping("/search")
	public @ResponseBody List<Product> getProductBySearch(@RequestBody String productName){
		JSONObject jsonObj = new JSONObject(productName);
		String name = jsonObj.getString("productName");
		System.out.println(name);
		if (name.trim().isEmpty()) {
			name="";
		}
		return this.productService.getProductBySearch(name);
	}
	
	
	@PostMapping("/buyproduct")
	public @ResponseBody ResponseStatus<String> buyProduct(@RequestBody String pid,HttpSession session){
		
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");
//		System.out.println();
		
	CustomerRequestDto customer=(CustomerRequestDto)session.getAttribute("user");
		if(
		this.orderService.buyProduct(customer.getEmail(), prodId))
			return new ResponseStatus<>(200,"Order Placed");
		else
			return new ResponseStatus<>(401,"Out Of Stock");
		
	}

	@GetMapping("/viewproduct")
	public String viewProductPage(@RequestParam("product_id") int productId,Model m) {
		Product product= this.productService.getProductById(productId);
		m.addAttribute("product",product);
		
		System.out.println("Product Id is "+ productId);
		return "viewproduct";
	}
	
	
	
}
