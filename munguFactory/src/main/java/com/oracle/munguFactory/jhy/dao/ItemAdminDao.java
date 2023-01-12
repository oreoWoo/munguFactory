package com.oracle.munguFactory.jhy.dao;

import java.util.List;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;

public interface ItemAdminDao {

	//ItemAdminList
	List<ItemDTO> itemAdminList();

	//ItemAdminSelect
	List<ItemDTO> itemAdminSelect(ItemDTO itemDTO);

	//ItemAdminInsert
	List<FactoryDTO> getFactoryList();
	int itemAdminInsert(ItemDTO itemDto);

	//ItemAdminUpdate
	List<ItemDTO> itemAdminUpSelect(ItemDTO itemDto);
	int itemAdminUpdate(ItemDTO itemDto);



}
