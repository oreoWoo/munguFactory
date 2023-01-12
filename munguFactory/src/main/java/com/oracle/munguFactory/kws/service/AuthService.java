package com.oracle.munguFactory.kws.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.AuthorityDTO;
import com.oracle.munguFactory.kws.dao.AuthDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthService {
	private final AuthDao ad;
	
	public List<AuthorityDTO> getAuthInfo() {
		System.out.println("AuthService getDeptInfo Start");
		List<AuthorityDTO> authlist = new ArrayList<AuthorityDTO>();
		
		try{
			authlist = ad.getAuthInfo();
			System.out.println("AuthorityService의 authlist의 size"+authlist.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return authlist;
	}

}
