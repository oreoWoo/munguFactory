package com.oracle.munguFactory.jjh.service;

import java.util.List;

import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;

public interface JjhSujuService {

	OrdersDTO sujuDetail(int suju_no);

	int sujuDelete(int suju_no);

}
