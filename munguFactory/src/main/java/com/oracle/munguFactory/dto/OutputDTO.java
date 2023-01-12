package com.oracle.munguFactory.dto;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class OutputDTO {

	private int 			 prod_no;		// 생산 No
	private int 			 item_no; 		// 품번 
	private int 			 emp_no;		// 사원번호
	private int			 	 factory_no;	// 공장코드 (=입고창고)
	private String 		 	 item_name;		// 품명
	private Date 	 finish_date;	// 작업일시 (=작업완료일?)
	private int 	 		 prod_amount;	// 생산수량
	private int	 		 	 poor_quantity;	// 불량수량
	private float		 	 yield;			// 수율
	
	
	// 조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int	   start;
	private int	   end;
	
	// 읽기 전용
	private String factory_name;
}
