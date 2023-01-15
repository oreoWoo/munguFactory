package com.oracle.munguFactory.ljw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;
import com.oracle.munguFactory.ljw.service.ljwService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ljwController {
	private final ljwService service;
	
//	수불부 페이지이동
	@GetMapping("/inventoryManagement")
	public String inventoryManagementMain(Model model) {
		model.addAttribute("factoryList",service.getFactoryList());
		return "inventoryManagement/main";
	}
//	(Ajax) 수불부 목록 검색 및 가져오기
	@PostMapping("/inventoryManagementListAjaxChk")
	public String inventoryManagementListAjaxChk(String pageaddr, int pageNum, PageDTO searchOptions, Model model) {
		log.info("inventoryManagementListAjaxChk() start...");
		searchOptions.setPageDTO(service.getSubulListSize(searchOptions), pageNum);
		model.addAttribute("paging",searchOptions);
		model.addAttribute("subulList", service.getSubulList(searchOptions));
		return pageaddr;
	}
//	출하등록 페이지이동
	@GetMapping("/Shipment")
	public String shipmentMain(Model model) {
		model.addAttribute("factoryList",service.getFactoryList());
		return "shipment/main";
	}
//	(Ajax) 출하등록 거래처목록 가져오기
	@GetMapping("/ajaxInsertShipmentForm")
	public String ajaxInsertShipment(Model model) {
		model.addAttribute("accountList", service.getAccountList());
		return "shipment/shipmentList";
	}
//	(Ajax) 출하등록 거래처-수주목록 가져오기
	@GetMapping("/ajaxGetSujuList")
	public String ajaxGetSujuList(Model model, int account_no) {
		model.addAttribute("orderList", service.getOrderList(account_no));
		return "shipment/shipmentList";
	}
//	(Ajax) 출하등록 거래처-수주-아이템목록 가져오기
	@GetMapping("/ajaxGetItemList")
	public String ajaxGetItemList(Model model, int suju_no) {
		model.addAttribute("OrdersDetailList", service.getOrdersDetailList(suju_no));
		return "shipment/shipmentList";
	}
//	(Ajax) 출하등록 거래처-수주-아이템-상세정보 가져오기
	@GetMapping("/ajaxGetOrdersDetail")
	public String ajaxGetOrdersDetail(Model model, int suju_no, int item_no) {
		model.addAttribute("OrdersDetail", service.getOrdersDetail(suju_no, item_no));
		return "shipment/shipmentList";
	}
//	(Ajax) 출하등록 실행(transaction rollback기능)
	@ResponseBody
	@PostMapping("/ajaxInsertShipment")
	public int ajaxInsertShipment(Model model, SubulDTO subul) {
		log.info("ajaxInsertShipment() start...");
		subul.setEmp_no(2301001);
		int result = 0;
		try {
			result = service.insertShipment(subul);
		} catch (Exception e) {
			System.out.println("ajaxInsertShipment() e.getMessage() :"+e.getMessage());
			result = 0;
		}
		return result;
	}
}
