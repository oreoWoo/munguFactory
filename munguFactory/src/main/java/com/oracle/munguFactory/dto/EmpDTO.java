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
	public String   emp_hire_date;	// 사원 입사일
	public String emp_email;		// 사원 이메일
	public String emp_auth;			//권한
 	
	//조회용
	private PositDTO posit;
	private String posit_name;	//직위 이름
	
	private DeptDTO dept;
	private String dept_name;	//부서 이름
	
	private AuthorityDTO auth;
	private int auth_no;		//권한 번호
	private String auth_name;	//권한 이름
	
	private String msg; //결과 메시지
	
	private int result; //결과 상태창
}
