package com.medirone.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.AgencyDao;
import com.medirone.web.dto.Agency;
import com.medirone.web.dto.Manager;

@Service
public class AgencyService {
	private static final Logger logger = LoggerFactory.getLogger(AgencyService.class);
	@Autowired
	private AgencyDao agencyDao;
	
	public void join(Agency agency, Manager manager) {
		agencyDao.insert(agency, manager);		
	}

	public boolean checkAgencyId(String agency_id) {
		Agency agency = agencyDao.selectMember(agency_id);
		if(agency == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public LoginResult login(String agency_id, String agency_password) {
		Agency agency = agencyDao.selectAgency(agency_id);
	
		if(agency==null) {
			return LoginResult.FAIL_MID;
		}else {
			if(agency_password.equals(agency.getAgency_password())) {
				if(agency.getAgency_status().equals("Y")) {
					return LoginResult.SUCCESS;
				} else {
					return LoginResult.FAIL_MREJECTED;
				}
			}else {
				return LoginResult.FAIL_MPASSWORD;
			}
		}
	}
	
	public Agency getAgency(String agency_id) {
		Agency agency = agencyDao.selectAll(agency_id);
		return agency;
	}

	public Manager getManager(String agency_id) {
		Manager manager = agencyDao.selectManager(agency_id);
		return manager;
	}
	
	public void updateMember(Agency agency, Manager manager, boolean newLatLng) {
		agencyDao.updateMember(agency, manager, newLatLng);
	}
}
