package com.medirone.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Blood;

@Component
public class BloodDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalNum() {
		int totalRowNum = sqlSessionTemplate.selectOne("blood.selectTotalNum");
		return totalRowNum;
	}

	public List<Blood> selectBloodList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		
		List<Blood> bloodList = sqlSessionTemplate.selectList("selectBloodList", map);
		return bloodList;
	}

}
