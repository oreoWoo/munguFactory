package com.oracle.munguFactory.lwh.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.StockTakingDTO;
import com.oracle.munguFactory.lwh.dao.StockTakingDAO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StockTakingServiceImpl implements StockTakingService {

	private final StockTakingDAO st;
	
	@Override
	public List<FactoryDTO> selectFactoryList() {
		return st.selectFactoryList();
	}

	@Override
	public List<ItemDTO> selectItemList() {
		return st.selectItemList();
	}

	@Override
	public List<StockTakingDTO> selectStockTakingList(StockTakingDTO stockTakingDTO) {
		return st.selectStockTakingList(stockTakingDTO);
	}

}
