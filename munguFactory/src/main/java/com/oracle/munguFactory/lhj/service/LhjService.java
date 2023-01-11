package com.oracle.munguFactory.lhj.service;

import java.util.List;

import com.oracle.munguFactory.dto.AccountsDTO;


public interface LhjService {

	int                totalAccount();                         //거래처등록 갯수 조회
	List<AccountsDTO>  accountList(AccountsDTO account);	   //거래처 전체 리스트
	AccountsDTO        accountInfoDetail(int accountNo);	   //거래처 상세정보
	AccountsDTO        accountUpdateForm(int account_no);	   //거래처 정보 수정 페이지
	int                updateAccount(AccountsDTO account);	   //거래처 정보 수정
	int                addAccount(AccountsDTO account);		   //거래처 신규등록
	AccountsDTO        accountDelete(int account_no);		   //거래처 정보삭제
	List<AccountsDTO>  accountSearchList(String searchString); //거래처 검색
	int                searchAccount(String searchString);     //검색갯수




	
}
