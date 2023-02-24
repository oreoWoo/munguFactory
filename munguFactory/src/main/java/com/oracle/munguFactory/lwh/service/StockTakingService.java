package com.oracle.munguFactory.lwh.service;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.StockTakingDTO;

public interface StockTakingService {

	//공장목록 가져가기
	List<FactoryDTO> selectFactoryList();
	
	//상품목록 가져가기
	List<ItemDTO> selectItemList(StockTakingDTO stockTakingDTO);
	
	//재고실사 검색 목록 가져가기
	List<StockTakingDTO> selectStockTakingList(StockTakingDTO stockTakingDTO);

	List<StockTakingDTO> selectSubulList();

	StockTakingDTO selectItemInfo(StockTakingDTO stockTakingDTO);

	int insertStockTaking(StockTakingDTO stockTakingDTO);

	int totalStockTakingCnt(StockTakingDTO stockTakingDTO);

	int insertTempSilsa(StockTakingDTO stockTakingDTO);

	int updateTempSilsaGubun(StockTakingDTO stockTakingDTO);

	int deleteTempSilsa(StockTakingDTO stockTakingDTO);

	int updateTempSilsa(StockTakingDTO stockTakingDTO);

	List<StockTakingDTO> selectItemStockCnt();
}
