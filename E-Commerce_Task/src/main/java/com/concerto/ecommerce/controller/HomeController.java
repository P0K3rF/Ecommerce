package com.concerto.ecommerce.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.concerto.ecommerce.dto.LoginCredentialsRequestDto;
import com.concerto.ecommerce.service.LoginCredentialsService;

@Controller
public class HomeController {
	
	@Autowired
	LoginCredentialsService credentialsService; 
	
	@RequestMapping({"/","index"})
	public String home() {
		return "homepage";
	}

	@RequestMapping("/login")
	public String login(Model m) {
		m.addAttribute("loginCredentialDto",new LoginCredentialsRequestDto());
		return "login";
	}
	
	@PostMapping("/login")
	public String postLogin(@Valid @ModelAttribute("loginCredentialDto") LoginCredentialsRequestDto credentials ,BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "login";
		}
		if(this.credentialsService.validate(credentials)) {
			return "dashboard";
		}
		return "login?msg=Invalid Credentials";
	}
}
