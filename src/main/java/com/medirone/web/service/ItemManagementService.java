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

	public void updateBlood(SupplyItems blood) {
		bloodDao.updateBlood(blood);
		
	}

	public boolean checkBloodName(String sup_name) {
		boolean result = bloodDao.selectBloodName(sup_name);
		return result;
	}

	public void addMedicine(SupplyItems medicine) {
		medDao.insertMedicine(medicine);
	}

	public void deleteMedicine(int deleteMedicineNo) {
		medDao.deleteMedicine(deleteMedicineNo);
	}

	public void updateMedicine(SupplyItems medicine) {
		medDao.updateMedicine(medicine);	
	}

	public boolean checkMedName(String sup_name) {
		int rows = medDao.selectMedicine(sup_name);
		if(rows == 0) {
			return true;
		}
		else {
			return false;
		}
	}

	public List<SupplyItems> searchMedicine(String sup_name) {
		List<SupplyItems> medicineList = medDao.selectSearchMedicineList(sup_name);
		return medicineList;
	}

	public SupplyItems getMedicineById(String sup_id) {
		SupplyItems medicine = medDao.selectMedicineById(sup_id);
		return medicine;
	}
}
