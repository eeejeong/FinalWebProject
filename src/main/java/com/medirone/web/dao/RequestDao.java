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
public class RequestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("medrequestList.selectTotalRowNum");
		return totalRowNum;
	}

	public List<SupplyItems> selectMedrequestList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<SupplyItems> medrequestList = sqlSessionTemplate.selectList("medrequestList.selectMedrequestList", map);
		return medrequestList;
	}
	
	public List<RequestItems> selectMedrequest_popuplist1(int order_id) {
		List<RequestItems> medrequest_popuplist1 = sqlSessionTemplate.selectList("request.selectMedrequest_popuplist1", order_id);
		return medrequest_popuplist1;
	}

}
