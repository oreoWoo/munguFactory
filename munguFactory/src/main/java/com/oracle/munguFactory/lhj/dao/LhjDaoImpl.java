package com.oracle.munguFactory.lhj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class LhjDaoImpl implements LhjDao {
	
	private final SqlSession session;

	


}
