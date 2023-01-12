package com.oracle.munguFactory.kws.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.PositDTO;
import com.oracle.munguFactory.kws.dao.PositDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PositService {
	
	private final PositDao pd;
	
	public List<PositDTO> getPosInfo() {
		System.out.println("PosService getPosInfo Start");
		List<PositDTO> poslist = new ArrayList<PositDTO>();
		
		try{
			poslist = pd.getPosInfo();
			System.out.println("PosService의 poslist의 size"+poslist.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return poslist;
	}

}
