package com.oracle.munguFactory.lwh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.munguFactory.dto.StockTakingDTO;
import com.oracle.munguFactory.lwh.service.StockTakingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/stocktaking")
@RequiredArgsConstructor
public class StockTakingController {

	private final StockTakingService st;
	
	@GetMapping(value = "/main")
	public String goStockTaking(Model model) {
		
		//공장 코드
		model.addAttribute("factoryList", st.selectFactoryList());
		//상품 코드
		model.addAttribute("itemList", st.selectItemList());
		
		return "stocktaking/stocktaking";
	}
	
	@ResponseBody
	@GetMapping(value = "/search")
	public List<StockTakingDTO> selectStockTakingList(StockTakingDTO stockTakingDTO) {
		//목록 검색
		return st.selectStockTakingList(stockTakingDTO);
	}
	
	//등록
	
	
}
