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

	public int updateStatusToPreparing(int order_id) {
		int rows = sqlSessionTemplate.update("request.updateStatusToPreparing", order_id);
		return rows;
	}
	
	public int updateStatusToDelivering(int order_id) {
		int rows = sqlSessionTemplate.update("request.updateStatusToDelivering", order_id);
		return rows;
	}

	public int updateStatusToDelivered(int order_id) {
		int rows = sqlSessionTemplate.update("request.updateStatusToDelivered", order_id);
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


}
