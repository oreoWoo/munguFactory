package com.oracle.munguFactory.kws.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.DeptDTO;
import com.oracle.munguFactory.kws.dao.DeptDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptService {
	
	private final DeptDao dd;
	
	public List<DeptDTO> getDeptInfo() {
		System.out.println("DeptService getDeptInfo Start");
		List<DeptDTO> deptlist = new ArrayList<DeptDTO>();
		
		try{
			deptlist = dd.getDeptInfo();
			System.out.println("DeptService의 deptlist의 size"+deptlist.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return deptlist;
	}

}
