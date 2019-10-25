package com.medirone.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	
	@RequestMapping("/home2")
	public String Logincheck(String error, Model model) {
		if(error!= null) {
			if(error.equals("fail_mid")) {
				model.addAttribute("errorAgency_id","*아이디가 존재하지 않습니다");
				System.out.println("아이디가 없다");
			}else if(error.equals("fail_mpassword")) {
				model.addAttribute("errorAgency_password","*패스워드가 틀립니다");
				System.out.println("비밀번호가 없다");
			}
		}
		return "home2";
	}
	
	
	
	@PostMapping("/login")
	public String Login(String Agency_id,String Agency_password, HttpSession session) {
		LoginResult result = Aservice.login(Agency_id,Agency_password);
		if(result == LoginResult.FAIL_MID) {
			return "redirect:/home2?error=fail_mid";
		}else if(result == LoginResult.FAIL_MPASSWORD) {
			return "redirect:/home2?error=fail_mpassword";
		}
		session.setAttribute("agency_Id",Agency_id);
		
		return "home";
		
	}
	
}
