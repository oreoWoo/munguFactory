package com.oracle.munguFactory.otw.service;

import java.util.List;

import com.oracle.munguFactory.dto.AccountsDTO;

public interface otwSujuService {
	
	public List<AccountsDTO> selectByRow(int fromRow, int wirtePages);

}
