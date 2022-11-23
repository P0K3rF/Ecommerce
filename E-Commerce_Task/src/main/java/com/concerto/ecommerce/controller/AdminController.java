package com.concerto.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
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
import com.concerto.ecommerce.service.ProductService;
import com.concerto.ecommerce.util.ImageUploader;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final String SUCCESS = "success";

	@Autowired
	ProductService productService;

	@Autowired
	ImageUploader imageUploader;

	// Path of the image folder
	@Value("${upload.image}")
	private String path;

	// Request Page of Admin Dashboard
	@GetMapping("/dashboard")
	public String adminDashboard(@RequestParam(required = false) String page, Model m, HttpSession session) {
		int pag;
		if (page == null) {
			pag = 0;
		} else {
			pag = Integer.parseInt(page);
		}
		if (session.getAttribute("admin") != null) {
			List<Product> products = this.productService.getAllProductsPageable(pag).getContent();
			m.addAttribute("products", products);
			m.addAttribute("count", this.productService.getProductCount());
			return "dashboard";
		}
		return "redirect:/login";
	}

	// Ajax Call for getting product By id to get data in the update Form
	@PostMapping("/getproductbyid")
	public @ResponseBody ResponseStatus<Product> getProductById(@RequestBody String pid) {
		try {
			JSONObject orderJson = new JSONObject(pid);
			int prodId = orderJson.getInt("productId");
			Product product = this.productService.getProductById(prodId);
			return new ResponseStatus<>(200, product);
		} catch (EntityNotFoundException entityNotFoundException) {
			return new ResponseStatus<>(400, null);
		}

	}

	// Ajax Call for deleting the data
	@PostMapping("/deleteproductbyid")
	public @ResponseBody ResponseStatus<String> deleteProductById(@RequestBody String pid) {
		JSONObject orderJson = new JSONObject(pid);
		int prodId = orderJson.getInt("productId");

		if (this.productService.deleteProuctById(prodId))
			return new ResponseStatus<>(200, SUCCESS);
		return new ResponseStatus<>(401, "faild");
	}

	// Ajax for adding data to database

	@PostMapping("/addproduct")
	public @ResponseBody ResponseStatus<String> addProduct(@ModelAttribute ProductRequestDto dto) {
		String filename = this.imageUploader.uploadImage(path, dto.getImage());
		dto.setItemPhoto(filename);
		this.productService.insertProduct(dto);
		return new ResponseStatus<>(200, SUCCESS);
	}

	// Ajax call for updating the data
	@PostMapping("/updateproduct")
	public @ResponseBody ResponseStatus<String> updateProduct(@ModelAttribute ProductRequestDto dto) {
		this.imageUploader.setId(dto.getItemId());
		String filename = this.imageUploader.uploadImage(path, dto.getImage());
		dto.setItemPhoto(filename);
		this.productService.updateProduct(dto);
		return new ResponseStatus<>(200, SUCCESS);
	}

	// Getting value from the uploaded Excel file
	@PostMapping("/excelUpload")
	public @ResponseBody ResponseStatus<String> excelupload(MultipartFile file) {

		try {
			HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
			System.out.println(workbook.getNumberOfSheets());
			HSSFSheet sheet = workbook.getSheetAt(0);
			System.out.println(sheet.getPhysicalNumberOfRows());
			
			  for(int i=1; i<sheet.getPhysicalNumberOfRows();i++) { HSSFRow row =
			  sheet.getRow(i);
			  
			  for(int j=0;j<row.getPhysicalNumberOfCells();) {
			  row.getCell(j).setCellType(CellType.STRING); ProductRequestDto p=new
			 ProductRequestDto(); p.setItemName(row.getCell(j).toString());
			  p.setItemDescription(row.getCell(j+1).toString());
			  
			 p.setItemPrice(Double.parseDouble(row.getCell(j+3).toString())); double
			 d=(row.getCell(j+2).getNumericCellValue()); Double d1=Double.valueOf(d);
			 p.setItemQuantity(d1.intValue());
			 p.setItemPhoto(row.getCell(j+4).toString());
			 this.productService.insertProduct(p); break;
			 
			 } }
			 

		} catch (IOException e) {
			return new ResponseStatus<>(500, "Internal Server Error");
		}

		return new ResponseStatus<>(200, SUCCESS);
	}

}
