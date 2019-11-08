package com.medirone.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medirone.web.dto.Agency;
import com.medirone.web.dto.Manager;
import com.medirone.web.service.AgencyService;

@Controller
@RequestMapping("/update")
public class UpdateController {
	private static final Logger logger = LoggerFactory.getLogger(UpdateController.class);

	@Autowired
	private AgencyService service;
	
	@GetMapping("/up")
	public String updateMemberForm(String agency_id, Model model) {
		Agency agency = service.getAgency(agency_id);
		Manager manager = service.getManager(agency_id);
		model.addAttribute("agency", agency);
		model.addAttribute("manager", manager);
		return "member/updateMemberForm";
	}
	
	@PostMapping("/updateSuccess")
	public String updateMember(Agency agency, Manager manager, HttpSession session) {
		manager.setManager_agency_id(agency.getAgency_id());
		service.updateMember(agency, manager);
		String nowId = (String)session.getAttribute("agency_Id");
		
		return "redirect:/request";
		
	}
}
