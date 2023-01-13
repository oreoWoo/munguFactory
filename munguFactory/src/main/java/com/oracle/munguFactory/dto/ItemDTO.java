package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class ItemDTO {
	private int item_no; 		//품번
	private int factory_no;		//공장코드
	private String item_name;	//품명
	private int stock_unit;		//재고단위
	private String item_check;	//생산여부
	private String hs_code;		//HS코드
	
	//factory
	private String factory_name; //공장명

}
