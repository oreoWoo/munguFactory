package com.oracle.munguFactory.otw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class otwSujuController {

	@RequestMapping("/SujuList")
	public String SujuList() {
		
		return "suju/sujulist";
	}
	
	@RequestMapping("/SujuCreate")
	public String SujuCreate() {
		
		return "suju/sujuCreate";
	}
}
