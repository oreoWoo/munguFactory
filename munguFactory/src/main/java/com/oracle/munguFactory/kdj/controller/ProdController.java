package com.oracle.munguFactory.kdj.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/user/ProdList")
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
		//return "prod/ProdList";

	}
	
	//수정 Form
	@RequestMapping(value="/user/ProdModPop", method = RequestMethod.GET)
	public String detailModContent(Model model, int suju_no, int item_no) {
		System.out.println("detailContent start sujuNo->"+suju_no);
		System.out.println("detailContent start itemNo->"+item_no);
		
		ProdDTO prodDto = ps.ContentModProd(suju_no, item_no);
	
		System.out.println("ProdController detailModContent prodDto.getSujuNo()->"+prodDto.getSuju_no());
		System.out.println("ProdController detailModContent prodDto.getItemNo()->"+prodDto.getItem_no());
		System.out.println("ItemName 잘 받아오는지?-> "+ prodDto.getItem_name());
		model.addAttribute("prodDto", prodDto);
		
		return "prod/detailContent";
		//return "prod/detailContent";
		
	}
	
	// 수정 액션
	@RequestMapping(value ="/user/modContent", method = RequestMethod.POST)
	@ResponseBody
	public int modContent(ProdDTO prodDto, Model model) {
		System.out.println("modContent prodDto=> " + prodDto);
		int prod = ps.modContent(prodDto);
		
		return prod;
	}
	
	@RequestMapping("/user/delete")
	public String delete(ProdDTO prodDto, Model model) {
		
		prodDto = ps.delete(prodDto);
		
		return "prod/ProdList";
	}
}
