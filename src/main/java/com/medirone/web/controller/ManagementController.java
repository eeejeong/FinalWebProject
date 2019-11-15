package com.medirone.web.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medirone.web.dto.Agency;
import com.medirone.web.service.AgencyService;
import com.medirone.web.service.ManagementService;

@Controller
@RequestMapping("/management")
public class ManagementController {
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private ManagementService service;
	
	@Autowired
	private AgencyService agencyService;
	
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
	
	// GCS 미션 DB 읽기 
	@RequestMapping("/gcsManagementList")
	public String gcsManagementList(Model model, @RequestParam(defaultValue = "1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);

		// 페이지당 행 수
		int rowsPerPage = 10;
		// 이전, 다음을 클릭했을 때 나오는 페이지 수
		int pagesPerGroup = 5;
		// 전체 게시물 수
		int totalRowNum = service.getGcsTotalRowNo();
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
		List<Agency> managementList = service.getGcsManagementList(startRowNo, endRowNo);
		
		// JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("managementList", managementList);
		
		return "management/gcsManagementList";
	}
	
		// GCS 회원 관리에서 보건소 가는 미션 불러오기 버튼을 눌렀을 때
		@RequestMapping("/showMissionClicked")
		public void showMissionClicked(String agency_id, HttpServletResponse response) throws Exception {
			Agency agency = agencyService.getAgency(agency_id);
			double agencyLat = agency.getAgency_latitude();
			double agencyLng = agency.getAgency_longitude();
			String mission_waypoint = agency.getMission_waypoint();
			
			if(mission_waypoint == null) {
				mission_waypoint = "";
			}
			
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("agencyLat", agencyLat);
			jsonObject.put("agencyLng", agencyLng);
			jsonObject.put("waypoint", mission_waypoint);
			pw.print(jsonObject.toString());
			pw.flush();
			pw.close();
		}
		
		// GCS 회원 관리에서 RTL 미션 불러오기 버튼을 눌렀을 때
		@RequestMapping("/showRtlMissionClicked")
		public void showRtlMissionClicked(String agency_id, HttpServletResponse response) throws Exception {
			Agency agency = agencyService.getAgency(agency_id);
			String missionRtlWaypoint = agency.getMission_rtl_waypoint();
			
			if(missionRtlWaypoint == null) {
				missionRtlWaypoint = "";
			}
			
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("waypoint", missionRtlWaypoint);
			pw.print(jsonObject.toString());
			pw.flush();
			pw.close();
		}
}
