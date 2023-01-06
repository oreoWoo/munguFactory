package com.oracle.munguFactory.lhj.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.lhj.service.LhjService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LhjController {
	
	private final LhjService hjs;
	
	//-------------거래처 리스트------------------------------------------------
	@RequestMapping("/accountList")
	public String accountList(/*AccountsDTO account*/ Model model) {
		System.out.println("LhjController accountList Start...");
		/*
		 * List<AccountsDTO> accountList = hjs.accountList(account);
		 * model.addAttribute("accountList",accountList);
		 * System.out.println("LhjController accountList.size()---> "+accountList.size()
		 * );
		 */
		return "account/accountList";
	}
	
	@RequestMapping("/accountAddFrom")
	public String accountAddFrom() {
		System.out.println("LhjController accountAddFrom Start...");
		return "account/accountAddFrom";
	}
	
	@RequestMapping("/accountUpdateForm")
	public String accountUpdateForm() {
		System.out.println("LhjController accountUpdateForm Start...");
		return "account/accountUpdateForm";
	}
}
