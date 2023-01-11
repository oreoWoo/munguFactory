package com.oracle.munguFactory.pej.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.pej.dao.PejDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PejServiceImpl implements PejService {
	
	private final PejDao pd;
	
	@Override
	public List<FactoryDTO> factoryList(FactoryDTO factory) {
		List<FactoryDTO> factoryList = null;
		System.out.println("PejServiceImpl factoryList Start");
		factoryList = pd.factoryList(factory);
		System.out.println("PejServiceImpl factoryList size()-> "+factoryList.size());
		return factoryList;
	}


	@Override
	public List<FactoryDTO> factoryList2() {
		System.out.println("PejServiceImpl factoryList2 Start");
		List<FactoryDTO> factoryList2 = null;
		factoryList2 = pd.factoryList2();
		System.out.println("PejServiceImpl factoryList.size()-> "+factoryList2.size());
		return factoryList2;
	}


	@Override
	public int insertFactory(FactoryDTO factoryDTO) {
		System.out.println("PejServiceImpl insertFactory Start");
		int result = 0;
		result = pd.insertFactory(factoryDTO);
		return result;
	}


	@Override
	public FactoryDTO factoryInfo(int factory_no) {
		System.out.println("PejServiceImpl factoryInfo Start");
		FactoryDTO factoryDTO = null;
		factoryDTO = pd.factoryInfo(factory_no);
		return factoryDTO;
	}
	
	@Override
	public FactoryDTO factoryInfoEdit(int factory_no) {
		System.out.println("PejServiceImpl factoryInfoEdit Start");
		FactoryDTO factoryDTO = null;
		factoryDTO = pd.factoryInfoEdit(factory_no);
		return factoryDTO;
	}

	@Override
	public int deleteFactory(int factory_no) {
		System.out.println("PejServiceImpl deleteFactory Start");
		int factoryDTO = pd.deleteFactory(factory_no);
		return factoryDTO;
	}

	@Override
	public int factorySearch(String searchString) {
		System.out.println("PejServiceImpl factorySearch Start");
		int factorySearchTotal = 0;
		factorySearchTotal = pd.factorySearch(searchString);
		System.out.println("PejServiceImpl factorySearchTotal-> "+factorySearchTotal);
		return factorySearchTotal;
	}


	@Override
	public List<FactoryDTO> factorySearchList(String searchString) {
		System.out.println("PejServiceImpl factorySearchList Start");
		List<FactoryDTO> factory = null;
		factory = pd.factorySearchList(searchString);
		return factory;
	}


	@Override
	public int totalFactory() {
		System.out.println("PejServiceImpl totalFactory Start");
		int totalFactory = pd.totalFactory();
		System.out.println("PejServiceImpl totalFactory totalFactory -> "+totalFactory);
		return totalFactory;
	}


	@Override
	public int updateFactory(FactoryDTO factory) {
		System.out.println("PejServiceImpl updateFactory Start");
		int updateFactoryCount = 0;
		updateFactoryCount = pd.updateFactory(factory);
		return updateFactoryCount;
	}










}
