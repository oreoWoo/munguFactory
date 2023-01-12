package com.oracle.munguFactory.ljw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;
import com.oracle.munguFactory.ljw.dao.ljwDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ljwServiceImpl implements ljwService {
	private final ljwDao dao;

	@Override
	public List<SubulDTO> getSubulList(PageDTO paging) {
		return dao.getSubulList(paging);
	}

	@Override
	public int getSubulListSize(PageDTO searchOptions) {
		return dao.getSubulListSize(searchOptions);
	}

	@Override
	public List<FactoryDTO> getFactoryList() {
		return dao.getFactoryList();
	}

	@Override
	public List<AccountsDTO> getAccountList() {
		return dao.getAccountList();
	}

}
