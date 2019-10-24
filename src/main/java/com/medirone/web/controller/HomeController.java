package com.medirone.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medirone.web.service.AgencyService;
import com.medirone.web.service.LoginResult;

@Controller
public class HomeController {
	@Autowired
	private AgencyService Aservice;
		
	@RequestMapping("/")
	public String home2() {
		return "home2";
	}
	
	
	@PostMapping("/login")
	public String Login(String Agency_id,String Agency_password, HttpSession session) {
		LoginResult result = Aservice.login(Agency_id,Agency_password);
		if(result == LoginResult.FAIL_MID) {
			return "redirect:/home2?error=fail_aid";
		}else if(result == LoginResult.FAIL_MPASSWORD) {
			return "redirect:/home2?error=fail_apssword";
		}
		session.setAttribute("agency_Id",Agency_id);
		
		return "home";
		
	}
	
}
