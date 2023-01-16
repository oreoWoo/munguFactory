package com.oracle.munguFactory.otw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.oracle.munguFactory.dto.AccountsDTO;

@Mapper
public interface otwSujuMapper {
	
	List<AccountsDTO> Sql_selectByRow(int fromRow, int writePages);

}
