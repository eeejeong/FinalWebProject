package com.medirone.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Request;
import com.medirone.web.dto.RequestItems;
import com.medirone.web.dto.SupplyItems;
import com.medirone.web.service.OrderStatus;

@Component
public class RequestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNo(String agency_id) {
		int totalRowNum = 0;
		if(agency_id.equals("admin")) {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRowNumAdmin", agency_id);
		} else {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRowNum", agency_id);
		}
		return totalRowNum;
	}

	public int selectTotalRowNoGcs() {
		int totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRowNumGcs");
		return totalRowNum;
	}
	
	public List<SupplyItems> selectMedrequestList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<SupplyItems> medrequestList = sqlSessionTemplate.selectList("medrequestList.selectMedrequestList", map);
		return medrequestList;
	}
	
	public List<RequestItems> selectMedrequest_popuplist1(int order_id) {
		List<RequestItems> medrequest_popuplist1 = sqlSessionTemplate.selectList("request.selectMedrequest_popuplist1", order_id);
		return medrequest_popuplist1;
	}

	public int insertRequest(Request request) {		
		int rows = sqlSessionTemplate.insert("request.insertRequest", request);
		return rows;		
	}

	public int insertRequestItems(RequestItems requestItem) {
		int rows = sqlSessionTemplate.insert("request.insertRequestItem", requestItem);
		return rows;
	}

	public List<RequestItems> selectRequestList(int startRowNo, int endRowNo, String agency_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		map.put("agency_id", agency_id);
		List<RequestItems> requestList = sqlSessionTemplate.selectList("request.selectRequestList", map);
		return requestList;
	}

	public List<RequestItems> selectAdminRequestList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<RequestItems> requestList = sqlSessionTemplate.selectList("request.selectAdminRequestList", map);
		return requestList;
	}

	public List<Request> selectGcsRequestList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<Request> requestList = sqlSessionTemplate.selectList("request.selectGcsRequestList", map);
		return requestList;
	}
	

	public List<RequestItems> selectRequestItemsByOrderId(int order_id) {
		List<RequestItems> requestItems = sqlSessionTemplate.selectList("request.selectRequestItemsByOrderId", order_id);
		return requestItems;
	}

	public int deleteRequestByOrderId(int order_id) {
		int rows = sqlSessionTemplate.delete("request.deleteRequestItemsByOrderId", order_id);
		sqlSessionTemplate.delete("request.deleteRequestByOrderId", order_id);
		return rows;
	}	
	
	public int updateOrderStatus(int order_id, OrderStatus status) {
		Map<String, Object> map = new HashMap<>();
		map.put("order_id", order_id);
		map.put("order_status", status);
		int rows = sqlSessionTemplate.update("request.updateOrderStatus", map);
		return rows;
	}

	public int updateStatusToDeliverSuccess(int order_id) {
		int rows = sqlSessionTemplate.update("request.updateStatusToDeliverSuccess", order_id);
		return rows;
	}

	public int updateDeliveredDate(int order_id) {
		int rows = sqlSessionTemplate.update("request.updateDeliveredDate", order_id);
		return rows;
	}
	
	/////////////////////////한별작업///////////////////////////////////
	public List<RequestItems> selectAdminRequestListByOrderStatus(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<RequestItems> requestList = sqlSessionTemplate.selectList("request.selectAdminRequestListByOrderStatus", map);
		return requestList;
	}


	//=====배송 요청 필터링 작업======
	public List<RequestItems> selectAdminRequestedList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<RequestItems> requestedList = sqlSessionTemplate.selectList("request.selectAdminRequestedList", map);
		return requestedList;
	}

	//=====배송 요청 필터링 작업======
	public int selectTotalRequestedRowNo(String agency_id) {
		int totalRowNum = 0;
		if(agency_id.equals("admin")) {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRequestedRowNumAdmin", agency_id);
		} else {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRequestedRowNum", agency_id);
		}
		return totalRowNum;
	}

	//=====배송 요청 필터링 작업======
	public List<RequestItems> selectRequestedList(int startRowNo, int endRowNo, String agency_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		map.put("agency_id", agency_id);
		List<RequestItems> requestedList = sqlSessionTemplate.selectList("request.selectRequestedList", map);
		return requestedList;
	}


	
	public List<RequestItems> selectRequestItemsByOrderStatus(int startRowNo, int endRowNo, String agency_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		map.put("agency_id", agency_id);
		List<RequestItems> requestList = sqlSessionTemplate.selectList("request.selectRequestItemsByOrderStatus", map);
		return requestList;
	}
	
	public int selectTotalDeliveringRowNo(String agency_id) {
		int totalRowNum = 0;
		if(agency_id.equals("admin")) {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalDeliveringRowNumAdmin", agency_id);
		} else {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalDeliveringRowNum", agency_id);
		}
		return totalRowNum;
	}
	/////////////////////////한별작업 끝///////////////////////////////////

	public int selectTotalRowNoListDelivered(String agency_id) {
		int totalRowNum = 0;
		if(agency_id.equals("admin")) {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRowNumAdminListDelivered", agency_id);
		} else {
			totalRowNum = sqlSessionTemplate.selectOne("request.selectTotalRowNumListDelivered", agency_id);
		}
		return totalRowNum;
	}

	public List<RequestItems> selectAdminRequestListDelivered(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<RequestItems> requestList = sqlSessionTemplate.selectList("request.selectAdminRequestListDelivered", map);
		return requestList;
	}

	public List<RequestItems> selectRequestListDelivered(int startRowNo, int endRowNo, String agency_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		map.put("agency_id", agency_id);
		List<RequestItems> requestList = sqlSessionTemplate.selectList("request.selectRequestListDelivered", map);
		return requestList;
	}

}
