package com.oracle.munguFactory.jhy.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

}
