package com.oracle.munguFactory.lwh.dao;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.StockTakingDTO;

public interface StockTakingDAO {

	//공장목록 가져가기
	List<FactoryDTO> selectFactoryList();
	
	//상품목록 가져가기
	List<ItemDTO> selectItemList(StockTakingDTO stockTakingDTO);
	
	//재고실사 검색 목록 가져가기
	List<StockTakingDTO> selectStockTakingList(StockTakingDTO stockTakingDTO);

	List<StockTakingDTO> selectSubulList();

	List<StockTakingDTO> selectItemInfo(StockTakingDTO stockTakingDTO);

	int insertStockTaking(StockTakingDTO stockTakingDTO);

	int updateStockCnt(StockTakingDTO stockTakingDTO);

	int totalStockTakingCnt();

	int insertTempSilsa(StockTakingDTO stockTakingDTO);

	int updateTempSilsaGubun(StockTakingDTO stockTakingDTO);
}
