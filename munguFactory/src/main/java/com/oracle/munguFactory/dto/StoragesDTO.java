package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class StoragesDTO {
	private int factory_no;
	private int item_no;
	private int stock_count;
	
//	읽기전용
	private String factory_name;
	private String item_name;
	private int stock_unit;
}
