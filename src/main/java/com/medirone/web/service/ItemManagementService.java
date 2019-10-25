package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.SupplyItemsDao;
import com.medirone.web.dto.SupplyItems;

@Service
public class ItemManagementService {

	@Autowired
	private SupplyItemsDao bloodDao;
	
	public int getTotalBloodRowNum() {
		int totalRowNo = bloodDao.selectTotalBloodNum();
		return totalRowNo;
	}

	public List<SupplyItems> getBloodList(int startRowNo, int endRowNo) {
		List<SupplyItems> bloodList = bloodDao.selectBloodList(startRowNo, endRowNo);
		return bloodList;
	}

}
