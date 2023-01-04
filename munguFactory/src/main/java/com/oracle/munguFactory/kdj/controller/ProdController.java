package com.oracle.munguFactory.kdj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProdController {

	@RequestMapping("/ProdList")
	public String ProdList() {
		
		return "prod/ProdList";
	}
}
