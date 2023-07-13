package com.luv2code.springsecurity.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {

	@GetMapping("/")
	public String showHome() {
		
		return "index";
	}
	@GetMapping("/file")
	public String showFile() {
		
		return "file";
	}
 
	// add request mapping for /leaders

	@GetMapping("/leaders")
	public String showLeaders() {
		
		return "leaders";
	}
	@GetMapping("/updateTuThien")
	public String updateTuThien() {
		
		return "updateTuThien";
	}
	// add request mapping for /systems
	
	@GetMapping("/systems")
	public String showSystems() {
		
		return "systems";
	}
	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage() {
		
		// return "plain-login";

		return "fancy-login";
		
	}
	
	

	
	@GetMapping("/Register")
	public String Register() {
		return "Register";
	}
	@GetMapping("/donate")
	public String donate() {
		
		return "donate";
		
	}
	
	@GetMapping("/SystemsUser")
	public String systemUser() {
		
		return "SystemsUser";
		
	}
	
	@GetMapping("/updateUser")
	public String updateUser() {
		
		return "updateUser";
		
	}
	

	@GetMapping("/updateAuthor")
	public String updateAuthor() {
		
		return "updateAuthor";
		
	}
	
	@GetMapping("/searchUser")
public String searchResults() {
		
		return "searchUser";
		
	}
}










