package com.oracle.munguFactory.kdj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class ProdDaoImpl implements ProdDao {
	
	private final SqlSession session;

	/* 생산지시조회 전체카운트 */
	@Override
	public int totalProdCnt() {
		int totalProdCnt = 0;
		System.out.println("ProdDaoImpl totalProdCnt start~!");
		try {
			totalProdCnt = session.selectOne("totalProdCnt");
			System.out.println("ProdDaoImpl totalProdCnt -> "+ totalProdCnt);
		} catch (Exception e) {
			System.out.println("ProdDaoImpl totalProdCnt "+ e.getMessage());
		}
		return totalProdCnt;
	}
	
	/* 생산지시목록 */

}
