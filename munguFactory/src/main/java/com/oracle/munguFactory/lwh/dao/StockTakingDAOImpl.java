package com.oracle.munguFactory.lwh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.StockTakingDTO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class StockTakingDAOImpl implements StockTakingDAO {

	private final SqlSession session;
	
	@Override
	public List<FactoryDTO> selectFactoryList() {
		return session.selectList("stockTaking.selectFactoryList");
	}

	@Override
	public List<ItemDTO> selectItemList() {
		return session.selectList("stockTaking.selectItemList");
	}

	@Override
	public List<StockTakingDTO> selectStockTakingList(StockTakingDTO stockTakingDTO) {
		return session.selectList("stockTaking.selectStockTakingList", stockTakingDTO);
	}

}
