package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class OrdersDetailDTO {
	private int suju_no;
	private int item_no;
	private String item_name;
	private int suju_amount;
	private String prod_state;
	private String balju_no;
	
//	읽기전용
	private int stock_count;
}
