package com.medirone.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.SupplyItemsDao;
import com.medirone.web.dto.SupplyItems;

@Service
public class ItemManagementService {

	@Autowired
	private SupplyItemsDao medDao; 
	
	@Autowired
	private SupplyItemsDao bloodDao;

	// 백신 총 개수
	public int getTotalRowNo() {
		int totalRowNum = medDao.selectTotalRowNo();
		return totalRowNum;
	}
	
	// 혈액 총 개수
	public int getTotalBloodRowNum() {
		int totalRowNo = bloodDao.selectTotalBloodNum();
		return totalRowNo;
	}

	public List<SupplyItems> getMedicineList(int startRowNo, int endRowNo) {
		List<SupplyItems> medicineList = medDao.selectMedicineList(startRowNo, endRowNo);
		return medicineList;
	}
	
	// 혈액 목록 불러오기
	public List<SupplyItems> getBloodList(int startRowNo, int endRowNo) {
		List<SupplyItems> bloodList = bloodDao.selectBloodList(startRowNo, endRowNo);

		return bloodList;
	}

	// 혈액 추가
	public void addBlood(SupplyItems blood) {
		bloodDao.insertBlood(blood);
		
	}

	public void deleteBlood(int deleteBloodNo) {
		bloodDao.deleteBlood(deleteBloodNo);
	}

}
