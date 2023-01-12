package com.oracle.munguFactory.pej.dao;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;

public interface PejDao {

	List<FactoryDTO> factoryList(FactoryDTO factory);

	List<FactoryDTO> factoryList2();

	int insertFactory(FactoryDTO factoryDTO);

	FactoryDTO factoryInfo(int factory_no);

	int factorySearch(String searchString);

	List<FactoryDTO> factorySearchList(String searchString);

	int totalFactory();

	int updateFactory(FactoryDTO factory);

	FactoryDTO factoryInfoEdit(int factory_no);

	int deleteFactory(int factory_no);

	

}
