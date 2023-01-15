package com.oracle.munguFactory.jhy.dao;

import java.util.List;

import com.oracle.munguFactory.dto.ItemDTO;

public interface ItemUserDao {

	//ItemUserList
	List<ItemDTO> itemUserList();

	//ItemUserSelect
	int itemUserSelect(ItemDTO itemDto);

}
