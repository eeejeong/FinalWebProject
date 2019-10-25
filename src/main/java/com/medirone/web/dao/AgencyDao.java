package com.medirone.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medirone.web.dto.Agency;

import com.medirone.web.dto.Manager;

@Component
public class AgencyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insert(Agency agency, Manager manager) {
		int rows = sqlSessionTemplate.insert("agency.insert", agency);
		sqlSessionTemplate.insert("manager.insert", manager);
		return rows;	
	}

	public Agency selectMember(String agency_id) {
		Agency agency = sqlSessionTemplate.selectOne("agency.selectAgencyByAgencyid", agency_id);
		return agency;
	}
	
	public Agency selectAgency(String agency_id) {
		Agency agency = sqlSessionTemplate.selectOne("agency.selectAgencyByAgencyid",agency_id);
		return agency;
	}

	
	


}
