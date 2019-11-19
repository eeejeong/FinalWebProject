package com.medirone.web.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Agency;


@Component
public class MissionDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int updateMission(String aID, String wayPoint) {
		Map<String, String> map = new HashMap<>();
		map.put("aID", aID);
		map.put("wayPoint", wayPoint);
		int rows = sqlSessionTemplate.update("agency.updateMission", map);
		return rows;
	}

	public Agency selectAgencyMission(String aID) {
		Agency agency = sqlSessionTemplate.selectOne("agency.selectAllByAgencyid", aID);
		return agency;
	}

}
