package com.oracle.munguFactory.jjh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String sujuDetail(int suju_no, Model model) {
		log.info("sujuDetail start..");
		OrdersDTO orderDto = null;
		try {
			orderDto = jjhSujuService.sujuDetail(suju_no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		model.addAttribute("orders", orderDto);
		return "suju/sujuDetail";
	}
	
	@GetMapping("/sujuDelete")
	public String sujuDelete(int suju_no, RedirectAttributes redirect) {
		log.info("sujuDelete start...");
		int result = jjhSujuService.sujuDelete(suju_no);
		if(result == 0) {
			redirect.addAttribute("suju_no", suju_no);
			return "redirect:/user/sujuDetail";
		}else {
			return "suju/sujulist";
		}
	}
	
	@PostMapping("/sujuModifyForm")
	public String sujuModifyForm(OrdersDTO ordersDTO, Model model) {
		log.info("sujuModifyForm start...");
		log.info("ordersDTO->" + ordersDTO);
		model.addAttribute("orders", ordersDTO);
		return "suju/sujuModifyForm";
	}
	

}
