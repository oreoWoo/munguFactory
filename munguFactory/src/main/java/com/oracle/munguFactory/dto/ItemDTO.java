package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class ItemDTO {
	private int itemNo; 		//품번
	private int factoryNo;		//공장코드
	private String itemName;	//품명
	private int stockUnit;		//재고단위
	private String itemCheck;	//생산여부
	private String hsCode;		//HS코드

}
