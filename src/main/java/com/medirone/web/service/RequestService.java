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
	
	public int getTotalRowNoGcs() {
		int totalRowNum = requestDao.selectTotalRowNoGcs();
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
	
	public List<Request> getGcsRequestList(int startRowNo, int endRowNo) {
		List<Request> requestList = requestDao.selectGcsRequestList(startRowNo, endRowNo);
		return requestList;
	}

	
	public List<RequestItems> getRequestItemsByOrderId(int order_id) {
		List<RequestItems> requestItems = requestDao.selectRequestItemsByOrderId(order_id);
		return requestItems;
	}
	
	//////////////////////한별작업///////////////////////////
	//병원 요청페이지에서 배송중을 눌렀을 때
	public List<RequestItems> getAdminRequestListByOrderStatus(int startRowNo, int endRowNo) {
		List<RequestItems> requestList = requestDao.selectAdminRequestListByOrderStatus(startRowNo, endRowNo);
		return requestList;
	}
	
	//보건소 요청페이지에서 배송중을 눌렀을 때
	public List<RequestItems> getRequestItemsByOrderStatus(int startRowNo, int endRowNo, String agency_id) {
		List<RequestItems> requestItems = requestDao.selectRequestItemsByOrderStatus(startRowNo, endRowNo, agency_id);
		return requestItems;
	}
	
	public int getTotalDeliveringRowNum(String agency_id) {
		int totalRowNum = requestDao.selectTotalDeliveringRowNo(agency_id);
		return totalRowNum;
	}
	//////////////////////한별작업 끝///////////////////////////

	public void deleteRequestByOrderId(int order_id) {
		requestDao.deleteRequestByOrderId(order_id);
	}
	
	
	public void changeOrderStatus(int order_id, OrderStatus status) {
		requestDao.updateOrderStatus(order_id, status);
		
	}

	public void changeStatusToDeliverSuccess(int order_id) {
		requestDao.updateStatusToDeliverSuccess(order_id);
		
	}

	public int getTotalRowNoListDelivered(String agency_id) {
		int totalRowNum = requestDao.selectTotalRowNoListDelivered(agency_id);
		return totalRowNum;
	}

	public List<RequestItems> getAdminRequestListDelivered(int startRowNo, int endRowNo) {
		List<RequestItems> requestList = requestDao.selectAdminRequestListDelivered(startRowNo, endRowNo);
		return requestList;
	}
	
	public List<RequestItems> getRequestListDelivered(int startRowNo, int endRowNo, String agency_id) {
		List<RequestItems> requestList = requestDao.selectRequestListDelivered(startRowNo, endRowNo, agency_id);
		return requestList;
	}

}
