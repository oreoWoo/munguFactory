package com.oracle.munguFactory.ljw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ljwDaoImpl implements ljwDao {
	private final SqlSession session;

	@Override
	public List<SubulDTO> getSubulList(PageDTO paging) {
		log.info("getSubulList() start...");
		List<SubulDTO> result = null;
		try {
			result = session.selectList("getSubulList",paging);
		} catch (Exception e) {
			System.out.println("getSubulList e.getMessage() : "+e.getMessage());
		}
		return result;
	}
	@Override
	public int getSubulListSize(PageDTO searchOptions) {
		log.info("getSubulListSize() start...");
		int result = 0;
		try {
			result = session.selectOne("getSubulListSize",searchOptions);
		} catch (Exception e) {
			System.out.println("getAllSubulList e.getMessage() : "+e.getMessage());
		}
		return result;
	}
	@Override
	public List<FactoryDTO> getFactoryList() {
		log.info("getFactoryList() start...");
		List<FactoryDTO> result = null;
		try {
			result = session.selectList("getFactoryList");
		} catch (Exception e) {
			log.info("getFactoryList() e.getMessage... : "+e.getMessage());
		}
		return result;
	}
	@Override
	public List<AccountsDTO> getAccountList() {
		List<AccountsDTO> result = null;
		try {
			result = session.selectList("ljwGetAccountList");
		} catch (Exception e) {
			log.info("getAccountList() e.getMessage... : "+e.getMessage());
		}
		return result;
	}
	@Override
	public List<OrdersDTO> getOrderList(int account_no) {
		List<OrdersDTO> result = null;
		try {
			result = session.selectList("ljwGetOrderList",account_no);
		} catch (Exception e) {
			log.info("getOrderList() e.getMessage... : "+e.getMessage());
		}
		return result;
	}
	@Override
	public List<OrdersDetailDTO> getOrdersDetailList(int suju_no) {
		List<OrdersDetailDTO> result = null;
		try {
			result = session.selectList("ljwGetOrdersDetailList",suju_no);
		} catch (Exception e) {
			log.info("getOrdersDetailList() e.getMessage... : "+e.getMessage());
		}
		return result;
	}
	@Override
	public int insertShipment(SubulDTO subul) throws Exception{
		int result = 0;
		if((int) session.selectOne("getStoragesAmount",subul)<subul.getAmount()) {
			throw new Exception();
		}
		session.insert("insertShipment",subul);
		session.update("insertShipmentStroage",subul);
		result = session.update("baljuUpdate",subul);
		return result;
	}
	@Override
	public OrdersDetailDTO getOrdersDetail(int suju_no, int item_no) {
		OrdersDetailDTO result = null;
		OrdersDetailDTO param = new OrdersDetailDTO();
		param.setItem_no(item_no);
		param.setSuju_no(suju_no);
		try {
			result = session.selectOne("getOrdersDetail",param);
		} catch (Exception e) {
			log.info("insertShipment() e.getMessage... : "+e.getMessage());
		}
		return result;
	}

}
