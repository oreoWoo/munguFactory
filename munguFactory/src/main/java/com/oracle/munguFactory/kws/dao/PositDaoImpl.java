package com.oracle.munguFactory.kws.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.PositDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PositDaoImpl implements PositDao 
{
	private final SqlSession session;

	@Override
	public List<PositDTO> getPosInfo() 
	{
		List<PositDTO> poslist = new ArrayList<PositDTO>();
		System.out.println("PosDaoImpl getPosInfo Start");
	
		try {
			poslist = session.selectList("getPositInfo");
			System.out.println("poslist의 사이즈: "+poslist.size());
		} catch (Exception e)
		{
			System.out.println("PosDaoImpl getPosInfo Error:"+e.getMessage());
		}
		
		return poslist;
	}

}
