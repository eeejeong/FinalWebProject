package com.medirone.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.AgencyDao;
import com.medirone.web.dto.Agency;
import com.medirone.web.dto.Manager;

@Service
public class AgencyService {
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
				return LoginResult.SUCCESS;
			}else {
				
				return LoginResult.FAIL_MPASSWORD;
			}
			
		}
		
	}

}
