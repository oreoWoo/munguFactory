package com.oracle.munguFactory.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class StockTakingDTO {

	private Integer subul_num;			// 수불부 번호
	private Integer item_no;			// 품번
	private Integer emp_no;				// 상품번호
	private Integer serial_no;			// 고유번호
	private Integer amount;				// 수량
	private String gubun;			// 구분
	private String subul_note;		// 비고
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd", iso = ISO.DATE_TIME)
	private LocalDateTime date;
	private Integer db_amount;
	private String factory_name;
	private String item_name;
	private Integer stock_count;
	private Integer factory_no;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd", iso = ISO.DATE)
	private LocalDate startDate;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd", iso = ISO.DATE)
	private LocalDate endDate;
	
	private String pageNum;
	private int start;
	private int end;
	private int rowPage;
	private String currentPage;
	
}
