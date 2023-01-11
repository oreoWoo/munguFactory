package com.oracle.munguFactory.pej.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.FactoryDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PejDaoImpl implements PejDao {
	
	private final SqlSession session;
	
	@Override
	public List<FactoryDTO> factoryList(FactoryDTO factory) {
		System.out.println("PejDaoImpl factoryList Start");
		List<FactoryDTO> factoryList = null;
		try {
			factoryList = session.selectList("factoryList1", factory);
			System.out.println("PejDaoImpl factoryList size()-> "+factoryList.size());
		} catch (Exception e) {
			System.out.println("PejDaoImpl factoryList Exception -> "+e.getMessage());
		}
		return factoryList;
	}

	@Override
	public List<FactoryDTO> factoryList2() {
		System.out.println("PejDaoImpl factoryList2 Start");
		List<FactoryDTO> factoryList2 = null;
		try {
			factoryList2 = session.selectList("factoryList2");
			System.out.println("PejDaoImpl factoryList2.size()-> "+factoryList2.size());
		} catch (Exception e) {
			System.out.println("PejDaoImpl factoryList2 Exception -> "+e.getMessage());
		}
		
		return factoryList2;
	}

	@Override
	public int insertFactory(FactoryDTO factoryDTO) {
		System.out.println("PejDaoImpl insertFactory Start");
		int result = 0;
		try {
			result = session.insert("insertFactory", factoryDTO);
		} catch (Exception e) {
			System.out.println("PejDaoImpl insertFactory Exception -> "+e.getMessage());
		}
		return result;
	}

	@Override
	public FactoryDTO factoryInfo(int factory_no) {
		System.out.println("PejDaoImpl factoryInfo Start");
		FactoryDTO factoryDTO = new FactoryDTO();
		try {
			factoryDTO = session.selectOne("factoryInfo", factory_no);
		} catch (Exception e) {
			System.out.println("PejDaoImpl factoryInfo Exception -> "+e.getMessage());
		}
		return factoryDTO;
	}
	
	@Override
	public FactoryDTO factoryInfoEdit(int factory_no) {
		System.out.println("PejDaoImpl factoryInfo Start");
		FactoryDTO factoryDTO = new FactoryDTO();
		try {
			factoryDTO = session.selectOne("factoryInfoEdit", factory_no);
		} catch (Exception e) {
			System.out.println("PejDaoImpl factoryInfo Exception -> "+e.getMessage());
		}
		return factoryDTO;
	}
	
	@Override
	public int deleteFactory(int factory_no) {
		System.out.println("PejDaoImpl deleteFactory Start");
		int result = 0;
		try {
			result = session.delete("deleteFactory", factory_no);
		} catch (Exception e) {
			System.out.println("PejDaoImpl deleteFactory Exception -> "+e.getMessage());
		}
		return result;
	}

	@Override
	public int factorySearch(String searchString) {
		System.out.println("PejDaoImpl factorySearch Start");
		int factorySearchTotal = 0;
		try {
			factorySearchTotal = session.selectOne("factorySearchTotal", searchString);
		} catch (Exception e) {
			System.out.println("PejDaoImpl factorySearch Exception -> "+e.getMessage());
		}
		return factorySearchTotal;
	}

	@Override
	public List<FactoryDTO> factorySearchList(String searchString) {
		System.out.println("PejDaoImpl factorySearchList Start");
		List<FactoryDTO> factory = null;
		try {
			factory = session.selectList("factorySearchList", searchString);
		} catch (Exception e) {
			System.out.println("PejDaoImpl factorySearchList Exception -> "+e.getMessage());
		}
		return factory;
	}

	@Override
	public int totalFactory() {
		System.out.println("PejDaoImpl totalFactory Start");
		int totalFactory = 0;
		try {
			totalFactory = session.selectOne("totalFactory");
			System.out.println("PejDaoImpl totalFactory totalFactory-> "+totalFactory);
		} catch (Exception e) {
			System.out.println("PejDaoImpl totalFactory Exception -> "+e.getMessage());
		}
		return totalFactory;
	}

	@Override
	public int updateFactory(FactoryDTO factory) {
		System.out.println("PejDaoImpl updateFactory Start");
		int updateFactoryCount = 0;
		try {
			updateFactoryCount = session.update("updateFactory", factory);
		} catch (Exception e) {
			System.out.println("PejDaoImpl updateFactory Exception -> "+e.getMessage());
		}
		return updateFactoryCount;
	}







}
