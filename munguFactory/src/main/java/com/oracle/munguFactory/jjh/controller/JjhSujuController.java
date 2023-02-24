package com.oracle.munguFactory.jjh.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.munguFactory.auth.PrincipalDetails;
import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.OrdersDTO;
import com.oracle.munguFactory.dto.OrdersDetailDTO;
import com.oracle.munguFactory.dto.OrdersListDTO;
import com.oracle.munguFactory.dto.OrdersPaging;
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
	public String sujuDetail(int suju_no,String msg, Model model) {
		log.info("sujuDetail start..");
		log.info("msg ->" + msg);
		log.info("suju_no ->" + suju_no);
		OrdersDTO orderDto = jjhSujuService.sujuDetail(suju_no);
		model.addAttribute("orders", orderDto);
		model.addAttribute("msg", msg);
		return "suju/sujuDetail";
	}
	
	@GetMapping("/sujuDelete")
	public String sujuDelete(@AuthenticationPrincipal PrincipalDetails principal, int suju_no, int emp_no, RedirectAttributes redirect) {
		log.info("sujuDelete start...");
		if(emp_no == principal.getEmpDTO().getEmp_no()) {
			int result = jjhSujuService.sujuDelete(suju_no);
			if(result == 0) {
				redirect.addAttribute("suju_no", suju_no);
				redirect.addAttribute("msg", "삭제에 실패했습니다");
				return "redirect:/user/sujuDetail";
			}else {
				return "redirect:/user/sujuList";
			}
		}else {
			redirect.addAttribute("suju_no", suju_no);
			redirect.addAttribute("msg", "등록한 사람만 삭제할 수 있습니다");
			return "redirect:/user/sujuDetail";
		}
		
	}
	
	@PostMapping("/sujuModify")
	public String sujuModify(@AuthenticationPrincipal PrincipalDetails principal, OrdersDTO ordersDTO, HttpSession session, RedirectAttributes redirect) {
		log.info("sujuModify start...");
		redirect.addAttribute("suju_no", ordersDTO.getSuju_no());
		if(ordersDTO.getEmp_no() == principal.getEmpDTO().getEmp_no()) {
			int result = jjhSujuService.sujuModify(ordersDTO);
			return "redirect:/user/sujuDetail";
		}else {
			redirect.addAttribute("msg", "등록한 사람만 수정할 수 있습니다");
			return "redirect:/user/sujuDetail";
		}
		
	}
	
	@PostMapping("/sujuModifyForm")
	public String sujuModifyForm(@AuthenticationPrincipal PrincipalDetails principal, OrdersDTO ordersDTO, Model model, RedirectAttributes redirect) {
		log.info("sujuModifyForm start...");
		log.info("ordersDTO->" + ordersDTO);
		redirect.addAttribute("suju_no", ordersDTO.getSuju_no());
		if(ordersDTO.getEmp_no() == principal.getEmpDTO().getEmp_no()) {
			model.addAttribute("ordersDTO", ordersDTO);
			return "suju/sujuModifyForm";
		}else {
			redirect.addAttribute("suju_no", ordersDTO.getSuju_no());
			redirect.addAttribute("msg", "등록한 사람만 수정할 수 있습니다");
			return "redirect:/user/sujuDetail";
		}
	}
	
	@GetMapping("/sujuList")
	public String sujuList(OrdersPaging ordersPaging, Model model) {
		log.info("sujuList start...");
		log.info("ordersPaging -> " + ordersPaging);
		OrdersListDTO ordersListDTO = jjhSujuService.sujuList(ordersPaging);
		model.addAttribute("ordersListDTO", ordersListDTO);
		return "suju/sujulist";
	}
	
	
	@PostMapping("/sujuListAction")
	@ResponseBody
	public OrdersListDTO sujuListAction(OrdersPaging ordersPaging, Model model) {
		log.info("sujuList start...");
		log.info("ordersPaging -> " + ordersPaging);
		OrdersListDTO ordersListDTO = jjhSujuService.sujuList(ordersPaging);
		model.addAttribute("ordersListDTO", ordersListDTO);
		return ordersListDTO;
	}
	
	
}
