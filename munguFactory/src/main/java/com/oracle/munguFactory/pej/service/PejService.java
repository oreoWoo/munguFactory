package com.oracle.munguFactory.pej.service;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;

public interface PejService {

	List<FactoryDTO> factoryList2();

	int insertFactory(FactoryDTO factoryDTO);

	FactoryDTO factoryInfo(int factory_no);

	int factorySearch(String searchString);

	List<FactoryDTO> factorySearchList(String searchString);

	int totalFactory();

	List<FactoryDTO> factoryList(FactoryDTO factory);

	int updateFactory(FactoryDTO factory);

	FactoryDTO factoryInfoEdit(int factory_no);

	int deleteFactory(int factory_no);

}
