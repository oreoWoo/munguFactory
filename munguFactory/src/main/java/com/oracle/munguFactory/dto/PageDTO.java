package com.oracle.munguFactory.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PageDTO {

	private int currentPage = 1 ;	private int rowPage = 15;
	private int pageBlock = 5;
	private int totalPage;
	private int startPage;
	private int endPage;
	private boolean pre,next;
	private int offset;
	private int end;
	private int total;
	
	public PageDTO(int total, int currentPage) {
		this.total = total;
		this.currentPage=currentPage;
		offset = (currentPage-1) * rowPage;
		end = offset + rowPage;
		totalPage = (int)Math.ceil((double)total/rowPage);
		
		startPage = currentPage - (currentPage-1)%pageBlock;
		endPage = startPage + pageBlock -1;
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	}
	
	//subulPage search options
	private String searchOption;
	private String searchString;
	private int		factory_no;
	private int serial_no;
	private Date date;
}
