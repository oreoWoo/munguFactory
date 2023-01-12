package com.oracle.munguFactory.kws.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.AuthorityDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AuthDaoImpl implements AuthDao {
	private final SqlSession session;
	
	@Override
	public List<AuthorityDTO> getAuthInfo() {
		List<AuthorityDTO> authlist = new ArrayList<AuthorityDTO>();
		System.out.println("AuthDaoImpl getAuthInfo Start");

		try {
			authlist = session.selectList("getAuthInfo");
			System.out.println("authlist의 사이즈: "+authlist.size());
		} catch (Exception e)
		{
			System.out.println("AuthDaoImpl getAuthInfo Error:"+e.getMessage());
		}
		
		return authlist;
	}

}
