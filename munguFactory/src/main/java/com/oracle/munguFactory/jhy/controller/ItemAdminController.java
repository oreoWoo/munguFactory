package com.oracle.munguFactory.jhy.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.service.ItemAdminService;
import com.oracle.munguFactory.jhy.service.Paging;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ItemAdminController {
	private final ItemAdminService itemService;

	// admin 품목 목록 조회 ItemAdminList
	@RequestMapping(value = "/user/ItemAdminList")
	public String ItemAdminList(ItemDTO itemDto, Model model, String currentPage) {

		// Paging 작업
		int totalCount = itemService.totalCount();
		Paging page = new Paging(totalCount, currentPage);
		List<ItemDTO> ItemAdminList = itemService.itemAdminList(page);
		System.out.println("ItemAdminList start page -> " + page.getStart());

		itemDto.setStart(page.getStart());
		itemDto.setEnd(page.getEnd());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("page", page);
		
		model.addAttribute("itemDTO", itemDto);
		model.addAttribute("itemAdminList", ItemAdminList);
		
		System.out.println("ItemAdminList itemDTO -> " + itemDto);
		System.out.println("ItemAdminList totalCount -> " + totalCount);
		System.out.println("ItemAdminList -> " + ItemAdminList.size());
		System.out.println("page -> " + page);
		
		return "item/ItemAdminList";
	}

	// admin 품목 조회 ItemAdminSelect
	@RequestMapping(value = "/user/ItemAdminSelect")
	public String ItemAdminSelect(ItemDTO itemDto, Model model, int item_no) {
		itemDto.setItem_no(item_no);
		System.out.println("ItemAdminSelect ItemDTO -> " + itemDto);

		List<ItemDTO> itemAdminSelect = itemService.itemAdminSelect(itemDto);
		System.out.println("ItemAdminSelect -> " + itemAdminSelect);

		model.addAttribute("itemDTO", itemDto);
		model.addAttribute("itemAdminSelect", itemAdminSelect.get(0));
		return "item/ItemAdminSelect";
	}

	// admin 품목 등록 ItemAdminInsert
	// ItemAdminInsert 전 select
	@RequestMapping(value = "/admin/ItemAdminInsert")
	public String ItemAdminInsert(ItemDTO itemDto, Model model) {
		List<FactoryDTO> getFactoryList = itemService.getFactoryList();
		System.out.println("ItemAdminInsert factoryList -> " + getFactoryList);

		model.addAttribute("factoryList", getFactoryList);
		return "item/ItemAdminInsert";
	}

	// ItemAdminInsert
	@RequestMapping(value = "/admin/ItemAdminInsertConfirm")
	public String ItemAdminInsertConfirm(ItemDTO itemDto, Model model, String currentPage) {
		int itemAdminInsert = itemService.itemAdminInsert(itemDto);
		System.out.println("ItemAdminInsert itemAdminInsert -> " + itemAdminInsert);
		model.addAttribute("itemAdminInsert", itemAdminInsert);

		//Paging
		int totalCount = itemService.totalCount();
		Paging page = new Paging(totalCount, currentPage);
		
		// ItemAdminList
		List<ItemDTO> ItemAdminList = itemService.itemAdminList(page);
		itemDto.setStart(page.getStart());
		itemDto.setEnd(page.getEnd());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("page", page);
		model.addAttribute("itemAdminList", ItemAdminList);
		
		return "item/ItemAdminList";
	}

	// admin 품목 수정 ItemAdminUpdate
	// ItemAdminUpdate 전 select
	@RequestMapping(value = "/admin/ItemAdminUpdate")
	public String ItemAdminUpdate(ItemDTO itemDto, Model model, int item_no) {
		itemDto.setItem_no(item_no);
		System.out.println("ItemAdminUpdate itemDto" + itemDto);

		List<FactoryDTO> getFactoryList = itemService.getFactoryList();
		System.out.println("ItemAdminInsert factoryList -> " + getFactoryList);

		List<ItemDTO> ItemAdminUpSelect = itemService.itemAdminUpSelect(itemDto);
		System.out.println("ItemAdminUpdate ItemAdminUpSelect -> " + ItemAdminUpSelect);

		model.addAttribute("itemDTO", itemDto);
		model.addAttribute("factoryList", getFactoryList);
		model.addAttribute("ItemAdminUpSelect", ItemAdminUpSelect);

		return "item/ItemAdminUpdate";
	}

	// ItemAdminUpdate
	@RequestMapping(value = "/admin/ItemAdminUpdateConfirm")
	public String ItemAdminUpdateConfirm(ItemDTO itemDto, Model model, int item_no) {
		itemDto.setItem_no(item_no);
		System.out.println("ItemAdminUpdate item_no ->" + itemDto);
		int itemAdminUpdate = itemService.itemAdminUpdate(itemDto);
		System.out.println("ItemAdminUpdate -> " + itemAdminUpdate);

		model.addAttribute("itemDTO", itemDto);
		model.addAttribute("itemAdminUpdate", itemAdminUpdate);

		// ItemAdminSelect
		itemDto.setItem_no(item_no);
		List<ItemDTO> itemAdminSelect = itemService.itemAdminSelect(itemDto);
		model.addAttribute("itemAdminSelect", itemAdminSelect.get(0));
		return "item/ItemAdminSelect";
	}

	// admin 품목 삭제 ItemAdminDelete
	@RequestMapping(value = "/admin/ItemAdminDelete")
	public String ItemAdminDelete(ItemDTO itemDto, Model model, int item_no, String currentPage) {
		itemDto.setItem_no(item_no);
		int itemAdminDelete = itemService.itemAdminDelete(itemDto);
		System.out.println("ItemAdminDelete -> " + itemAdminDelete);
		model.addAttribute("itemDTO", itemDto);
		model.addAttribute("itemAdminDelete", itemAdminDelete);

		//Paging
		int totalCount = itemService.totalCount();
		Paging page = new Paging(totalCount, currentPage);
		
		// ItemAdminList
		List<ItemDTO> ItemAdminList = itemService.itemAdminList(page);
		
		itemDto.setStart(page.getStart());
		itemDto.setEnd(page.getEnd());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("page", page);
		model.addAttribute("itemAdminList", ItemAdminList);
		return "item/ItemAdminList";
	}
}
