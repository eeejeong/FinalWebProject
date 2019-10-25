package com.medirone.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.AgencyDao;
import com.medirone.web.dto.Agency;
@Service
public class AgencyService {
	@Autowired
	private AgencyDao aDao;
	
	
	public LoginResult login(String Agency_id, String Agency_password) {
		Agency agency = aDao.selectiAgency(Agency_id);
		if(agency==null) {
			
			return LoginResult.FAIL_MID;
		}else {
			if(Agency_password.equals(agency.getAgency_password())) {
				return LoginResult.SUCCESS;
			}else {
				
				return LoginResult.FAIL_MPASSWORD;
			}
			
		}
		
	}

}
