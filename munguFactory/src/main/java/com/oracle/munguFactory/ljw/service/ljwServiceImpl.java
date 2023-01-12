package com.oracle.munguFactory.ljw.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;
import com.oracle.munguFactory.ljw.dao.ljwDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ljwServiceImpl implements ljwService {
	private final ljwDao dao;

	@Override
	public List<SubulDTO> getSubulList(PageDTO paging) {
		return dao.getSubulList(paging);
	}
	@Override
	public int getSubulListSize(PageDTO searchOptions) {
		return dao.getSubulListSize(searchOptions);
	}
	@Override
	public List<FactoryDTO> getFactoryList() {
		return dao.getFactoryList();
	}
	@Override
	public List<AccountsDTO> getAccountList() {
		return dao.getAccountList();
	}
	@Override
	public List<OrdersDTO> getOrderList(int account_no) {
		return dao.getOrderList(account_no);
	}
	@Override
	public List<OrdersDetailDTO> getOrdersDetailList(int suju_no) {
		return dao.getOrdersDetailList(suju_no);
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertShipment(SubulDTO subul) throws Exception {
		return dao.insertShipment(subul);
	}
	@Override
	public OrdersDetailDTO getOrdersDetail(int suju_no, int item_no) {
		return dao.getOrdersDetail(suju_no,item_no);
	}

}
