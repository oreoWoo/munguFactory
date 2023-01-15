package com.oracle.munguFactory.jhy.service;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;

public interface ItemAdminService {

	//ItemAdminList
	List<ItemDTO> itemAdminList();

	//ItemAdminSelect
	List<ItemDTO> itemAdminSelect(ItemDTO itemDto);

	//ItemAdminInsert
	List<FactoryDTO> getFactoryList();
	int itemAdminInsert(ItemDTO itemDto);

	//ItemAdminUpdate
	List<ItemDTO> itemAdminUpSelect(ItemDTO itemDto);
	int itemAdminUpdate(ItemDTO itemDto);

	//ItemAdminDelete
	int itemAdminDelete(ItemDTO itemDto);

	//Paging
	int totalCount();



}
