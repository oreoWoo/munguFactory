package com.oracle.munguFactory.otw.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.ItemDTO;
import com.oracle.munguFactory.jhy.service.ItemAdminService;
import com.oracle.munguFactory.jhy.service.ItemUserService;
import com.oracle.munguFactory.lhj.service.LhjService;
import com.oracle.munguFactory.lhj.service.Paging;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class otwSujuRestController {
	
	private final LhjService LhjService;
	private final ItemUserService ItemUserService;
	
	// 거래처 조회
	@RequestMapping("sujuAccountList")
	public Map<String, Object> sujuAccountList(AccountsDTO account, String currentPage){
		//account 전체 Count
		int totalAccount = LhjService.totalAccount();
		System.out.println("LhjController totalAccount->"+totalAccount+","+currentPage);
		//Paging 작업
		Paging page = new Paging(totalAccount, currentPage);
		account.setStart(page.getStart());  //시작시1
		account.setEnd(page.getEnd());		//시작시 10
		account.setPageBlock(page.getPageBlock());
		System.out.println("AccountsDTO -->" + account.toString());
		List<AccountsDTO> accountList = LhjService.accountList(account);
		accountList.get(0).setStart(page.getStart());
		accountList.get(0).setEnd(page.getEnd());		//시작시 10
		accountList.get(0).setPageBlock(page.getPageBlock());
		System.out.println("TwSujuRestController accountList.size()---> "+ accountList.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", accountList);
		map.put("page", page);
		return map;
	}
	
	// 품목 조회
	@RequestMapping("sujuItemList")
	public List<ItemDTO> sujuItemList() {
		List<ItemDTO> sujuItemList = ItemUserService.itemUserList();
		return sujuItemList;
	}


}
