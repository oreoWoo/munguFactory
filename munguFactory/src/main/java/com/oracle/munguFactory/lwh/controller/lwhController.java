package com.oracle.munguFactory.lwh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/stocktaking")
@RequiredArgsConstructor
public class lwhController {

	@GetMapping(value = "/main")
	public String goStockTaking() {
		return "stocktaking/stocktaking";
	}
	
}
