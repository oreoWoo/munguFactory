package com.oracle.munguFactory.kdj.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.ProdDTO;
import com.oracle.munguFactory.kdj.dao.ProdDao;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ProdServiceImpl implements ProdService {
	
	private final ProdDao pd;
	
	@Override
	public int totalProdCnt() {
		System.out.println("ProdServiceImpl totalProdCnt start~! ");
		
		int totalProdCnt = pd.totalProdCnt();
		
		return totalProdCnt;
	}

	@Override
	public List<ProdDTO> listProd(ProdDTO prodDto) {
		List<ProdDTO> prodList = null;
		prodList = pd.listProd(prodDto);
		return prodList;
	}

	@Override
	public ProdDTO ContentModProd(int sujuNo) {
		System.out.println("ProdServiceImpl ContentProd start~! ");
		ProdDTO prodDto = null;
		prodDto = pd.ContentModProd(sujuNo);
		return prodDto;
	}

	

	}



