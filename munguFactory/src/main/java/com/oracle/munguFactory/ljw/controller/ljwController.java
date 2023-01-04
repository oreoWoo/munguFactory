package com.oracle.munguFactory.ljw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ljwController {
	
	@GetMapping("/inventoryManagement")
	public String inventoryManagementMain() {
		return "inventoryManagement/main";
	}
	@GetMapping("/inventoryManagementListAjaxChk")
	public String inventoryManagementListAjaxChk(Model model) {
		model.addAttribute("subString", "문자열전달확인");
		return "inventoryManagement/inventoryManagementList";
	}
}
