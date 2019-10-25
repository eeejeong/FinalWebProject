
package com.medirone.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<SupplyItems> medicineList = service.getMedicineList(startRowNo, endRowNo);

		// JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("medicineList", medicineList);
		return "/itemManagement/medicineList";
	}

	@RequestMapping("/bloodList")
	public String bloodList(Model model) {
		// 한 페이지 표시 행 - 혈액 개수는 총 8개
		int rowsPerPage = 8;
		// 현재 페이지 번호
		int pageNo = 1;


		// 전체 게시물 수
		int totalBloodRowNum = service.getTotalBloodRowNum();

		// 현재 페이지의 시작 행 번호
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;
		// 해당 페이지의 끝 행 번호
		int endRowNo = pageNo * rowsPerPage;

		// 현재 페이지의 게시물 가져오기

		List<SupplyItems> bloodList = service.getBloodList(startRowNo, endRowNo);

		// JSP로 페이지 정보 넘기기
		model.addAttribute("totalBloodRowNum", totalBloodRowNum);
		model.addAttribute("bloodList", bloodList);

		return "/itemManagement/bloodList";
	}

	@RequestMapping("/addMedicine")
	public String addMedicine() {

		return "/itemManagement/addMedicine";
	}

	@RequestMapping("/deleteMedicine")
	public String deleteMedicine() {

		return "redirect:/itemManagement/medicineList";
	}

	@RequestMapping("/addBloodForm")
	public String addBloodForm() {
		return "itemManagement/addBloodForm";
	}
	
	@RequestMapping("/addBlood")
	public String addBlood(SupplyItems blood) {
		service.addBlood(blood);
		return "redirect:/itemManagement/bloodList";
	}
	
	@RequestMapping("/deleteBlood")
	public String deleteBlood(String[] deleteBlood) {	
		for(int i = 0; i < deleteBlood.length; i++) {
			int deleteBloodNo = Integer.parseInt(deleteBlood[i]);
			service.deleteBlood(deleteBloodNo);
		}	
		return "redirect:/itemManagement/bloodList";
	}
	

}

