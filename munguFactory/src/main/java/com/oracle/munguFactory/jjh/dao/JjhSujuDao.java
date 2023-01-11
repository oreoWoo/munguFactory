package com.oracle.munguFactory.jjh.dao;

import java.util.List;

import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;

public interface JjhSujuDao {

	OrdersDTO sujuDetail(int suju_no);

	int sujuDelete(int suju_no);

}
