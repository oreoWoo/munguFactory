package com.oracle.munguFactory.ljw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.SubulDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ljwDaoImpl implements ljwDao {
	private final SqlSession session;

	@Override
	public List<SubulDTO> getAllSubulList() {
		log.info("getAllSubulList() start...");
		List<SubulDTO> result = null;
		try {
			result = session.selectList("getAllSubulList");
			System.out.println(result.size());
		} catch (Exception e) {
			System.out.println("getAllSubulList"+e.getMessage());
		}
		return result;
	}

}
