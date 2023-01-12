package com.oracle.munguFactory.lhj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.AccountsDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class LhjDaoImpl implements LhjDao {
	
	private final SqlSession session;
	
	//--------거래처 등록 갯수-------------------------------
	@Override
	public int totalAccount() {
		int totalAccount=0;
		System.out.println("LhjDaoImpl totalAccount Start.....");
		
		try {
			totalAccount = session.selectOne("hjTotalAccount");
			System.out.println("LhjDaoImpl totalAccount--->"+totalAccount);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl totalAccount e.getMessage()--->"+e.getMessage());
		}
		return totalAccount;
	}
	
	//---------거래처 전체 리스트------------------------------------
	@Override
	public List<AccountsDTO> accountList(AccountsDTO account) {
		List<AccountsDTO> accountList = null;
		System.out.println("LhjDaoImpl accountList Start...");
		try {
			accountList = session.selectList("hjAccountList", account);
			System.out.println("LhjDaoImpl accountList accountList.size()-->"+accountList.size());
		} catch (Exception e) {
			System.out.println("LhjDaoImpl accountList e.getMessage()--->"+e.getMessage());
		}
		
		return accountList;
	}

	//-------거래처별 정보 상세----------------------------------------------
	@Override
	public AccountsDTO accountInfoDetail(int account_no) {
		System.out.println("LhjDaoImpl accountInfoDetail Start....");
		AccountsDTO account = null;
		try {
			account = session.selectOne("hjAccountInfoDetail",account_no);
			System.out.println("LhjDaoImpl accountInfoDetail accountNo-->"+account_no);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl accountInfoDetail e.getMessage()-->"+e.getMessage());
		}
		return account;
	}
	
	//-----------거래처 정보 수정 페이지--------------------------------------
	@Override
	public AccountsDTO accountUpdateForm(int account_no) {
		System.out.println("LhjDaoImpl accountUpdateForm Start....");
		AccountsDTO account = null;
		try {
			account = session.selectOne("hjAcountUpdateForm",account_no);
			System.out.println("LhjDaoImpl accountUpdateForm accountNo-->"+account_no);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl accountUpdateForm e.getMessage()-->"+e.getMessage());
		}
		return account;
	}
	
	//---------거래처 정보 수정----------------------------------------------
	@Override
	public int updateAccount(AccountsDTO account) {
		System.out.println("LhjDaoImpl updateAccount Start....");
		int updateResult = 0;
		
		try {
			updateResult = session.update("hjUpdateAccount",account);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl updateAccount e.getMessage()-->"+e.getMessage());
		}
		return updateResult;
	}
	
	//-----------거래처 등록--------------------------------------------
	@Override
	public int addAccount(AccountsDTO account) {
		System.out.println("LhjDaoImpl addAccount Start...");
		int insertResult =0;
		try {
			insertResult = session.insert("hjAddAccount", account);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl addAccount e.getMessage()-->"+e.getMessage());
		}
		return insertResult;
	}
	
	//---------------거래처 삭제-------------------------------------
	@Override
	public int accountDelete(int account_no) {
		System.out.println("LhjDaoImpl accountDelete Start...");
		int result =0;
		try {
			result = session.delete("hjAccountDelete", account_no);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl accountDelete e.getMessage()-->"+e.getMessage());
		}
		return result;
	}

	//--------------거래처 검색 리스트--------------------------------------------------
	@Override
	public List<AccountsDTO> accountSearchList(String searchString) {
		System.out.println("LhjDaoImpl accountSearchList Start....");
		List<AccountsDTO> account = null;
		try {
			account = session.selectList("hjsearchAccount", searchString);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl hjsearchAccount e.getMessage()-->"+e.getMessage());
		}
		return account;
	}
	
	//---------------검색 거래처 Total-------------------------------------------
	@Override
	public int searchAccount(String searchString) {
		int searchAccountTotal = 0;
		System.out.println("LhjDaoImpl searchAccount Total Start...");
		try {
			searchAccountTotal = session.selectOne("hjsearchAccountTotal", searchString);
		} catch (Exception e) {
			System.out.println("LhjDaoImpl searchAccount Total e.getMessage()-->"+e.getMessage());
		}
		return searchAccountTotal;
	}

	


}
