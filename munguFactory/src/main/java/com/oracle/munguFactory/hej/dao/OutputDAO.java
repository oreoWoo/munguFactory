package com.oracle.munguFactory.hej.dao;

import java.util.List;

import com.oracle.munguFactory.dto.OutputDTO;

public interface OutputDAO {

	int totalOutput();

	List<OutputDTO> listOutput(OutputDTO output);	// 생산실적 조회(?)

	int insertOutput(OutputDTO output);	// 생산실적 등록
	int deleteOutput(OutputDTO prod_no);	// 생산실적 삭제


	// 생산실적 목록
	// 생산실적 상세 정보
	// 생산실적 수정

}
