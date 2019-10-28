package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.MangementDao;
import com.medirone.web.dto.Agency;

@Service
public class ManagementService {

	@Autowired
	private MangementDao managementDao;
	
	
	public List<Agency> getManagementList(int startRowNo, int endRowNo) {
		List<Agency> managementList = managementDao.selectManagementList(startRowNo, endRowNo);
		return managementList;
	}

	public int getTotalRowNo() {
		int totalRowNum = managementDao.selectTotalRowNo();
		return totalRowNum;
	}

	public void deleteManagement(String agency_id) {
		managementDao.deleteManagement(agency_id);
		
	}

	public void updateBoard(String agency_id) {
		managementDao.updateManagement(agency_id);
		
	}

}
