package com.oracle.munguFactory.lhj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.lhj.service.LhjService;
import com.oracle.munguFactory.lhj.service.Paging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LhjController {
	
	private final LhjService hjs;
	
	//-------------거래처 리스트------------------------------------------------
	@RequestMapping("/accountList")
	public String accountList(AccountsDTO account, String currentPage, Model model) {
		System.out.println("LhjController accountList Start...");
		//account 전체 Count
		int totalAccount = hjs.totalAccount();
		System.out.println("LhjController totalAccount->"+totalAccount+","+currentPage);
		//Paging 작업
		Paging page = new Paging(totalAccount, currentPage);

		
		account.setStart(page.getStart());  //시작시1
		account.setEnd(page.getEnd());		//시작시 10
		account.setPageBlock(page.getPageBlock());
		
		List<AccountsDTO> accountList = hjs.accountList(account);
		System.out.println("LhjController accountList.size()---> "+ accountList.size());
		
		model.addAttribute("totalAccount",totalAccount);
		model.addAttribute("accountList",accountList);
		model.addAttribute("page",page);

		return "account/accountList";
	}
	
	//-------거래처 등록 페이지---------------------------------------------------
	@RequestMapping("/accountAddFrom")
	public String accountAddFrom() {
		System.out.println("LhjController accountAddFrom Start...");
		return "account/accountAddFrom";
	}
	
	//------거래처 등록-------------------------------------------------------------
	@RequestMapping("/accountAdd")
	public String accountAdd(AccountsDTO account, Model model) {
		System.out.println("LhjController accountAdd Start....");
		int insertResult = hjs.addAccount(account);
		if( insertResult > 0 ) {
			return "redirect:accountList";
		}else {
			model.addAttribute("msg", "입력 실패! 확인해보세요");
			return "forward:accountAddFrom";
		}
	}
	
	//-------거래처별 상세정보--------------------------------------------------------------
	@RequestMapping("/accountInfoDetail")
	public String accountInfiDetail(int account_no, Model model) {
		System.out.println("LhjController accountInfiDetail Start...");
		AccountsDTO account = hjs.accountInfoDetail(account_no);
		System.out.println("LhjController accountInfoDetail.getAccount_no()-->"+ account.getAccount_no());
		model.addAttribute("account",account);
		return "account/accountInfoDetail";
	}

	//-------------거래처 수정 페이지---------------------------------------------------------------
	@RequestMapping("/accountUpdateForm")
	public String accountUpdateForm(int account_no, Model model ) {
		System.out.println("LhjController accountUpdateForm Start...");
		AccountsDTO account = hjs.accountUpdateForm(account_no);
		System.out.println("LhjController accountUpdateForm.getAccount_no()-->"+ account.getAccount_no());
		model.addAttribute("account",account);
		return "account/accountUpdateForm";
	}
	
	//-----------------거래처 수정-------------------------------
	@RequestMapping("/updateAccount")
	public String updateAccount(AccountsDTO account, Model model) {
		System.out.println("LhjController updateAccount Start.....");
		int updateResult = hjs.updateAccount(account);
		System.out.println("LhjController updateAccount "+account);
		
		if(updateResult > 0) {
			return "redirect:accountList";
		}
		else {
			model.addAttribute("msg","입력 실패 확인해보세요");
			System.out.println("LhjController updateAccount updateResult-->"+updateResult);
			return "forward:accountUpdateForm";
		}
	}
	
	//---------거래처 삭제--------------------------------------------
	@RequestMapping("/accountDelete")
	public String accountDelete(int account_no, Model model) {
		System.out.println("LhjController accountDelete Start.....");
		AccountsDTO account = hjs.accountDelete(account_no);
		model.addAttribute("account",account);
		return "forward:accountList";
	}
	
	//------거래처 검색-------------------------------------------------------
	@GetMapping("/accountSearch")
	public String accountSearch(AccountsDTO accounts,String searchString, String currentPage,Model model) {
		System.out.println("LhjController accountSearch Start...");
		
		//account Search Count
		int searchAccount = hjs.searchAccount(searchString);
		System.out.println("LhjController totalAccount->"+searchAccount);
		
		//Paging 작업
		Paging page = new Paging(searchAccount, currentPage);
		System.out.println("LhjController accountSearch page -> "+page);
		accounts.setStart(page.getStart());  //시작시1
		accounts.setEnd(page.getEnd());		//시작시 10
		accounts.setPageBlock(page.getPageBlock());
		
		List<AccountsDTO> account = hjs.accountSearchList(searchString);
		System.out.println("LhjController accountSearch account info()-->"+account);
		System.out.println("accountSearch searchString--->"+searchString);
		
		model.addAttribute("totalAccount",searchAccount);
		model.addAttribute("accountList",account);
		model.addAttribute("page",page);
		
		return "account/accountList";
	}
	
}
