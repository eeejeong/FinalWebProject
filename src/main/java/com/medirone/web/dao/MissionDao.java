package com.medirone.web.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


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

	public int updateRtlMission(String aID, String RtlwayPoint) {
		Map<String, String> map = new HashMap<>();
		map.put("aID", aID);
		map.put("RtlwayPoint", RtlwayPoint);
		int rows = sqlSessionTemplate.update("agency.updateRtlMission", map);
		return rows;
	}

}
