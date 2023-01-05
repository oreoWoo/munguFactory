package com.oracle.munguFactory.hej.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.hej.dao.OutputDAO;
import com.oracle.munguFactory.dto.OutputDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OutputServiceImpl implements OutputService {

	private final OutputDAO od;
	
	@Override
	public int totalOutput() {
		System.out.println("-- EjOutputServiceImpl Start total --");
		
		int totOutputCnt = od.totalOutput();	// DAO 가져오기
		System.out.println("- EjOutputServiceImpl totalOutput totOutputCnt -> " + totOutputCnt);
		
		return totOutputCnt;
	}

	
	// 생산실적 목록
	@Override
	public List<OutputDTO> listOutput(OutputDTO output) {
		System.out.println("~~ EjOutputServiceImpl listOutput Start ~~");
		
		List<OutputDTO> outputList = od.listOutput(output);		// DAO 가져오기
		
		return outputList;
	}

	// 생산실적 등록
	@Override
	public int insertOutput(OutputDTO output) {
		System.out.println("~~ EjOutputServiceImpl insert Start ~~");
		
		int result = 0;
		result = od.insertOutput(output);
		
		return result;
	}

	// 생산실적 삭제
	@Override
	public int deleteOutput(OutputDTO prod_no) {
		System.out.println("~~ EjOutputServiceImpl delete Start ~~");
		
		int result = 0;
		result = od.deleteOutput(prod_no);
		
		return result;
	}
	
	

}
