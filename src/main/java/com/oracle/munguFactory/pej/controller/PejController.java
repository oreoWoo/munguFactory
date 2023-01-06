package com.oracle.munguFactory.pej.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PejController {
	@RequestMapping("/factoryList")
	public String factoryList() {
		System.out.println("PejController factoryList Start");
		return "factory/factoryList";
	}
	
	@RequestMapping("/createFactory")
	public String createFactory() {
		System.out.println("PejController createFactory Start");
		return "factory/createFactory";
	}
}
