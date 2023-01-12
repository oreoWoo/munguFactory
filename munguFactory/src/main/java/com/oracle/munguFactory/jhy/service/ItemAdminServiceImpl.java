package com.oracle.munguFactory.jhy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.dao.ItemAdminDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemAdminServiceImpl implements ItemAdminService {
	private final ItemAdminDao itemDao;

	//ItemAdminList
	@Override
	public List<ItemDTO> itemAdminList() {
		List<ItemDTO> itemAdminList = itemDao.itemAdminList();
		return itemAdminList;
	}

	//ItemAdminSelect
	@Override
	public List<ItemDTO> itemAdminSelect(ItemDTO itemDto) {
		List<ItemDTO> itemAdminSelect = itemDao.itemAdminSelect(itemDto);
		return itemAdminSelect;
	}

	//ItemAdminInsert
	@Override
	public List<FactoryDTO> getFactoryList() {
		List<FactoryDTO> getFactoryList = itemDao.getFactoryList();
		return getFactoryList;
	}
	@Override
	public int itemAdminInsert(ItemDTO itemDto) {
		int itemAdminInsert = itemDao.itemAdminInsert(itemDto);
		return itemAdminInsert;
	}

	//ItemAdminUpdate
	@Override
	public List<ItemDTO> itemAdminUpSelect(ItemDTO itemDto) {
		List<ItemDTO> itemAdminUpSelect = itemDao.itemAdminUpSelect(itemDto);
		return itemAdminUpSelect;
	}
	@Override
	public int itemAdminUpdate(ItemDTO itemDto) {
		int itemAdminUpdate = itemDao.itemAdminUpdate(itemDto);
		return itemAdminUpdate;
	}



}
