package com.medirone.web.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medirone.web.dto.SupplyItems;
import com.medirone.web.service.ItemManagementService;
import com.medirone.web.service.RequestSevice;

@Controller
@RequestMapping("/request")
public class RequestController {

	@Autowired
	private ItemManagementService itemService;

	@RequestMapping("/")
	public String medrequest() {
		return "/request/medicineRequest";
	}

	@RequestMapping("/totalRequestList")
	public String totalRequestList() {
		return "/request/totalRequestList";
	}

	@RequestMapping("/medicineRequestList")
	public String medrequestList(Model model, @RequestParam(defaultValue = "1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);

		// 페이지당 행 수
		int rowsPerPage = 10;
		// 이전, 다음을 클릭했을 때 나오는 페이지 수
		int pagesPerGroup = 5;
		// 전체 게시물 수
		int totalRowNum = itemService.getTotalRowNo();
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
		List<SupplyItems> medrequestList = itemService.getMedicineList(startRowNo, endRowNo);

		// JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("medrequestList", medrequestList);

		return "/request/medicineRequestList";
	}

	@RequestMapping("/bloodRequestList")
	public String bloodRequestList(Model model) {
		// 한 페이지 표시 행 - 혈액 개수는 총 8개
		int rowsPerPage = 8;
		// 현재 페이지 번호
		int pageNo = 1;

		// 전체 게시물 수
		int totalBloodRowNum = itemService.getTotalBloodRowNum();

		// 현재 페이지의 시작 행 번호
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;
		// 해당 페이지의 끝 행 번호
		int endRowNo = pageNo * rowsPerPage;

		// 현재 페이지의 게시물 가져오기

		List<SupplyItems> bloodList = itemService.getBloodList(startRowNo, endRowNo);

		// JSP로 페이지 정보 넘기기
		model.addAttribute("totalBloodRowNum", totalBloodRowNum);
		model.addAttribute("bloodList", bloodList);
		return "/request/bloodRequestList";
	}
	
	@RequestMapping("/searchItemById")
	public void searchItemById(String sup_id, HttpServletResponse response) throws Exception {
		SupplyItems item = itemService.getItemById(sup_id);
		
		JSONObject jsonObject = new JSONObject();
		if(item.getSup_class() == 1) {
			jsonObject.put("sup_class", "백신");
		} else if(item.getSup_class() == 2) {
			jsonObject.put("sup_class", "혈액");
		}
		jsonObject.put("sup_name", item.getSup_name());
		jsonObject.put("sup_weight", item.getSup_weight());
		String json = jsonObject.toString();
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();		
	}
	
	@RequestMapping("/requestComplete")
	public String requestComplete(){
		return "redirect:/request/";
		
	}
	
}
