package com.oracle.munguFactory.kws.dao;

import java.util.List;

import com.oracle.munguFactory.dto.AuthorityDTO;


public interface AuthDao {

	List<AuthorityDTO> getAuthInfo();

}
