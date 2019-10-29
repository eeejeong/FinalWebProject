package com.medirone.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medirone.web.dto.Agency;
import com.medirone.web.service.ManagementService;

@Controller
@RequestMapping("/management")
public class managementController {
	private static final Logger logger = LoggerFactory.getLogger(managementController.class);

	@Autowired
	private ManagementService service;
	
	@RequestMapping("/")
	public String management() {
		return "redirect:/management/managementList";
	}

	@RequestMapping("/managementList")
	public String medicineList(Model model, @RequestParam(defaultValue = "1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);

		// 페이지당 행 수
		int rowsPerPage = 10;
		// 이전, 다음을 클릭했을 때 나오는 페이지 수
		int pagesPerGroup = 5;
		// 전체 게시물 수
		int totalRowNum = service.getTotalRowNo();
		// 전체 페이지 수
		int totalPageNum = totalRowNum / rowsPerPage;
		if (totalRowNum % rowsPerPage != 0)
			totalPageNum++;
		// 전제 그룹 수
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if (totalPageNum % pagesPerGroup != 0)
			totalGroupNum++;

		// 해당 페이지의 시작 행 번호
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;
		// 해당 페이지의 끝 행 번호
		int endRowNo = pageNo * rowsPerPage;
		if (pageNo == totalPageNum)
			endRowNo = totalRowNum;

		// 현재 페이지의 그룹번호
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;
		// 현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		// 현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if (groupNo == totalGroupNum)
			endPageNo = totalPageNum;
		// 현재 페이지의 게시물 가져오기
		List<Agency> managementList = service.getManagementList(startRowNo, endRowNo);
		
		// JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("managementList", managementList);
		
		
		return "/management/managementList";
	}
	
	@RequestMapping("/deleteManagement")
	public String deleteManagement(String agency_id, HttpSession session) {		
		service.deleteManagement(agency_id);
		int pageNo = (Integer)session.getAttribute("pageNo");
		return "redirect:/management/managementList?pageNo=" + pageNo;
	}	
	
	@RequestMapping("/updateManagement")
	public String updateBoard(String agency_id, HttpSession session) {
		service.updateBoard(agency_id);
		int pageNo = (Integer)session.getAttribute("pageNo");
		return "redirect:/management/managementList?pageNo=" + pageNo;
	}
	
	@GetMapping("/showMap")
	public String showMap(double lat, double lng, Model model) {
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);	
		return "/management/showMap";
	}
}
