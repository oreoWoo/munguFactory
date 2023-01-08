package com.oracle.munguFactory.ljw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.PageDTO;
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
	public String inventoryManagementMain(Model model) {
		List<FactoryDTO> factoryList = service.getFactoryList();
		System.out.println(factoryList.size());
		model.addAttribute("factoryList",factoryList);
		return "inventoryManagement/main";
	}
	@GetMapping("/inventoryManagementListAjaxChk")
	public String inventoryManagementListAjaxChk(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		log.info("inventoryManagementListAjaxChk() start...");
		PageDTO paging = new PageDTO(service.getSubulListSize(), pageNum);
		List<SubulDTO> subulList = service.getSubulList(paging);
		
		model.addAttribute("paging",paging);
		model.addAttribute("subulList", subulList);
		return "inventoryManagement/inventoryManagementList";
	}
}
