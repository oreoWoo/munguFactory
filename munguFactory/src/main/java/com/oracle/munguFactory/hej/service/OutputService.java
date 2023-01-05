package com.oracle.munguFactory.hej.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.OutputDTO;

@Service
public interface OutputService {

	int totalOutput();

	List<OutputDTO> listOutput(OutputDTO output);	// 생산실적 목록

	int insertOutput(OutputDTO output);				// 생산실적 등록
	int deleteOutput(OutputDTO prod_no);			// 생산실적 삭제

}
