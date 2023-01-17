package com.oracle.munguFactory.jjh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.dto.OrdersListDTO;
import com.oracle.munguFactory.dto.OrdersPaging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class JjhSujuDaoImpl implements JjhSujuDao {
	private final SqlSession session;

	@Override
	public OrdersDTO sujuDetail(int suju_no) {
		log.info("sujuDetail start...");
		List<OrdersDetailDTO> ordersDetailDTOs = null;
		OrdersDTO ordersDTO = null;
		try {
			ordersDTO = session.selectOne("sujuInfo", suju_no);
			ordersDetailDTOs = session.selectList("sujuDetail", suju_no);
			ordersDTO.setOrdersDetailDTOs(ordersDetailDTOs);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return ordersDTO;
	}

	@Override
	public int sujuDelete(int suju_no) {
		log.info("sujuDelete start...");
		int result = 0;
		try {
			result = session.delete("sujuDelete", suju_no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}

	@Override
	public OrdersListDTO sujuList(OrdersPaging ordersPaging) {
		log.info("sujuDetail start...");
		List<OrdersDTO> ordersDTOs = null;
		
		int totCnt = 0;
		try {
			totCnt = session.selectOne("sujuTotCnt", ordersPaging);
			System.out.println("totCnt?->" + totCnt);
			ordersPaging.setInfo(totCnt);
			//ordersPaging.setCurrentPage(ordersPaging.getCurrentPage()-1);
			ordersDTOs = session.selectList("sujuList", ordersPaging);
			//ordersPaging.setCurrentPage(ordersPaging.getCurrentPage()+1);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		OrdersListDTO ordersListDTO = new OrdersListDTO(ordersPaging, ordersDTOs);
		
		System.out.println("ordersListDTO?->" + ordersListDTO);
		return ordersListDTO;
	}

	@Override
	public int sujuModify(OrdersDTO ordersDTO) {
		log.info("sujuDelete start...");
		int result = 0;
		try {
			result = session.delete("sujuModifyDelete", ordersDTO);
			result = session.update("sujuModifyOrders", ordersDTO);
			result = session.insert("sujuModifyDetails", ordersDTO);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}
}
