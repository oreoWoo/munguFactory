package com.oracle.munguFactory.kdj.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	//public String ProdList(ProdDTO prodDto, String currentPage, Model model, int sujuNo, int itemNo) {
	public String ProdList(String currentPage, Model model) {
		System.out.println("ProdListController start~!");
		
		int totalProdCnt = ps.totalProdCnt(); //생산지시 전체 카운트
		// Paging 작업
		Paging page = new Paging(totalProdCnt, currentPage);

		ProdDTO prodDto = new ProdDTO();
		prodDto.setStart(page.getStart());	// 시작 시 1
		prodDto.setEnd(page.getEnd());		// 시작 시 10
		//생산지시 목록
		List<ProdDTO> listProd = ps.listProd(prodDto);
		
		model.addAttribute("totalProdCnt",totalProdCnt);
		model.addAttribute("prodList",listProd);
		model.addAttribute("page",page);
		
		return "prod/ProdList";
	}
	//수정
	@RequestMapping(value="/ProdModPop", method = RequestMethod.GET)
	public String detailModContent(Model model, int sujuNo) {
		System.out.println("detailContent start ~!");
		
		int prodDto =  ps.ContentModProd(sujuNo);
		
		model.addAttribute("prodDto", prodDto);
		
		return "prod/detailContent";
		
	}
}
