package com.oracle.munguFactory.hej.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.OutputDTO;
import com.oracle.munguFactory.hej.service.OutputService;
import com.oracle.munguFactory.hej.service.Paging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class OutputController {
	
	private final OutputService os;
	
	@RequestMapping("/listOutput")
	public String outputList(OutputDTO output, String currentPage, Model model) {
		
		System.out.println("~~ EjOutputController Start outputList ~~");
		
		int totalOutput = os.totalOutput();	// 생산실적 전체 cnt
		
			
		// Paging 작업
		Paging page = new Paging(totalOutput, currentPage);

		output.setStart(page.getStart());	// 시작 시 1
		output.setEnd(page.getEnd());		// 시작 시 10
		
		// 생산실적 목록
		List<OutputDTO> listOutput = os.listOutput(output);
		
		model.addAttribute("totalOutput", totalOutput);
		model.addAttribute("listOutput" , listOutput);
		model.addAttribute("page"	    , page);
		
		return "output/outputList";
	}
	
	// 생산실적 등록 페이지
	@RequestMapping(value = "writeFormOutput")
	public String writeFormOutput(Model model) {
		
		// 공장코드 GET
		//List<Factory> factoryList = os.factorySelect();
		//model.addAttribute("factoryList", factoryList);
		
		return "output/outputRegister";
	}
	
	
	
	// 찐 생산실적 등록
	@PostMapping(value = "registerOutput")
	public String registerOutput(OutputDTO output, Model model) {
		System.out.println("~~ EjOutputController Start registerOutput ~~");
	
		int result = os.insertOutput(output);
		
		if(result > 0) return "redirect:listOutput";
		else {
			model.addAttribute("msg", "입력 실패 확인해보세요.");
			return "forward:outputRegister";
		}
	}
	
	// 생산실적 삭제
	@RequestMapping(value = "deleteOutput")
	public String deleteOutput(OutputDTO prod_no, Model model) {
		
		int result = os.deleteOutput(prod_no);
		
		return "redirect:listOutput";
	}
	
}
