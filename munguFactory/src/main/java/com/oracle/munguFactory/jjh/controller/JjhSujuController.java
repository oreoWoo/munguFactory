package com.oracle.munguFactory.jjh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.jjh.service.JjhSujuService;

import ch.qos.logback.classic.Logger;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
@Slf4j
public class JjhSujuController {
	
	private final JjhSujuService jjhSujuService;
	
	
	@GetMapping("/sujuDetail")
	public String sujuDetail(OrdersDTO ordersDTO, Model model) {
		log.info("sujuDetail start..");
		try {
			List<OrdersDetailDTO> ordersDetailDTOs = jjhSujuService.sujuDetail(ordersDTO.getSuju_no());
			ordersDTO.setOrdersDetailDTOs(ordersDetailDTOs);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		model.addAttribute("orders", ordersDTO);
		return "suju/sujuDetail";
	}
	
	@PostMapping("/sujuDelete")
	public String sujuDelete() {
		
		
		return "suju/sujulist";
	}
	
	@PostMapping("/sujuModifyForm")
	public String sujuModifyForm(OrdersDTO ordersDTO, Model model) {
		log.info("sujuModifyForm start...");
		log.info("ordersDTO->" + ordersDTO);
		
		model.addAttribute("orders", ordersDTO);
		return "suju/sujuModifyForm";
	}
}
