package com.oracle.munguFactory.dto;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrdersPaging {
	private int currentPage = 1;
	private int rowPage = 2;
	private int pageBlock = 2;
	private int total;
	private int start;
	private int totalPage;
	private int startPage;
	private int endPage;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
	private LocalDate startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
	private LocalDate endDate;
	private String searchName;
	public void setInfo(int total) {
		this.total = total;    // 140
		
		start = (currentPage - 1) * rowPage;  // 시작시 1     11   
	
		totalPage = (int) Math.ceil((double)total / rowPage);  // 시작시 3  5  14
		startPage = currentPage - (currentPage - 1) % pageBlock; // 시작시 1    
		endPage = startPage + pageBlock - 1;  // 10
		//    10        14
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
