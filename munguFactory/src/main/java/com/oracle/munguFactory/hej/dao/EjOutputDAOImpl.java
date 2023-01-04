package com.oracle.munguFactory.hej.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class EjOutputDAOImpl implements EjOutputDAO {

	/* MyBatis DB 연동 */
	private final SqlSession session;
	
	// 생산실적 목록
	// 생산실적 상세 정보
	// 생산실적 등록
	// 생산실적 수정
	// 생산실적 삭제
	
}
