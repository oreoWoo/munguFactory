package com.oracle.munguFactory.otw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.otw.dao.otwSujuDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class otwSujuServiceImpl implements otwSujuService {
	
	private final otwSujuDao twd;
	

	@Override
	public int sujuSave(OrdersDTO ordersDTO) {
	log.info("otwSujuServiceImpl sujuSave start");
	int result = twd.sujuSave(ordersDTO);
		return result;
	}

}
