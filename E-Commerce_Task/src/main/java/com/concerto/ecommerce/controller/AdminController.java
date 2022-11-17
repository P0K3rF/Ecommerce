package com.concerto.ecommerce.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.concerto.ecommerce.dto.ProductRequestDto;
import com.concerto.ecommerce.dto.ResponseStatus;
import com.concerto.ecommerce.entity.Product;
import com.concerto.ecommerce.repository.ProductRepository;
import com.concerto.ecommerce.service.ProductService;
import com.concerto.ecommerce.util.ImageUploader;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	@Autowired
	ProductService productService;
	
	@Autowired
	ImageUploader imageUploader;
	
	@Value("${upload.image}")
	private String path;
	
	@GetMapping("/dashboard")
	public String adminDashboard(Model m,HttpSession session) {
		if(session.getAttribute("admin")!=null) {
			List<Product> products=this.productService.getAllProducts();
			m.addAttribute("products",products);
			return "dashboard";	
		}
		return "redirect:/login";
	}
	
	
	@GetMapping("/testdashboard")
	public String adminDashboardPageable(@RequestParam(required = false)String page,Model m,HttpSession session) {
		int pag=Integer.parseInt(page);
		List<Product>	products=this.productService.getAllProductsPageable(pag).getContent();
		m.addAttribute("products",products);
		m.addAttribute("count",this.productService.getProductCount());
		
		return "testingdashboard";
		/*
		 * if(session.getAttribute("admin")!=null) { List<Product>
		 * products=this.productService.getAllProducts();
		 * m.addAttribute("products",products); return "dashboard"; }
		 */
//		return "redirect:/login";
	}
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("/getproductbyid")
	public @ResponseBody ResponseStatus<Product> getProductById(@RequestBody String pid){
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");	
		System.out.println(prodId);
		
	Product product=this.productService.getProductById(prodId);
		
		return new ResponseStatus<Product>(200, product);
	
	}
	
	@PostMapping("/deleteproductbyid")
	public @ResponseBody ResponseStatus<String> deleteProductById(@RequestBody String pid){
		JSONObject orderJson = new JSONObject(pid);
		int prodId=orderJson.getInt("productId");	
		
		if(this.productService.deleteProuctById(prodId))
			return new ResponseStatus<>(200,"sucess");
		return new ResponseStatus<>(401,"faild");
	}
	
	
	@PostMapping("/addproduct")
	public @ResponseBody ResponseStatus<String> addProduct(@ModelAttribute ProductRequestDto dto) throws IOException
	{
		String filename=this.imageUploader.uploadImage(path, dto.getImage());
		System.out.println("From controller" +filename);
		dto.setItemPhoto(filename);
		this.productService.insertProduct(dto);
		return new ResponseStatus<>(200,"success");
	}
	
	@PostMapping("/updateproduct")
	public @ResponseBody ResponseStatus<String> updateProduct(@ModelAttribute ProductRequestDto dto) throws IOException
	{
		System.out.println("update Product Called with the data : " + dto);
		this.imageUploader.setId(dto.getItemId());
		String filename=this.imageUploader.uploadImage(path, dto.getImage());
		dto.setItemPhoto(filename);
		this.productService.updateProduct(dto);
		return new ResponseStatus<>(200,"success");
	}
}
