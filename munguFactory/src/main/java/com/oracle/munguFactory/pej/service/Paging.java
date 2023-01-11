package com.oracle.munguFactory.pej.service;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Paging {
	
	private int currentPage=1;		private int rowPage=10;
	private int pageBlock=10;		
	private int start;				private int end;
	private int startPage;			private int endPage;
	private int total;	
	private int totalPage;
	private String searchString;

	
	public Paging(int total, String currentPage1) {
		this.total = total;
		
		if (currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1);		
		}
		
		start = (currentPage - 1) * rowPage;   
		end   = start+ rowPage-1;   
		
		totalPage = (int) Math.ceil((double)total / rowPage);
		startPage = currentPage - (currentPage - 1) % pageBlock;    
		endPage = startPage + pageBlock - 1;
		
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

}
