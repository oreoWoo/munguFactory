package com.oracle.munguFactory.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class EmpDTO {
	public int    emp_no;			// 사원번호
	public int    posit_no;			// 직급번호
	public int    dept_no;			// 부서번호
	public String emp_name;			// 사원이름
	public String emp_id;			// 사원 ID
	public String emp_password;		// 사원 비밀번호
	public String emp_address;		// 사원주소
	public String emp_gender;		// 사원성별
	public Date   emp_hire_date;	// 사원 입사일
	public String emp_email;		// 사원 이메일
	public String emp_auth;			//권한
 	
}
