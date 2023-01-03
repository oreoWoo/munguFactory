package com.oracle.munguFactory.otw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TwSujuController {

	@RequestMapping("/SujuList")
	public String SujuList() {
		
		return "suju/sujulist";
	}
}
