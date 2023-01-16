package com.oracle.munguFactory.otw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.otw.service.otwSujuService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
@Slf4j
public class otwSujuController {
	
	private final otwSujuService tws;
	
	@RequestMapping("/sujuCreate")
	public String SujuCreate() {
		
		return "suju/sujuCreate";
	}
	
	@RequestMapping("/sujuSave")
	public String SujuSave(OrdersDTO ordersDTO) {
		log.info("OrdersDTO -> " + ordersDTO);
		int result = tws.sujuSave(ordersDTO); 
		
		
		return "redirect:/user/sujuList";
	}
}
