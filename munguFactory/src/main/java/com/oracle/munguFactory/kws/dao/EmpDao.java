package com.oracle.munguFactory.kws.dao;

import java.util.List;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.EmpListDTO;
import com.oracle.munguFactory.dto.PageDTO;


public interface EmpDao {

	int empSignUp(EmpDTO emp);

	int checkEmpId(String emp_id);

	int emplistSave(EmpListDTO emplist);

	int checkSignEmp(int emp_no);

	List<EmpDTO> getAllUserInfo();

	List<EmpDTO> getAllUserInfo(PageDTO pg);

	List<EmpDTO> getAllUserInfo(int dept_no);

	List<EmpDTO> getUserInfo(PageDTO pg, int dept_no);

	EmpListDTO getEmpData(int emp_no);

	EmpDTO login(String emp_id);

	EmpDTO adminGetUserInfo(int emp_no);

	int updateEmpWithAdmin(EmpDTO emp);

	EmpDTO getInfo(int emp_no);

	int changePw(String emp_password, int emp_no);

	int updateEmp(EmpDTO emp);

	int deleteEmpData(int emp_no);


}
