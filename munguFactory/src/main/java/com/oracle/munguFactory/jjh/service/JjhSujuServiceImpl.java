package com.oracle.munguFactory.jjh.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.jjh.dao.JjhSujuDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class JjhSujuServiceImpl implements JjhSujuService {
	private final JjhSujuDao jjhSujuDao;

	@Override
	public List<OrdersDetailDTO> sujuDetail(int suju_no) {
		log.info("sujuDetail start...");
		List<OrdersDetailDTO> ordersDetailDTOs = jjhSujuDao.sujuDetail(suju_no);
		return ordersDetailDTOs;
	}
}
