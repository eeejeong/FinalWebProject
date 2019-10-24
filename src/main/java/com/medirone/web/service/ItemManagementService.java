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
	
	public int getTotalRowNo() {
		int totalRowNum = medDao.selectTotalRowNo();
		return totalRowNum;
	}

	public List<SupplyItems> getMedicineList(int startRowNo, int endRowNo) {
		List<SupplyItems> medicineList = medDao.selectMedicineList(startRowNo, endRowNo);
		return medicineList;
	}
}
