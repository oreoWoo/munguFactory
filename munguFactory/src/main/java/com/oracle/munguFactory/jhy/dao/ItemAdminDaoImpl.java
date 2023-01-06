package com.oracle.munguFactory.jhy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.ItemDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ItemAdminDaoImpl implements ItemAdminDao {
	private final SqlSession session;

	//ItemAdminList
	@Override
	public List<ItemDTO> itemAdminList() {
		List<ItemDTO> itemAdminList = session.selectList("itemAdminList");
		return itemAdminList;
	}

}
