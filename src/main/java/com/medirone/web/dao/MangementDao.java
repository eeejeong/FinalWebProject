package com.medirone.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Agency;

@Component
public class MangementDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Agency> selectManagementList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<Agency> managementList = sqlSessionTemplate.selectList("management.selectManagementList", map);
		return managementList;
	}
	
	public List<Agency> selectGcsManagementList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<Agency> managementList = sqlSessionTemplate.selectList("management.selectGcsManagementList", map);
		return managementList;
	}

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("management.selectTotalRowNum");
		return totalRowNum;
	}
	
	public int selectGcsTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("management.selectGcsTotalRowNum");
		return totalRowNum;
	}

	public int deleteManagement(String agency_id) {
		int rows = sqlSessionTemplate.delete("management.deleteManager", agency_id);
				sqlSessionTemplate.delete("management.deleteAgency", agency_id);
		return rows;
				
		
	}

	public  int updateManagement(String agency_id) {
		int rows = sqlSessionTemplate.update("management.updateManager", agency_id);
		return rows;
		
	}

}
