package com.oracle.munguFactory.kdj.service;

import java.util.List;

import com.oracle.munguFactory.dto.ProdDTO;

public interface ProdService {
	//paging
	int totalProdCnt();
	//ProdList 조회
	List<ProdDTO> listProd(ProdDTO prodDto);
	//수정 조회
	int ContentModProd(int sujuNo);


}
