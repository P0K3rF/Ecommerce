package com.concerto.ecommerce.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class ErrorHandler implements ErrorController{

	
	  @GetMapping("/error")
	    public String handleError(HttpServletRequest request) {
	        String errorPage = "error"; // default
	         
	        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	         
	        if (status != null) {
	            Integer statusCode = Integer.valueOf(status.toString());
	             
	            if (statusCode == HttpStatus.NOT_FOUND.value()) {
	                // handle HTTP 404 Not Found error
	                errorPage = "404";
	                 
	            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
	                // handle HTTP 403 Forbidden error
	                errorPage = "403";
	                 
	            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	                // handle HTTP 500 Internal Server error
	                errorPage = "500";
	                 
	            }
	        }
	         
	        return errorPage;
	    }

}
