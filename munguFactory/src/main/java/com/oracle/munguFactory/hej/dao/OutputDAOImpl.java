package com.oracle.munguFactory.hej.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.OutputDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OutputDAOImpl implements OutputDAO {

	/* MyBatis DB 연동 */
	private final SqlSession session;

	@Override
	public int totalOutput() {
		int totOutputCnt = 0;
		System.out.println("OutputDAOImpl Start Total");
		
		try {
			totOutputCnt = session.selectOne("outputTotal");
			System.out.println("OutputDAOImpl totalOutput totOutputCnt -> " + totOutputCnt);
			
		} catch (Exception e) {
			System.out.println("OutputDAOImpl totalEmp Exception" + e.getMessage());
		}
		return totOutputCnt;
	}

	// 생산실적 목록
	@Override
	public List<OutputDTO> listOutput(OutputDTO output) {
		System.out.println("- OutputDAOImpl listOutput Start -");
		
		List<OutputDTO> outputList = null;
		
		try {
			outputList = session.selectList("outputListAll", output);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl listOutput Exception -> " + e.getMessage());
		}
		
		return outputList;
	}

	// 생산실적 등록
	@Override
	public int insertOutput(OutputDTO output) {
		System.out.println("- OutputDAOImpl insert Start -");
		
		int result = 0;
		
		try {
			result = session.insert("insertOutput", output);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl insert Exception -> " + e.getMessage());
		}
		
		return result;
	}

	// 생산실적 삭제
	@Override
	public int deleteOutput(OutputDTO prod_no) {
		System.out.println("- OutputDAOImpl delete Start -");
		
		int result = 0;
		
		try {
			result = session.delete("deleteOutput", prod_no);
		} catch (Exception e) {
			System.out.println("OutputDAOImpl delete Exception" + e.getMessage());
		}
		
		return result;
	}
	
	
	
	
	// 생산실적 상세 정보
	// 생산실적 수정
	
}
