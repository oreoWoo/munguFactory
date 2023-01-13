package com.oracle.munguFactory.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class ProdDTO {
	
	private int      suju_no;       //수주번호
	private int      item_no;       //품번
	private int      emp_no;        //사원번호
	private String   finish_date;   //생산완료일자
	private String   prod_date;     //수주일자
	private int      prod_amount;   //생산수량
	private String   prod_state;    //진행상태
	private int      factory_no;  //공장코드

	//paging
	private Long   rn;		
	private String pageNum;  
	private int    start; 		 	
	private int    end;
	
	//ItemDTO
	private String item_name;


}
