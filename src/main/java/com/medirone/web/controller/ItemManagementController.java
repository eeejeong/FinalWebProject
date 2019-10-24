package com.medirone.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medirone.web.dto.SupplyItems;
import com.medirone.web.service.ItemManagementService;

@Controller
@RequestMapping("/itemManagement")
public class ItemManagementController {
	private static final Logger logger = LoggerFactory.getLogger(ItemManagementController.class);

	@Autowired
	private ItemManagementService service;

	@RequestMapping("/")
	public String itemManagement() {
		return "redirect:/itemManagement/medicineList";
	}

	@RequestMapping("/medicineList")
	public String medicineList() {
		return "itemManagement/medicineList";
	}

	@RequestMapping("/bloodList")
	public String bloodList(Model model) {
		// 한 페이지 표시 행 - 혈액 개수는 총 8개
		int rowsPerPage = 8;
		// 현재 페이지 번호
		int pageNo = 1;

		// 전체 게시물 수
		int totalRowNum = service.getTotalRowNo();

		// 현재 페이지의 시작 행 번호
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;
		// 현재 페이지의 끝 행 번호
		int endRowNo = pageNo * rowsPerPage;
		
		
		// 현재 페이지의 게시물 가져오기
		List<SupplyItems> bloodList = service.getBloodList(startRowNo, endRowNo);
		
		// JSP로 데이터 전달
		model.addAttribute("totalRowNum", totalRowNum);

		
		return "/itemManagement/bloodList";
	}
}
