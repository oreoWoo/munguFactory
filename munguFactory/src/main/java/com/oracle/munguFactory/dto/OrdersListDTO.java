package com.oracle.munguFactory.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdersListDTO {
	
	private OrdersPaging ordersPaging;
	private List<OrdersDTO> ordersDTOs;
	
	
}
