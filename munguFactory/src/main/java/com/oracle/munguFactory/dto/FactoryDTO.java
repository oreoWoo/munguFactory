package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class FactoryDTO {
	private int		factory_no;
	private String 	factory_name;
	private String 	factory_address1;
	private String 	factory_address2;
	private String 	factory_call;
	private String 	factory_use;
	
	//paging 작업 및 검색 조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int pageBlock;
	private int start; 		 	private int end;
}
