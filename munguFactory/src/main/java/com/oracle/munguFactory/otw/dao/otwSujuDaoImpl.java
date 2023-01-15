package com.oracle.munguFactory.otw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.OrdersDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class otwSujuDaoImpl implements otwSujuDao {
	
	private final SqlSession session;
	
	
		@Override
		public int sujuSave(OrdersDTO ordersDTO) {
			int result = 0;
			try {
				result = session.insert("sujuInsert", ordersDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
			return result;
		}

}
