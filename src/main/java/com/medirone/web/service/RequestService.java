package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.RequestDao;
import com.medirone.web.dto.Request;
import com.medirone.web.dto.RequestItems;
import com.medirone.web.dto.SupplyItems;

@Service
public class RequestService {

	@Autowired
	private RequestDao requestDao;

	public int getTotalRowNo(String agency_id) {
		int totalRowNum = requestDao.selectTotalRowNo(agency_id);
		return totalRowNum;
	}

	public List<SupplyItems> getmedrequestList(int startRowNo, int endRowNo) {
		List<SupplyItems> medrequestList = requestDao.selectMedrequestList(startRowNo, endRowNo);
		return medrequestList;
	}
	
	public List<RequestItems> getMedrequest_popuplist1(int order_id) {
		List<RequestItems> medrequest_popuplist1 = requestDao.selectMedrequest_popuplist1(order_id);
		return medrequest_popuplist1;
	}

	public void addRequest(Request request) {
		requestDao.insertRequest(request);
		
	}

	public void addRequestItems(RequestItems requestItem) {
		requestDao.insertRequestItems(requestItem);
	}

	public List<RequestItems> getRequestList(int startRowNo, int endRowNo, String agency_id) {
		List<RequestItems> requestList = requestDao.selectRequestList(startRowNo, endRowNo, agency_id);
		return requestList;

	}

	public List<RequestItems> getAdminRequestList(int startRowNo, int endRowNo) {
		List<RequestItems> requestList = requestDao.selectAdminRequestList(startRowNo, endRowNo);
		return requestList;
	}

	public void changeStatus(int order_id) {
		requestDao.updateStatus(order_id);
		
	}

	public List<RequestItems> getRequestItemsByOrderId(int order_id) {
		List<RequestItems> requestItems = requestDao.selectRequestItemsByOrderId(order_id);
		return requestItems;
	}

	public void deleteRequestByOrderId(int order_id) {
		requestDao.deleteRequestByOrderId(order_id);
	}


}
