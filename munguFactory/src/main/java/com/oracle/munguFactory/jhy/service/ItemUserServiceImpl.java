package com.oracle.munguFactory.jhy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.dao.ItemUserDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemUserServiceImpl implements ItemUserService {
	private final ItemUserDao itemDao;

	//ItemUserList
	@Override
	public List<ItemDTO> itemUserList() {
		List<ItemDTO> itemUserList = itemDao.itemUserList();
		return itemUserList;
	}

	//ItemUserSelect
	@Override
	public int itemUserSelect(ItemDTO itemDto) {
		int itemUserSelect = itemDao.itemUserSelect(itemDto);
		return itemUserSelect;
	}

}
