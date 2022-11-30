package com.concerto.ecommerce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.retry.annotation.EnableRetry;

import com.concerto.ecommerce.service.OrderService;

@SpringBootApplication
@EnableRetry
public class ECommerceTaskApplication implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory>{

	@Autowired
	OrderService orderService;

	public static void main(String[] args) {
	SpringApplication.run(ECommerceTaskApplication.class, args);
			
	}

	@Override
	public void customize(ConfigurableServletWebServerFactory factory) {
		factory.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND,"/views/404.jsp"));
		
		
	        factory.addErrorPages(new ErrorPage("/views/error.jsp"));
		
	}
	
	
	
}
