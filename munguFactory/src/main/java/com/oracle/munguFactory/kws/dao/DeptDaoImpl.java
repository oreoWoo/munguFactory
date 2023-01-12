package com.oracle.munguFactory.kws.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.DeptDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DeptDaoImpl implements DeptDao {

	private final SqlSession session;

	@Override
	public List<DeptDTO> getDeptInfo() {
		List<DeptDTO> deptlist = new ArrayList<DeptDTO>();
		System.out.println("DeptDaoImpl GetDeptInfo Start");
		
		try {
			deptlist = session.selectList("getDeptInfo");
			System.out.println("deptlist의 사이즈: "+deptlist.size());
		} catch (Exception e)
		{
			System.out.println("DeptDaoImpl GetDeptInfo Error:"+e.getMessage());
		}
		
		return deptlist;
	}

}
