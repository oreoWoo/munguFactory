package com.oracle.munguFactory.hej.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.hej.dao.OutputDAO;
import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.OutputDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class OutputServiceImpl implements OutputService {

	private final OutputDAO od;
	
	@Override
	public int totalOutput() {
		System.out.println("-- OutputServiceImpl Start total --");
		
		int totOutputCnt = od.totalOutput();	// DAO 가져오기
		System.out.println("- OutputServiceImpl totalOutput totOutputCnt -> " + totOutputCnt);
		
		return totOutputCnt;
	}

	
	// 생산실적 목록
	@Override
	public List<OutputDTO> outputList(OutputDTO output) {
		System.out.println("~~ OutputServiceImpl outputList Start ~~");
		List<OutputDTO> outputList = null;
		outputList = od.outputList(output);
		
		return outputList;
	}

	// 생산실적 등록
	@Override
	public int insertOutput(OutputDTO output) {
		System.out.println("~~ OutputServiceImpl insert Start ~~");
		
		int result = 0;
		result = od.insertOutput(output);
		
		return result;
	}

	// 생산실적 삭제
	@Override
	public int deleteOutput(OutputDTO prod_no) {
		System.out.println("~~ OutputServiceImpl delete Start ~~");
		
		int result = 0;
		result = od.deleteOutput(prod_no);
		
		return result;
	}

	// 생산실적 상세 정보
	@Override
	public OutputDTO outputDetail(int prod_no) {
		System.out.println("~~ OutputServiceImpl detail Start ~~");

		OutputDTO output = new OutputDTO();
		output = od.outputDetail(prod_no);
		
		return output;
	}
	
	
	// select option 용
	// 공장 목록
	@Override
	public List<FactoryDTO> factorySelect() {
		return od.getFactoryList();
	}

	// 사원 목록
	@Override
	public List<EmpDTO> empSelect() {
		return od.getEmpList();
	}


	// 생산실적 수정
	@Override
	public int updateOutput(OutputDTO output) {
		log.info("~~ EmpServiceImpl update ~~");
		
		int updateCnt = 0;
		updateCnt = od.updateOutput(output);
		return updateCnt;
	}


	
	

}
