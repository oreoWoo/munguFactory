package com.oracle.munguFactory.hej.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EjOutputController {
	
	@RequestMapping("/OutputList")
	public String OutputList() {
		
		return "output/outputList";
	}
}
