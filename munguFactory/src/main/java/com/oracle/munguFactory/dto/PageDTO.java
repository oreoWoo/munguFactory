package com.oracle.munguFactory.dto;

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
	
	public PageDTO() {};
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
	private String	searchOption;
	private String	searchString;
	private String	gubun;
	private int		factory_no;
	private int		serial_no;
	private String	subul_date;
	public void setPageDTO(int total, int currentPage) {
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
}
