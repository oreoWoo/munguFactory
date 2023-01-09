package com.oracle.munguFactory.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SubulDTO {

	private int subul_num;			// 수불부 번호
	private int item_no;			// 품번
	private int emp_no;				// 상품번호
	private int serial_no;			// 고유번호
	private Date subul_date;		// 날짜
	private int amount;				// 수량
	private String gubun;			// 구분
	private String subul_note;		// 비고
	
//	읽기전용
	private String emp_name;
	private String factory_name;
	private String item_name;
}
