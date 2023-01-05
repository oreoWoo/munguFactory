package com.oracle.munguFactory.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class AccountsDTO {
	
	private int     accountNo;         //거래처코드
	private String  accountName;       //거래처명
	private String  accountIdno;       //사업자등록번호
	private String  accOwner;          //대표자명
	private String  accZipcode;        //우편번호
	private String  accAddress;        //주소
	private String  accAddress2;       //상세주소
	private String  accConditions;     //업태
	private String  accCategory;       //업종
	private String  accManager;        //거래처 담당자
	private Date    accEnddate;        //거래만료일
	private int     addState;          //거래현황
	private String  addTelnum;         //전화번호
	

}
