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
	public ProdDTO ContentModProd(int suju_no, int item_no) {
		System.out.println("ProdServiceImpl ContentProd start~! ");
		System.out.println("ProdServiceImpl  sujuNo->"+suju_no);
		System.out.println("ProdServiceImpl  itemNo->"+item_no);
		ProdDTO prodDto = new ProdDTO();
		prodDto = pd.ContentModProd(suju_no, item_no);
		return prodDto;
	}

	@Override
	public int modContent(ProdDTO prodDto) {
		System.out.println("ProdServiceImpl modContent start~! ");
		int prod = 0;
		prod = pd.modContent(prodDto);
		return prod;
	}

	@Override
	public ProdDTO delete(ProdDTO prodDto) {
		System.out.println("ProdServiceImpl delete start~! ");
		prodDto = pd.delete(prodDto);
		return prodDto;
	}

	

	}



