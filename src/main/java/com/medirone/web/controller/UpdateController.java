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
	
	private double originalLat;
	private double originalLng;
	
	@RequestMapping("/up")
	public String updateMemberForm(Model model, HttpSession session) {
		String agency_id = (String) session.getAttribute("agency_Id");
		Agency agency = service.getAgency(agency_id);
		Manager manager = service.getManager(agency_id);
		originalLat = agency.getAgency_latitude();
		originalLng = agency.getAgency_longitude();
		
		model.addAttribute("agency", agency);
		model.addAttribute("manager", manager);
		return "member/updateMemberForm";
	}
	
	@PostMapping("/updateSuccess")
	public String updateMember(Agency agency, Manager manager, HttpSession session) {
		
		double newLat = agency.getAgency_latitude();
		double newLng = agency.getAgency_longitude();
		boolean newLatLng = false;	// 회원 수정에서 위도, 경도가 바뀌었는지 
		
		if(originalLat != newLat || originalLng != newLng) {
			newLatLng = true;
		}
		
		manager.setManager_agency_id(agency.getAgency_id());
		service.updateMember(agency, manager, newLatLng);
		String nowId = (String)session.getAttribute("agency_Id");
		
		return "redirect:/request";
		
	}
}
