package com.medirone.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Medicine;

@Component
public class MedicineDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("medicine.selectTotalRowNum");
		return totalRowNum;
	}

	public List<Medicine> selectMedicineList(int startRowNo, int endRowNo) {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<Medicine> medicineList = sqlSessionTemplate.selectList("medicine.selectMedicineList", map);
		return medicineList;
	}

}
