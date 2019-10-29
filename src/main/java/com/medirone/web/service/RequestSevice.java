package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.RequestDao;
import com.medirone.web.dto.SupplyItems;

@Service
public class RequestSevice {

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


}
