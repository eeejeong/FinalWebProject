package com.medirone.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/itemManagement")
public class ItemManagementController {
	private static final Logger logger = LoggerFactory.getLogger(ItemManagementController.class);
	
	@RequestMapping("/")
	public String itemManagement(){
		return "redirect:/itemManagement/medicineList";
	}
	
	@RequestMapping("/medicineList")
	public String medicineList() {
		return "/itemManagement/medicineList";
	}
	
	@RequestMapping("/bloodList")
	public String bloodList() {
		return "/itemManagement/bloodList";
	}

}
