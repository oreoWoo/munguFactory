package com.oracle.munguFactory.hej.dao;

import java.util.List;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.dto.OutputDTO;
import com.oracle.munguFactory.dto.PageDTO;

public interface OutputDAO {

	int totalOutput();

	List<OutputDTO> outputList(OutputDTO output);		// 생산실적 목록
	OutputDTO outputDetail(int prod_no);				// 생산실적 상세 정보

	int insertOutput(OutputDTO output);					// 생산실적 등록
	int updateOutput(OutputDTO output);					// 생산실적 수정
	int deleteOutput(OutputDTO prod_no);				// 생산실적 삭제
	List<OutputDTO> outputSearchList(OutputDTO output);	// 생산실적 관련 조회

	// select option용
	List<FactoryDTO> getFactoryList();		// 공장 목록
	List<EmpDTO> 	 getEmpList();			// 사원 목록

	int getOutputListSize(PageDTO searchOptions);

	List<OutputDTO> getOutputList(PageDTO paging);

	int insertOutputSubul(OutputDTO output);

	int plusOutputStorage(OutputDTO output);

	int updateOutputSubul(OutputDTO output);

	int updateStorageOutput(OutputDTO output);


}
