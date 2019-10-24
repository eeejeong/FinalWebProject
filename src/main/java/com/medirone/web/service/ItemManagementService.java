package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.BloodDao;
import com.medirone.web.dto.Blood;

@Service
public class ItemManagementService {

	@Autowired
	private BloodDao bloodDao;
	
	public int getTotalRowNo() {
		int totalRowNo = bloodDao.selectTotalNum();
		return totalRowNo;
	}

	public List<Blood> getBoardList(int startRowNo, int endRowNo) {
		List<Blood> bloodList = bloodDao.selectBloodList(startRowNo, endRowNo);
		return bloodList;
	}

}
