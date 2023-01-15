package com.oracle.munguFactory.jhy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.ItemDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ItemUserDaoImpl implements ItemUserDao {
	private final SqlSession session;

	//ItemUserList
	@Override
	public List<ItemDTO> itemUserList() {
		List<ItemDTO> itemUserList = session.selectList("jhy_itemUserList");
		return itemUserList;
	}

	//ItemUserSelect
	@Override
	public int itemUserSelect(ItemDTO itemDto) {
		int itemUserSelect = session.selectOne("jhy_itemUserSelect", itemDto);
		return itemUserSelect;
	}

}
