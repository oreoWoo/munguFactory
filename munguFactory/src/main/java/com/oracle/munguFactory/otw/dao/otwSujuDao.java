package com.oracle.munguFactory.otw.dao;

import java.util.List;

import com.oracle.munguFactory.dto.AccountsDTO;

public interface otwSujuDao {
	
	public List<AccountsDTO> selectByRow(int fromRow, int wirtePages);

}
