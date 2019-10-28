package com.medirone.web.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medirone.web.dto.Agency;
import com.medirone.web.dto.Manager;
import com.medirone.web.service.AgencyService;

@Controller
@RequestMapping("/join")
public class AgencyController {

	@Autowired
	private AgencyService service;
	
	@GetMapping("/")
	public String joinForm() {
		return "join/joinForm";
	}
	
	@RequestMapping("/joinSuccess")
	public String join(
			@RequestParam String agency_id, 
			@RequestParam String agency_password, 
			@RequestParam String agency_name, 
			@RequestParam String agency_tel, 
			@RequestParam String agency_address, 
			@RequestParam double agency_latitude,
			@RequestParam double agency_longitude,
			@RequestParam String manager_id,
			@RequestParam String manager_name,
			@RequestParam String manager_tel,
			@RequestParam String manager_email) {
		Agency agency = new Agency();
		Manager manager = new Manager();
		
		agency.setAgency_id(agency_id);
		agency.setAgency_password(agency_password);
		agency.setAgency_name(agency_name);
		agency.setAgency_tel(agency_tel);
		agency.setAgency_address(agency_address);
		agency.setAgency_latitude(agency_latitude);
		agency.setAgency_longitude(agency_longitude);
		
		manager.setManager_id(manager_id);
		manager.setManager_name(manager_name);
		manager.setManager_email(manager_email);
		manager.setManager_tel(manager_tel);
		manager.setManager_agency_id(agency_id);
		
		service.join(agency, manager);
		return "redirect:/";
	}
	
	/*
	 * @RequestMapping("/home") public String home() { return "home"; }
	 */
	
	@RequestMapping("/checkAgencyId")
	public void checkMid(String agency_id, HttpServletResponse response) throws Exception{
		boolean result = service.checkAgencyId(agency_id);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		pw.print(jsonObject.toString());
		pw.flush();
		pw.close();
	}
}
