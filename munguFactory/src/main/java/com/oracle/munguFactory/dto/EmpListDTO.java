package com.oracle.munguFactory.dto;

import javax.persistence.Transient;

import lombok.Data;

@Data
public class EmpListDTO {
	private int emp_no; 			//사원 번호
	
	private String emp_name;		//사원 이름
	
	private String emp_hire_date;		//사원 입사일

	private int auth_no;		//사원 권한
	
	private int dept_no;
	
	private int posit_no;
	
	private String msg; //결과 메시지
	
	private int result; //결과 상태창

}
