package com.oracle.munguFactory.jjh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.OrdersDetailDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class JjhSujuDaoImpl implements JjhSujuDao {
	private final SqlSession session;

	@Override
	public List<OrdersDetailDTO> sujuDetail(int suju_no) {
		List<OrdersDetailDTO> ordersDetailDTOs = null;
		try {
			ordersDetailDTOs = session.selectList("sujuDetail", suju_no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return ordersDetailDTOs;
	}
}
