package com.oracle.munguFactory.dto;

import java.sql.Date;

import lombok.Data;


@Data
public class AccountsDTO {
	
	private int     account_no;         //거래처코드
	private String  account_name;       //거래처명
	private String  account_idno;       //사업자등록번호
	private String  account_type;       //거래처 유형

	private String  acc_owner;          //대표자명
	private String  acc_zipcode;        //우편번호
	private String  acc_address;        //주소
	private String  acc_address2;       //상세주소
	private String  acc_conditions;     //업태
	private String  acc_category;       //업종
	private String  acc_manager;        //거래처 담당자
	private Date    acc_enddate;        //거래만료일
	private int     add_state;          //거래현황
	private String  add_telnum;         //전화번호
	
	//paging 작업 및 검색 조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int pageBlock;
	private int start; 		 	private int end;

}
