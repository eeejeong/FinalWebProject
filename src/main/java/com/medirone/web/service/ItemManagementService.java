package com.medirone.web.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.MedicineDao;
import com.medirone.web.dto.Medicine;

@Service
public class ItemManagementService {
	
	@Autowired
	private MedicineDao medDao; 
	
	public int getTotalRowNo() {
		int totalRowNum = medDao.selectTotalRowNo();
		return totalRowNum;
	}

	public List<Medicine> getMedicineList(int startRowNo, int endRowNo) {
		List<Medicine> medicineList = medDao.selectMedicineList(startRowNo, endRowNo);
		return medicineList;
	}
}
