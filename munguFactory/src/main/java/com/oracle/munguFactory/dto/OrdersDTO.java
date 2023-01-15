package com.oracle.munguFactory.dto;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrdersDTO {
	private int suju_no;
	private int emp_no;
	private String emp_name;
	private int account_no;
	private String account_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
	private LocalDate suju_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
	private LocalDate last_date;
	private String order_note;
	private List<OrdersDetailDTO> ordersDetailDTOs;
}
