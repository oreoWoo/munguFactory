package com.oracle.munguFactory.jhy.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.service.ItemUserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ItemUserController {
	private final ItemUserService itemService;

	// user 품목 목록 조회 ItemUserList
	@RequestMapping(value = "/ItemUserList")
	public String ItemUserList(ItemDTO itemDto, Model model) {
		List<ItemDTO> ItemUserList = itemService.itemUserList();
		model.addAttribute("itemUserList", ItemUserList);
		return "item/ItemUserList";
	}
	
	// user 품목 조회 ItemUserSelect
	@RequestMapping(value = "/ItemUserSelect")
	public String ItemUserSelect(ItemDTO itemDto, Model model, int item_no) {
		itemDto.setItem_no(item_no);
		int itemUserSelect = itemService.itemUserSelect(itemDto);

		model.addAttribute("itemDTO", itemDto);
		model.addAttribute("itemUserSelect", itemUserSelect);
		return "item/ItemUserSelect";
	}

}
