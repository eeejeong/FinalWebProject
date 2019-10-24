package com.medirone.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Agency;

@Component
public class AgencyDao {
	@Autowired
	private SqlSessionTemplate sqlSessiontemplate;

	public Agency selectiAgency(String Agency_id) {
		Agency agency = sqlSessiontemplate.selectOne("agency.selectAgencyByMid",Agency_id);
		return agency;
	}

}
