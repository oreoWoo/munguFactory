package com.oracle.munguFactory.otw.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.OrdersDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class otwSujuDaoImpl implements otwSujuDao {
	
	private final SqlSession session;
	
	
		@Override
		public int sujuSave(OrdersDTO ordersDTO) {
			int result = 0;
			try {
				log.info("otwSujuDaoImpl sujuSave start...");
				result = session.insert("sujuInsert", ordersDTO);
				log.info("ordersDTO -> " + ordersDTO);
				result = session.insert("sujudetailInsert", ordersDTO);
				result = 2;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return result;
		}

}
