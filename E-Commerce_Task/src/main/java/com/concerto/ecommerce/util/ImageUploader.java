package com.concerto.ecommerce.util;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.concerto.ecommerce.service.ProductService;

@Component
public class ImageUploader {
	
	@Autowired
	ProductService productService;
	int productId;
	//Image uploading by taking path and binary data of image
	public String uploadImage(String path,MultipartFile  file)
	{
		try {
			String name=file.getOriginalFilename();
			
			if(name!=null && !name.isEmpty()) {
				String randomId=UUID.randomUUID().toString();
				String fileName=randomId.concat(name.substring(name.lastIndexOf(".")));		
				String fullpath=path+File.separator+fileName;
				File f=new File(path);

				if(!f.exists())
					f.mkdir();
				
				Files.copy(file.getInputStream(),Paths.get(fullpath));
				return fileName;
			}else {
				return this.productService.getProductById(productId).getItemPhoto();
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void setId(int id) {
		this.productId=id;
	}
}
