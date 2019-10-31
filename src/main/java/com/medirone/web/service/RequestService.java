package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.RequestDao;
import com.medirone.web.dto.RequestItems;
import com.medirone.web.dto.SupplyItems;

@Service
public class RequestService {

	@Autowired
	private RequestDao requestDao;

	public int getTotalRowNo() {
		int totalRowNum = requestDao.selectTotalRowNo();
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


}
