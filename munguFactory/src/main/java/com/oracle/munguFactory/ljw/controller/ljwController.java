package com.oracle.munguFactory.ljw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/inventoryManagement")
	public String inventoryManagementMain(Model model) {
		model.addAttribute("factoryList",service.getFactoryList());
		return "inventoryManagement/main";
	}
	@PostMapping("/inventoryManagementListAjaxChk")
	public String inventoryManagementListAjaxChk(@RequestParam(defaultValue = "1") int pageNum,PageDTO searchOptions, Model model) {
		log.info("inventoryManagementListAjaxChk() start...");
		searchOptions.setPageDTO(service.getSubulListSize(searchOptions), pageNum);
		List<SubulDTO> subulList = service.getSubulList(searchOptions);
		model.addAttribute("paging",searchOptions);
		model.addAttribute("subulList", subulList);
		return "inventoryManagement/inventoryManagementList";
	}
	@GetMapping("/Shipment")
	public String shipmentMain(Model model) {
		model.addAttribute("factoryList",service.getFactoryList());
		return "shipment/main";
	}
	@PostMapping("/aaa/shipmentAjaxChk2")
	public String shipmentAjaxChk(@RequestParam(defaultValue = "1") int pageNum,PageDTO searchOptions, Model model) {
		log.info("shipmentAjaxChk() start...");
		searchOptions.setPageDTO(service.getSubulListSize(searchOptions), pageNum);
		List<SubulDTO> subulList = service.getSubulList(searchOptions);
		model.addAttribute("paging",searchOptions);
		model.addAttribute("subulList", subulList);
		return "shipment/shipmentList";
	}
	@GetMapping("/ajaxInsertShipmentForm")
	public String ajaxInsertShipment(Model model) {
		model.addAttribute("accountList", service.getAccountList());
		return "shipment/shipmentList";
	}
	@GetMapping("/ajaxGetSujuList")
	public String ajaxGetSujuList(Model model, int account_no) {
		model.addAttribute("orderList", service.getOrderList(account_no));
		return "shipment/shipmentList";
	}
	@GetMapping("/ajaxGetItemList")
	public String ajaxGetItemList(Model model, int suju_no) {
		model.addAttribute("OrdersDetailList", service.getOrdersDetailList(suju_no));
		return "shipment/shipmentList";
	}
	@GetMapping("/ajaxGetOrdersDetail")
	public String ajaxGetOrdersDetail(Model model, int suju_no, int item_no) {
		model.addAttribute("OrdersDetail", service.getOrdersDetail(suju_no, item_no));
		return "shipment/shipmentList";
	}
	@ResponseBody
	@PostMapping("/ajaxInsertShipment")
	public String ajaxInsertShipment(Model model, SubulDTO subul) {
		log.info("ajaxInsertShipment() start...");
		subul.setEmp_no(2301001);
		int result = 0;
		try {
			result = service.insertShipment(subul);
		} catch (Exception e) {
			System.out.println("ajaxInsertShipment() e.getMessage() :"+e.getMessage());
			result = 0;
		}
		System.out.println(result);
		return Integer.toString(result);
	}
}
