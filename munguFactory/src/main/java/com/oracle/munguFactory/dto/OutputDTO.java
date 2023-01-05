package com.oracle.munguFactory.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class OutputDTO {

	public int 			 prod_no;		// 생산 No
	
	public int 			 item_no; 		// 품번 
	
	public int 			 emp_num;		// 사원번호
	public int			 factory_no;	// 공장코드 (=입고창고)
	
	public String 		 item_name;		// 품명
	
	public LocalDateTime finish_date;	// 작업일시 (=작업완료일?)
	public int 	 		 prod_amount;	// 생산수량
	public int	 		 poor_quantity;	// 불량수량
	public float		 yield;			// 수율
	
	
	// 조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int	   start;
	private int	   end;
}
