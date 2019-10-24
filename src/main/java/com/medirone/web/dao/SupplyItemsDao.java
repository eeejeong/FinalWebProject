package com.medirone.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.SupplyItems;


@Component
public class SupplyItemsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("supplyItems.selectTotalRowNum");
		return totalRowNum;
	}

	public List<SupplyItems> selectMedicineList(int startRowNo, int endRowNo) {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<SupplyItems> medicineList = sqlSessionTemplate.selectList("supplyItems.selectMedicineList", map);
		return medicineList;
	}

}
