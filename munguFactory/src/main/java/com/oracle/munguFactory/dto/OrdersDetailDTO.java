package com.oracle.munguFactory.dto;

import lombok.Data;

@Data
public class OrdersDetailDTO {
	private int suju_no;
	private int item_no;
	private String item_name;
	private int suju_amount;
	private String prod_state;
}
