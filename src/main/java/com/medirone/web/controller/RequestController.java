package com.medirone.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class RequestController {
	
	@RequestMapping("/requestList")
	public String requestList() {
		return "/request/requestList";
	}
	@RequestMapping("/medrequest")
	public String medrequest() {
		return "/request/medrequest";
	}
}
