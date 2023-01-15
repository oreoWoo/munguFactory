package com.oracle.munguFactory.kws.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.EmpListDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.kws.dao.EmpDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpService {
	private final EmpDao ed;
	
	public int empSignUp(EmpDTO emp) 
	{
		System.out.println("EmpService empSave Start");
		int result = ed.empSignUp(emp);
		return result;
	}

		public int checkEmpId(String emp_id) {
		System.out.println("EmpService empSave Start");
		int result = ed.checkEmpId(emp_id);
		return result;
	}

		public int userlistSave(EmpListDTO emplist) {
			System.out.println("EmpService userlistSave Start");
			int result = 0;
			try {
				result = ed.emplistSave(emplist);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return result;
		}

		public int checkSignEmp(int emp_num) {
			System.out.println("EmpService checkSignEmp Start");
			int result = ed.checkSignEmp(emp_num);
			return result;
		}

		public int getEmpCount() {
			int count = 0;
			System.out.println("EmpService getEmpCount Start");
			List<EmpDTO> emplist = new ArrayList<EmpDTO>();
			try {
				emplist = ed.getAllUserInfo();
				count = emplist.size();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return count;
		}

		public List<EmpDTO> getAllUserInfo(PageDTO pg) {
			System.out.println("EmpService getAllUserInfo Start");
			List<EmpDTO> emplist = new ArrayList<EmpDTO>();
			try {
				emplist = ed.getAllUserInfo(pg);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return emplist;
		}

		public int getEmpCount(int dept_no) {
			int count = 0;
			System.out.println("EmpService getEmpCount Start");
			List<EmpDTO> emplist = new ArrayList<EmpDTO>();
			try {
				emplist = ed.getAllUserInfo(dept_no);
				count = emplist.size();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return count;
		}

		public List<EmpDTO> getUserInfo(PageDTO pg, int dept_no) {
			System.out.println("EmpService getUserInfo Start");
			List<EmpDTO> emplist = new ArrayList<EmpDTO>();
			try {
				emplist = ed.getUserInfo(pg,dept_no);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return emplist;
		}

		public EmpListDTO getEmpData(int emp_no) {
			System.out.println("EmpService getEmpData Start");
			EmpListDTO empList = ed.getEmpData(emp_no);
			return empList;
		}

		public EmpDTO login(String emp_id) {
			System.out.println("EmpService login Start");
			EmpDTO emp = new EmpDTO();
			try {
				emp = ed.login(emp_id);
			} catch (Exception e) {
				System.out.println("login error" + e.getMessage());
			}
			
			return emp;
		}

		public EmpDTO adminGetUserInfo(int emp_no) {
			System.out.println("EmpService adminGetUserInfo Start");
			EmpDTO emp = new EmpDTO();
			try {
				emp = ed.adminGetUserInfo(emp_no);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return emp;
		}

		public int updateEmpWithAdmin(EmpDTO emp) {
			System.out.println("EmpService updateEmpWithAdmin Start");
			int result = 0;
			try {
				result = ed.updateEmpWithAdmin(emp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return result;
		}

		public EmpDTO getInfo(int emp_no) {
			System.out.println("EmpService getInfo Start");
			EmpDTO emp = new EmpDTO();
			
			try {
				emp = ed.getInfo(emp_no);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return emp;
		}

		public int changePw(String emp_password, int emp_no) {
			System.out.println("EmpService changePw Start");
			System.out.println("EmpService changePw emp_passwd: "+emp_password);
			System.out.println("EmpService changePw emp_num: "+emp_no);
			int result = 0;
			try {
				result = ed.changePw(emp_password, emp_no);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return result;
		}

		public int updateEmp(EmpDTO emp) {
			System.out.println("EmpService updateEmp Start");
			int result = 0;
			try {
				result = ed.updateEmp(emp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return result;
		}

		public int deleteEmpData(int emp_no) {
			int result = 0;
			result = ed.deleteEmpData(emp_no);
			return result;
		}

}
