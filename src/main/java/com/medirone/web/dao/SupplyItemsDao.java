package com.medirone.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.RequestItems;
import com.medirone.web.dto.SupplyItems;

@Component
public class SupplyItemsDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 백신 총 개수
	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("supplyItems.selectTotalRowNum");
		return totalRowNum;
	}

	// 백신 리스트
	public List<SupplyItems> selectMedicineList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<SupplyItems> medicineList = sqlSessionTemplate.selectList("supplyItems.selectMedicineList", map);
		return medicineList;
	}

	// 혈액 총 개수
	public int selectTotalBloodNum() {
		int totalRowNum = sqlSessionTemplate.selectOne("supplyItems.selectBloodTotalNum");
		return totalRowNum;
	}

	// 혈액 목록 불러오기
	public List<SupplyItems> selectBloodList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);

		List<SupplyItems> bloodList = sqlSessionTemplate.selectList("supplyItems.selectBloodList", map);
		return bloodList;
	}

	public int insertBlood(SupplyItems blood) {
		int rows = sqlSessionTemplate.insert("supplyItems.insertBlood", blood);
		return rows;
	}

	public int deleteBlood(int deleteBloodNo) {
		int rows = sqlSessionTemplate.delete("supplyItems.deleteBlood", deleteBloodNo);
		return rows;
	}

	public int insertMedicine(SupplyItems medicine) {
		int rows = sqlSessionTemplate.insert("supplyItems.insertMedicine", medicine);
		return rows;
	}

	public int deleteMedicine(int deleteMedicineNo) {
		int rows = sqlSessionTemplate.delete("supplyItems.deleteMedicine", deleteMedicineNo);
		return rows;
	}

	public int updateMedicine(SupplyItems medicine) {
		int rows =  sqlSessionTemplate.update("supplyItems.updateMedicine", medicine);
		return rows;
	}

	public int selectMedicine(String sup_name) {
		int rows = sqlSessionTemplate.selectOne("supplyItems.selectMedicineByName", sup_name);
		return rows;
	}

	public void updateBlood(SupplyItems blood) {
		int rows = sqlSessionTemplate.update("supplyItems.updateBlood", blood);
	}

	public boolean selectBloodName(String sup_name) {
		int rows = sqlSessionTemplate.selectOne("supplyItems.selectBloodName", sup_name);
		if (rows == 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<SupplyItems> selectSearchMedicineList(String sup_name) {
		List<SupplyItems> medicineList = sqlSessionTemplate.selectList("supplyItems.selectSearchMedicineList", sup_name);
		return medicineList;
	}

	public SupplyItems selectItemById(String sup_id) {
		SupplyItems medicine = sqlSessionTemplate.selectOne("supplyItems.selectItemById", sup_id);
		return medicine;
	}

	public int updateRequest(SupplyItems supplyItems) {
		int rows = sqlSessionTemplate.update("supplyItems.updateRequest", supplyItems);
		return rows;	
	}

	public int updateCancelledItems(RequestItems item) {
		int rows = sqlSessionTemplate.update("supplyItems.updateCancelledItems", item);
		return rows;
	}
}
