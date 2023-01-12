package com.oracle.munguFactory.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
public class DeptDTO {
	private int dept_no;
	private String dept_name;
}
