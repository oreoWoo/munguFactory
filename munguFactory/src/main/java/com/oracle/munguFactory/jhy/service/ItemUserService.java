package com.oracle.munguFactory.jhy.service;

import java.util.List;

import com.oracle.munguFactory.dto.ItemDTO;

public interface ItemUserService {

	//ItemUserList
	List<ItemDTO> itemUserList();

	//ItemUserSelect
	int itemUserSelect(ItemDTO itemDto);

}
