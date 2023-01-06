package com.oracle.munguFactory.ljw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.munguFactory.dto.SubulDTO;
import com.oracle.munguFactory.ljw.service.ljwService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ljwController {
	private final ljwService service;
	
	@GetMapping("/inventoryManagement")
	public String inventoryManagementMain() {
		return "inventoryManagement/main";
	}
	@GetMapping("/inventoryManagementListAjaxChk")
	public String inventoryManagementListAjaxChk(Model model) {
		List<SubulDTO> subulList = service.getAllSubulList();
		log.info("inventoryManagementListAjax() start...");
		
		model.addAttribute("subulList", subulList);
		model.addAttribute("subString", "문자열전달확인");
		return "inventoryManagement/inventoryManagementList";
	}
}
