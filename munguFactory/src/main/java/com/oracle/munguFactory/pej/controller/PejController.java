package com.oracle.munguFactory.pej.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.pej.service.Paging;
import com.oracle.munguFactory.pej.service.PejService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PejController {
	
	private final PejService ps;
	
	@RequestMapping("/factoryList")
	public String factoryList(FactoryDTO factory, String currentPage, Model model) {
		System.out.println("PejController factoryList Start");
		int totalFactory = ps.totalFactory();
		System.out.println("PejController totalFactory-> "+totalFactory+", "+currentPage);
		
		Paging page = new Paging(totalFactory, currentPage);
		factory.setStart(page.getStart());  // 시작시 1
		factory.setEnd(page.getEnd());
		factory.setPageBlock(page.getPageBlock());

		List<FactoryDTO> factoryList = ps.factoryList(factory);
		System.out.println("PejController factoryList.size()-> "+factoryList.size());
		
		model.addAttribute("totalFactory", totalFactory);
		model.addAttribute("factoryList", factoryList);
		model.addAttribute("page", page);
		return "factory/factoryList";
	}
	
	@RequestMapping("/createFactory")
	public String createFactory(Model model, HttpServletRequest request) {
		/*
		 * System.out.println("PejController createFactory Start"); List<FactoryDTO>
		 * factoryList2 = ps.factoryList2(); model.addAttribute("factoryList2",
		 * factoryList2);
		 */
		return "factory/createFactory";
	}
	
	@RequestMapping("/insertFactory")
	public String insertFactory(FactoryDTO factoryDTO, Model model) {
		System.out.println("PejController insertFactory Start");
		int insertResult = ps.insertFactory(factoryDTO);
		if (insertResult == 1) {
			model.addAttribute("insertMsg", insertResult);
			return "forward:factoryList";
		} else {
			model.addAttribute("insertMsg", insertResult);
			return "forward:createFactory";
		}
	}
	
	@RequestMapping("/factoryInfo")
	public String factoryInfo(int factory_no, Model model) {
		System.out.println("PejController factoryInfo Start");
		FactoryDTO factoryDTO = ps.factoryInfo(factory_no);
		model.addAttribute("factoryDTO", factoryDTO);
		return "factory/factoryInfo";
	}
	
	@RequestMapping("/factoryInfoEdit")
	public String factoryInfoEdit(int factory_no, Model model) {
		System.out.println("PejController factoryInfo Start");
		FactoryDTO factoryDTO = ps.factoryInfoEdit(factory_no);
		model.addAttribute("factoryDTO", factoryDTO);
		return "factory/factoryInfoEdit";
	}
	
	@RequestMapping("/deleteFactory")
	public String deleteFactory(int factory_no, Model model) {
		System.out.println("PejController deleteFactory Start");
		int factoryDTO = ps.deleteFactory(factory_no);
		System.out.println("PejController deleteFactory factoryDTO->" +factoryDTO);
		
		if (factoryDTO == 0) {
			model.addAttribute("delMsg", factoryDTO);
			return "forward:factoryList";
		} else {
			model.addAttribute("delMsg", factoryDTO);
			return "forward:factoryList";
		}
	}
	
	@RequestMapping("/factorySearch")
	public String factorySearch(FactoryDTO factoryDTO, String searchString, String currentPage, Model model) {
		System.out.println("PejController factorySearch Start");
		
		int factorySearch = ps.factorySearch(searchString);
		System.out.println("PejController factorySearch factorySearch-> "+factorySearch);
		
		Paging page = new Paging(factorySearch, currentPage);
		System.out.println("PejController factorySearch page ->"+page);
		factoryDTO.setStart(page.getStart()); // 시작 시 1
		factoryDTO.setEnd(page.getEnd());     // 시작 시 10
		factoryDTO.setPageBlock(page.getPageBlock());
		
		List<FactoryDTO> factory = ps.factorySearchList(searchString);
		System.out.println("PejController factorySearch factory-> "+factory);
		System.out.println("factorySearch searchString-> "+searchString);
		
		model.addAttribute("totalfactory", factorySearch);
		model.addAttribute("factoryList", factory);
		model.addAttribute("page", page);
		
		return "factory/factoryList";
	}
	
	@RequestMapping("/updateFactory")
	public String updateFactory(FactoryDTO factory, Model model) {
		System.out.println("PejController updateFactory Start");
		int updateFactoryCount = ps.updateFactory(factory);
		System.out.println("PejController updateFactory updateFactoryCount-> "+updateFactoryCount);
		if (updateFactoryCount == 1) {
			model.addAttribute("upMsg", updateFactoryCount);
			return "forward:factoryList";
		} else {
			model.addAttribute("upMsg", updateFactoryCount);
			return "forward:factoryInfo";
		}
	}
}
