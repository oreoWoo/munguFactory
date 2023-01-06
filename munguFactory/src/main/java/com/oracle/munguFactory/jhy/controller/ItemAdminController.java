package com.oracle.munguFactory.jhy.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.service.ItemAdminService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ItemAdminController {
	private final ItemAdminService itemservice;
	
	
	//admin 품목 목록 조회 ItemAdminList
	@RequestMapping(value = "/ItemAdminList")
	public String ItemAdminList(ItemDTO itemDto, Model model) {
		List<ItemDTO> ItemAdminList = itemservice.itemAdminList();
		model.addAttribute("itemAdminList", ItemAdminList);
		
		return "item/itemAdminList";
	}

}
