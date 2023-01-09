package com.oracle.munguFactory.kdj.service;

import java.util.List;

import com.oracle.munguFactory.dto.ProdDTO;

public interface ProdService {

	int totalProdCnt();

	List<ProdDTO> listProd(ProdDTO prodDto);

}
