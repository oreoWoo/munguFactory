package com.oracle.munguFactory.hej.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.FactoryDTO;
import com.oracle.munguFactory.dto.OutputDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.hej.service.OutputService;
import com.oracle.munguFactory.hej.service.Paging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class OutputController {
	
	private final OutputService os;
	
	// 생산실적 목록
	@RequestMapping(value = "outputList")
	public String outputList(OutputDTO output, String currentPage, Model model) {
		
		System.out.println("~~ OutputController Start outputList ~~");
		
		int totalOutput = os.totalOutput();	// 생산실적 전체 cnt
			
		// Paging 작업
		Paging page = new Paging(totalOutput, currentPage);

		output.setStart(page.getStart());	// 시작 시 1
		output.setEnd(page.getEnd());		// 시작 시 10
		
		// 생산실적 목록
		List<OutputDTO> outputList = os.outputList(output);
		
		model.addAttribute("totalOutput", totalOutput);
		model.addAttribute("outputList" , outputList);
		model.addAttribute("page"	    , page);
		
		return "output/outputList";
	}
	
	// 생산실적 등록 페이지
	@RequestMapping(value = "writeFormOutput")
	public String writeFormOutput(Model model) {
		
		List<FactoryDTO> factoryList = os.factorySelect();	// 공장코드 GET
		List<EmpDTO> 	 empList 	 = os.empSelect();		// 사원번호 GET
		
		model.addAttribute("factoryList", factoryList);
		model.addAttribute("empList", empList);
		
		return "output/outputRegister";
	}
	
	// 찐 생산실적 등록
	@PostMapping(value = "registerOutput")
	public String registerOutput(OutputDTO output, Model model) {
		System.out.println("~~ OutputController Start registerOutput ~~");
		System.out.println("output data ->" + output);
		int result = os.insertOutput(output);
		
		if(result > 0) return "redirect:outputList";
		else {
			model.addAttribute("msg", "입력 실패 확인해보세요.");
			return "forward:writeFormOutput";
		}
	}
	
	// 생산실적 상세정보
	@GetMapping(value = "outputDetail")
	public String outputDetail(int prod_no, Model model) {
		System.out.println("~~ OutputController Start outputDetail ~~");
		
		OutputDTO output = os.outputDetail(prod_no);
		model.addAttribute("output", output);
		
		return "output/outputDetail";
	}
	
	// 생산실적 수정 페이지
	@GetMapping(value = "updateOutputForm")
	public String updateOutputForm(int prod_no, Model model) {
		log.info("~~ OutputController Start outputDetail ~~");
		
		OutputDTO output = os.outputDetail(prod_no);
		
		List<FactoryDTO> factoryList = os.factorySelect();	// 공장코드 GET
		List<EmpDTO> 	 empList 	 = os.empSelect();		// 사원번호 GET
		
		model.addAttribute("output", output);

		model.addAttribute("factoryList", factoryList);
		model.addAttribute("empList", empList);
		
		return "output/outputUpdate";
	}
	
	// 찐 생산실적 수정 (공장번호, 사원번호)
	@PostMapping(value = "updateOutput")
	public String updateOutput(OutputDTO output, Model model) {
		log.info("~~ updateOutput Start ~~");
		System.out.println("[UPDATE] output data -> " + output);
		
		int updateCnt = os.updateOutput(output);
		model.addAttribute("updateCnt", updateCnt);
		
		return "forward:outputList";
	}
	
	
	// 생산실적 삭제
	@RequestMapping(value = "deleteOutput")
	public String deleteOutput(OutputDTO prod_no, Model model) {
		log.info("~~ deleteOutput Start ~~");
		
		int result = os.deleteOutput(prod_no);
		
		return "redirect:outputList";
	}
	
	// 생산실적 조회
	@RequestMapping(value = "listSearch")
	public String listSearch(OutputDTO output, String currentPage, Model model) {
		System.out.println("~~ searchOutput Start ~~");
		
		int totalOutput = os.totalOutput();	// 생산실적 전체 cnt
		
		// Paging 작업
		/*
		 * Paging page = new Paging(totalOutput, currentPage);
		 * 
		 * output.setStart(page.getStart()); // 시작 시 1 output.setEnd(page.getEnd()); //
		 * 시작 시 10
		 */		
		System.out.println("[CONTROLLER] output -> " + output);
		List<OutputDTO> listSearchOutput = os.listSearchOutput(output);
		
		model.addAttribute("totalOutput", totalOutput);
		model.addAttribute("outputList", listSearchOutput);
		//model.addAttribute("page", page);
		
		return "output/outputList";
	}
	
	// 생산실적 조회 2트
	@PostMapping(value = "outputListAjaxChk")
	public String outputListAjaxChk(@RequestParam(defaultValue = "1") int pageNum, PageDTO searchOptions, Model model) {
		log.info("~~ outputListAjaxChk() Start ~~");
		
		searchOptions.setPageDTO(os.getOutputListSize(searchOptions), pageNum);
		
		List<OutputDTO> outputList = os.getOutputList(searchOptions);
		
		model.addAttribute("paging", searchOptions);
		model.addAttribute("outputList", outputList);
		
		return "ouptut/outputList";
	}
	
	
}
