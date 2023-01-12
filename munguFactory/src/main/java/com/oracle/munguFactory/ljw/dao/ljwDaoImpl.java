package com.oracle.munguFactory.ljw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ljwDaoImpl implements ljwDao {
	private final SqlSession session;

	@Override
	public List<SubulDTO> getSubulList(PageDTO paging) {
		log.info("getSubulList() start...");
		List<SubulDTO> result = null;
		try {
			result = session.selectList("getSubulList",paging);
		} catch (Exception e) {
			System.out.println("getSubulList e.getMessage() : "+e.getMessage());
		}
		return result;
	}
	@Override
	public int getSubulListSize(PageDTO searchOptions) {
		log.info("getSubulListSize() start...");
		int result = 0;
		try {
			result = session.selectOne("getSubulListSize",searchOptions);
		} catch (Exception e) {
			System.out.println("getAllSubulList e.getMessage() : "+e.getMessage());
		}
		return result;
	}
	@Override
	public List<FactoryDTO> getFactoryList() {
		log.info("getFactoryList() start...");
		List<FactoryDTO> result = null;
		try {
			result = session.selectList("getFactoryList");
		} catch (Exception e) {
			log.info("getFactoryList() e.getMessage... : "+e.getMessage());
		}
		return result;
	}

	@Override
	public List<AccountsDTO> getAccountList() {
		List<AccountsDTO> result = null;
		try {
			result = session.selectList("ljwGetAccountList");
		} catch (Exception e) {
			log.info("getAccountList() e.getMessage... : "+e.getMessage());
		}
		return result;
	}

}
