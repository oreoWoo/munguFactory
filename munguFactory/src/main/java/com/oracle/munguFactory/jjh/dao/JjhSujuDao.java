package com.oracle.munguFactory.jjh.dao;

import java.util.List;

import com.oracle.munguFactory.dto.OrdersDetailDTO;

public interface JjhSujuDao {

	List<OrdersDetailDTO> sujuDetail(int suju_no);

}
