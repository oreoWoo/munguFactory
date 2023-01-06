package com.oracle.munguFactory.kdj.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.ProdDTO;
import com.oracle.munguFactory.hej.service.Paging;
import com.oracle.munguFactory.kdj.service.ProdService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProdController {
	private final ProdService ps;

	@RequestMapping("/ProdList")
	public String ProdList(ProdDTO prodDto, String currentPage, Model model) {
		System.out.println("ProdListController start~!");
		
		int totalProdCnt = ps.totalProdCnt(); //생산지시 전체 카운트
		
		// Paging 작업
		Paging page = new Paging(totalProdCnt, currentPage);

		prodDto.setStart(page.getStart());	// 시작 시 1
		prodDto.setEnd(page.getEnd());		// 시작 시 10
		
		//생산지시 목록
		List<ProdDTO> listProd = ps.listProd(prodDto);
		
		model.addAttribute("totalProdCnt",totalProdCnt);
		model.addAttribute("listProd",listProd);
		model.addAttribute("page",page);
		
		return "prod/ProdList";
	}
}
