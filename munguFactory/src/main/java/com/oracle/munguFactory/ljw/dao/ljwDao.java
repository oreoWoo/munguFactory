package com.oracle.munguFactory.ljw.dao;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;

public interface ljwDao {

	List<SubulDTO> getSubulList(PageDTO paging);

	int getSubulListSize(PageDTO searchOptions);

	List<FactoryDTO> getFactoryList();
	
}
