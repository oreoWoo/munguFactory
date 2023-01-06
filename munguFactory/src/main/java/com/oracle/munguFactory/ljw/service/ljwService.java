package com.oracle.munguFactory.ljw.service;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;

public interface ljwService {

	List<SubulDTO> getSubulList(PageDTO paging);

	int getSubulListSize();

	List<FactoryDTO> getFactoryList();

}
