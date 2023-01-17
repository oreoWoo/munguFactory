package com.oracle.munguFactory.kdj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.ProdDTO;

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
			//totalProdCnt = session.selectOne("totalProdCnt");
			Integer objTotalProdCnt = session.selectOne("totalProdCnt");
			totalProdCnt = objTotalProdCnt.intValue();
			System.out.println("ProdDaoImpl totalProdCnt -> "+ totalProdCnt);
		} catch (Exception e) {
			System.out.println("ProdDaoImpl totalProdCnt "+ e.getMessage());
		}
		return totalProdCnt;
	}
	/* 생산지시목록 */
	@Override
	public List<ProdDTO> listProd(ProdDTO prodDto) {
		List<ProdDTO> prodList = null;
		try {
			prodList = session.selectList("prodList", prodDto);
		} catch (Exception e) {
			System.out.println("ProdDaoImpl prodList "+ e.getMessage());
		}
		return prodList;
	}
	@Override
	public ProdDTO ContentModProd(int suju_no, int item_no) {
		System.out.println("ProdDaoImpl ContentModProd start~!");
		ProdDTO prod  = new ProdDTO();
		ProdDTO prod1 = new ProdDTO();   // Parameter 용도
		prod1.setSuju_no(suju_no);
		prod1.setItem_no(item_no);
		try {
			System.out.println("ProdDaoImpl  ContentModProd prod1.getSujuNo()->"+prod1.getSuju_no());
			System.out.println("ProdDaoImpl  ContentModProd prod1.getItemNo()->"+prod1.getItem_no());
		
			  prod = session.selectOne("ModContent", prod1);
			  System.out.println("ProdDaoImpl prod.getSujuNo()-> "+ prod.getSuju_no());
			 
			/* prod = session.selectOne("ModContent", sujuNo); */
		} catch (Exception e) {
			System.out.println("ProdDaoImpl prodList "+ e.getMessage());
		}
		return prod;
	}
	@Override
	public int modContent(ProdDTO prodDto) {
		int prod = 0;
		try {
			prod = session.update("updateContent", prodDto);
			System.out.println("prodDto"+ prodDto);
		} catch (Exception e) {
			System.out.println("modContent"+ e.getMessage());
		}
		return prod;
	}
	@Override
	public ProdDTO delete(ProdDTO prodDto) {
		int prod = 0;
		try {
			prod = session.delete("delete", prodDto);
		} catch (Exception e) {
			System.out.println("delete"+ e.getMessage());
		}
		return null;
	}

}
