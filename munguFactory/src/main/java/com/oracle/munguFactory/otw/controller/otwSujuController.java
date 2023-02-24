package com.oracle.munguFactory.otw.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.auth.PrincipalDetails;
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
	public String SujuSave(OrdersDTO ordersDTO, @AuthenticationPrincipal PrincipalDetails principal) {
		log.info("OrdersDTO -> " + ordersDTO);
		ordersDTO.setEmp_no(principal.getEmpDTO().getEmp_no());
		int result = tws.sujuSave(ordersDTO); 
		
		
		return "redirect:/user/sujuList";
	}
}
