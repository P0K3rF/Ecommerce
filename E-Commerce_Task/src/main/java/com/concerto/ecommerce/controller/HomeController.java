package com.concerto.ecommerce.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
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
import com.concerto.ecommerce.dto.ResponseStatus;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.mapper.ValueMapper;
import com.concerto.ecommerce.service.CustomerService;
import com.concerto.ecommerce.service.LoginCredentialsService;
import com.concerto.ecommerce.service.OrderService;
import com.concerto.ecommerce.service.ProductService;

@Controller
public class HomeController{

	@Autowired
	LoginCredentialsService credentialsService;

	@Autowired
	ProductService productService;

	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;

	List<Product> cartProduct = new ArrayList<>();

	
	
	
	//index page
	@RequestMapping({ "/", "index" })
	public String home(@RequestParam(required = false)String page,Model m) {
		int pag=0;
		if(page!=null) {
			pag=Integer.parseInt(page);
		}
		List<Product>	products=this.productService.getAllProductsPageable(pag).getContent();
		m.addAttribute("products",products);
		m.addAttribute("count",this.productService.getProductCount());
		return "homepage";
	}

	
	//Login Page
	@RequestMapping("/login")
	public String login(Model m) {
		m.addAttribute("loginCredentialDto", new LoginCredentialsRequestDto());
		return "login";
	}

	
	//Login Process
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

	//Get Cart Product through ajax
	@PostMapping(path="/getCartProduct")
	public @ResponseBody ResponseStatus<List<Product>>  getProductsInCart(@RequestBody String data,HttpSession session){
		if(this.cartProduct.isEmpty())
		{
			return new ResponseStatus<>(204,cartProduct);
		}
		return new ResponseStatus<>(200,cartProduct);

	}
	
	
	
	//Remove Product from cart
	@PostMapping("/removeproduct")
	public @ResponseBody List<Product> removeProduct(@RequestBody String pid){
		
		List<Product> afterRemovingCart=new ArrayList<>();
		JSONObject jsonObj = new JSONObject(pid);
		int prodId = jsonObj.getInt("pid");
		
	this.cartProduct.stream().filter(cartp->cartp.getItemId()!=prodId).forEach(afterRemovingCart::add);
	
	cartProduct=afterRemovingCart;
		return cartProduct;
	}
	
	
	//Get product by productId
	@PostMapping("/proudctId")
	public @ResponseBody ResponseStatus<List<Product>> getProductById(@RequestBody String pid, HttpSession session) throws NullPointerException {
		
		if(session.getAttribute("user")==null) {
			return new ResponseStatus<>(401,null);
		}
		
		JSONObject jsonObj = new JSONObject(pid);
		int prodId = jsonObj.getInt("pid");
		Product product = this.productService.getProductById(prodId);
		if (cartProduct.isEmpty()) {
			cartProduct.add(product);
		} else {
			for (Product p : cartProduct) {
				if (p.getItemId() == prodId) {
					return new ResponseStatus<>(200,cartProduct);
				}
			}
			cartProduct.add(product);
		}
		return new ResponseStatus<>(200,cartProduct);
	}
	
	
	
	//Search Product 
	@PostMapping("/search")
	public @ResponseBody List<Product> getProductBySearch(@RequestBody String productName){
		JSONObject jsonObj = new JSONObject(productName);
		String name = jsonObj.getString("productName");
		if (name.trim().isEmpty()) {
			name="";
		}
		return this.productService.getProductBySearch(name);
	}
	
	
	/*
	 * @PostMapping("/buyproduct") public @ResponseBody ResponseStatus<String>
	 * buyProduct(@RequestBody String pid,HttpSession session){
	 * 
	 * JSONObject orderJson = new JSONObject(pid); int
	 * prodId=orderJson.getInt("productId");
	 * 
	 * CustomerRequestDto customer=(CustomerRequestDto)session.getAttribute("user");
	 * if( this.orderService.buyProduct(customer.getEmail(), prodId)) return new
	 * ResponseStatus<>(200,"Order Placed"); else return new
	 * ResponseStatus<>(401,"Out Of Stock");
	 * 
	 * }
	 */
	
	
	//Check for out of stock
	@PostMapping("/checkoutofstock")
	public @ResponseBody ResponseStatus<String> checkOutOfStocks(@RequestBody String pid,HttpSession session) 
	{
		if(session.getAttribute("user")==null) {
			return new ResponseStatus<>(405,"Forbidden Request");
		}
		
		
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");
		if(this.orderService.checkOutOfStocks(prodId))
			return new ResponseStatus<>(200,"Product in Stocks");
		return new ResponseStatus<>(401,"Out Of Stock");
	}
	
	//View All Product
	@GetMapping("/viewproduct")
	public String viewProductPage(@RequestParam("product_id") int productId,Model m) {
		Product product= this.productService.getProductById(productId);
		m.addAttribute("product",product);
		return "viewproduct";
	}
	
	
	
}
