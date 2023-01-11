package com.oracle.munguFactory.lhj.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.lhj.dao.LhjDao;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LhjServiceImpl implements LhjService {
	private final LhjDao hjd;

	//-----거래처 등록 갯수(페이징처리용)-----------------------------
	@Override
	public int totalAccount() {
		System.out.println("LhjServiceImpl totalAccount Start...");
		int totalAccount = hjd.totalAccount();
		System.out.println("LhjServiceImpl totalAccount--->"+totalAccount);
		return totalAccount;
	}

	//---- 거래처 리스트-----------------------------------------
	@Override
	public List<AccountsDTO> accountList(AccountsDTO account) {
		List<AccountsDTO> accountList = null;
		System.out.println("LhjServiceImpl accountList Start...");
		accountList = hjd.accountList(account);
		System.out.println("LhjServiceImpl accountList.size() --->"+accountList.size());
		return accountList;
	}
	
	//-----거래처별 상세정보---------------------------------
	@Override
	public AccountsDTO accountInfoDetail(int account_no) {
		System.out.println("LhjServiceImpl accountInfoDetail Start....");
		AccountsDTO account = null;
		account = hjd.accountInfoDetail(account_no);
		return account;
	}
	
	//---------거래처 정보 수정 페이지---------------------------------------
	@Override
	public AccountsDTO accountUpdateForm(int account_no) {
		System.out.println("LhjServiceImpl accountUpdateForm Start....");
		AccountsDTO account = null;
		account = hjd.accountUpdateForm(account_no);
		return account;
	}
	
	//----------거래처 정보 수정----------------------------------------------
	@Override
	public int updateAccount(AccountsDTO account) {
		System.out.println("LhjServiceImpl updateAccount Start......");
		int updateResult = 0;
		updateResult = hjd.updateAccount(account);
		return updateResult;
	}
	
	//-----------신규 거래처 등록-----------------------------------
	@Override
	public int addAccount(AccountsDTO account) {
		System.out.println("LhjServiceImpl addAccount Start...");
		int insertResult = 0;
		insertResult = hjd.addAccount(account);
		return insertResult;
	}
	
	//---------거래처 정보 삭제---------------------------------------
	@Override
	public AccountsDTO accountDelete(int account_no) {
		System.out.println("LhjServiceImpl accountDelete Start....");
		AccountsDTO account = null;
		account = hjd.accountDelete(account_no);
		return account;
	}

	//---------거래처 검색 리스트--------------------------------------------
	@Override
	public List<AccountsDTO> accountSearchList(String searchString) {
		System.out.println("LhjServiceImpl accountSearchList Start...");
		List<AccountsDTO> account = null;
		account= hjd.accountSearchList(searchString);
		return account;
	}

	//----------거래처 검색 Total--------------------------------
	@Override
	public int searchAccount(String searchString) {
		System.out.println("LhjServiceImpl searchAccount total Start....");
		int searchAccountTotal = 0;
		searchAccountTotal = hjd.searchAccount(searchString);
		System.out.println("LhjServiceImpl searchAccountTotal-->"+searchAccountTotal);
		return searchAccountTotal;
	}
	
	


}
