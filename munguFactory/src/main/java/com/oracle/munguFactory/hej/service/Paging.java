package com.oracle.munguFactory.hej.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	private int currentPage = 1;	
	private int rowPage 	= 10; 		// 한 페이지에 10개씩
	private int pageBlock   = 10;
	
	private int start; 
	private int end; 
	private int startPage; 
	private int endPage; 
	private int total; 
	private int totalPage; 
	
	
	public Paging(int total, String currentPage1) {
		this.total = total;
		
		if(currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1);
		}

		start = (currentPage - 1) * rowPage + 1;	// 시작 시 1   11
		end   = start + rowPage - 1;				// 시작 시 10  20 
		totalPage = (int) Math.ceil((double)total / rowPage);
		startPage = currentPage - (currentPage - 1) % pageBlock; // 시작 시 1
		endPage   = startPage + pageBlock - 1;					 // 10
		
		// 공갈 페이지 예방
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
}