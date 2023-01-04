package com.oracle.munguFactory.hej.domain;

import java.time.LocalDateTime;

public class EjOutputDTO {

	public int 			 prodNo;	// 생산 No
	
	//public int partNo; // 품번  (이름 미확정)
	
	public int 			 emp_num;	// 사원번호
	public int			 factoryCode;	// 공장코드 (=입고창고)
	
	//public String prodName;	// 품명 (이름 미확정)
	
	public LocalDateTime workDate;	// 작업일시 (=작업완료일?)
	public int 	 		 prodQuantity;	// 생산수량
	public int	 		 poorQuantity;	// 불량수량
	public float		 yield;			// 수율
	
}
