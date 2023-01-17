package com.oracle.munguFactory.jhy.dao;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.service.Paging;

public interface ItemAdminDao {

	//ItemAdminList
	List<ItemDTO> itemAdminList(Paging page);

	//ItemAdminSelect
	List<ItemDTO> itemAdminSelect(ItemDTO itemDTO);

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
