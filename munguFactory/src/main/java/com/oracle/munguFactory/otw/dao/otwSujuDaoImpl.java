package com.oracle.munguFactory.otw.dao;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.AccountsDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class otwSujuDaoImpl implements otwSujuDao {
	
	private final otwSujuMapper twm;
	
	
	
		@Override
		public List<AccountsDTO> selectByRow(@Param("fromRow") int fromRow, @Param("wirtePages") int writePages) {
			List<AccountsDTO> SujuAccountList = twm.Sql_selectByRow(fromRow, writePages);
			return SujuAccountList;
		}

}
