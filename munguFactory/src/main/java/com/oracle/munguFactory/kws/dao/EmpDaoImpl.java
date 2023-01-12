package com.oracle.munguFactory.kws.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.EmpListDTO;
import com.oracle.munguFactory.dto.PageDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class EmpDaoImpl implements EmpDao {
	// Mybatis DB 연동 
	private final SqlSession session;

	@Override
	public int empSignUp(EmpDTO emp) {
		int result = 0;
		try {
			System.out.println("EmpDaoImpl empSave Start");
			System.out.println("test getEmp_address: " + emp.getEmp_address());
			System.out.println("test getEmp_auth: " + emp.getEmp_auth());
			System.out.println("test getEmp_email: " + emp.getEmp_email());
			System.out.println("test getEmp_gender: " + emp.getEmp_gender());
			System.out.println("test getEmp_id: " + emp.getEmp_id());
			System.out.println("test getEmp_name: " + emp.getEmp_name());
			System.out.println("test getEmp_num: " + emp.getEmp_no());
			System.out.println("test getEmp_password: " + emp.getEmp_password());
			System.out.println("test getEmp_hire_date: " + emp.getEmp_hire_date());
			result = session.insert("wsEmpInsert", emp);
			result++;
		} catch (Exception e) {
			System.out.println("EmpDaoImpl empSave Error: " + e.getMessage());
		}
		return result;
	}

	@Override
	public int checkEmpId(String emp_id) {
		System.out.println("EmpDaoImpl checkEmpId Start");
		System.out.println("EmpDaoImpl emp_id : " + emp_id);
		
		int result = 0;
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		
		try {
			emplist = session.selectList("checkEmpId" ,emp_id);
			result = emplist.size();
			System.out.println("checkEmpId 쿼리문 결과 값: " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}

	@Override
	public int emplistSave(EmpListDTO emplist) {
		int result = 0;
		try {
				System.out.println("사번: "	+emplist.getEmp_no());
				System.out.println("이름: "	+emplist.getEmp_name());
				System.out.println("부서: "	+emplist.getDept_no());
				System.out.println("직급: "	+emplist.getPosit_no());
				System.out.println("입사일: "	+emplist.getEmp_hire_date());
				System.out.println("권한: "	+emplist.getAuth_no());

			result = session.insert("emplistSave",emplist);
			System.out.println("직원 리스트 생성 결과: " + result);
			
		} catch (Exception e) {
			System.out.println("EmpDaoImpl emplistSave 에러 발생:"+e.getMessage());
		}
		return result;
	}

	@Override
	public int checkSignEmp(int emp_no) {
		System.out.println("EmpDaoImpl checkSignEmp Start");
		System.out.println("EmpDaoImpl emp_num : " + emp_no);
		
		int result = 0;
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		
		try {
			emplist = session.selectList("empListchk", emp_no);
			result = emplist.size();
			System.out.println("checkSignEmp 쿼리문 결과 값: " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}

	@Override
	public List<EmpDTO> getAllUserInfo() {
		System.out.println("EmpDaoImpl getAllUserInfo Start");
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		try {
			emplist = session.selectList("getAllUserInfo_All");
			System.out.println("EmpDaoImpl emplist.size: " + emplist.size());
		} catch (Exception e) {
			System.out.println("Error Occurred " + e.getMessage());
		}
		
		return emplist;
	}

	@Override
	public List<EmpDTO> getAllUserInfo(PageDTO pg) {
		System.out.println("EmpDaoImpl getAllUserInfo PG Start");
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		try {
			System.out.println("getStart ->"+pg.getStart());
			System.out.println("getEnd ->"+pg.getEnd());
			pg.setStart((pg.getStart()-1)*10);
			System.out.println("getStart ->"+pg.getStart());
			emplist = session.selectList("getAllUserInfo_Paging",pg);
			System.out.println("EmpDaoImpl emplist.size: " + emplist.size());
		} catch (Exception e) {
			System.out.println("Error Occurred " + e.getMessage());
		}
		
		return emplist;
	}

	@Override
	public List<EmpDTO> getAllUserInfo(int dept_no) {
		System.out.println("EmpDaoImpl getAllUserInfo dept_no Start");
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		try {
			emplist = session.selectList("getUserInfo_deptnum",dept_no);
			System.out.println("EmpDaoImpl emplist.size: " + emplist.size());
		} catch (Exception e) {
			System.out.println("Error Occurred " + e.getMessage());
		}
		
		return emplist;
	}

	@Override
	public List<EmpDTO> getUserInfo(PageDTO pg, int dept_no) {
		System.out.println("EmpDaoImpl getAllUserInfo pg dept_no Start");
		
		System.out.println("getStart ->"+pg.getStart());
		System.out.println("getEnd ->"+pg.getEnd());
		
		pg.setStart((pg.getStart()-1)*10);
		System.out.println("getStart ->"+pg.getStart());
		
		Map<String, Object> map = new HashMap();
		map.put("start", pg.getStart());
		map.put("dept_no", dept_no);
		
		System.out.println("map->"+map);
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		try {
			emplist = session.selectList("getAllUserInfo_Paging_Deptnum",map);
			System.out.println("EmpDaoImpl emplist.size: " + emplist.size());
		} catch (Exception e) {
			System.out.println("Error Occurred " + e.getMessage());
		}
		
		return emplist;
	}

	@Override
	public EmpListDTO getEmpData(int emp_no) {
		EmpListDTO emplist = new EmpListDTO();
		System.out.println("EmpDaoImpl getEmpData Start");
		
		try {
			System.out.println("emp_no->"+ emp_no);
			emplist = session.selectOne("chkEmpData", emp_no);
			System.out.println("emplist->"+ emplist);
		} catch (Exception e) {
			System.out.println("EmpDaoImpl getEmpData 에러 발생"+ e.getMessage());
		}
		return emplist;
	}

	@Override
	public EmpDTO login(String emp_id) {
		EmpDTO emp = new EmpDTO();
		
		try {
			System.out.println("emp_id->"+ emp_id);
			
			emp = session.selectOne("chkLogin", emp_id);
			
			System.out.println("emp->"+emp);
		} catch (Exception e) {
			System.out.println("EmpDaoImpl login 에러 발생"+ e.getMessage());
		}
		
		return emp;
	}

	@Override
	public EmpDTO adminGetUserInfo(int emp_no) {
		EmpDTO emp = new EmpDTO();
		System.out.println("EmpDaoImpl adminGetUserInfo Start");
		try {
			emp = session.selectOne("getUserInfo", emp_no);
			System.out.println("getUserInfo Emp의 이름:" + emp.getEmp_name());
		} catch (Exception e) {
			System.out.println("EmpDaoImpl adminGetUserInfo 에러 발생:"+e.getMessage());
		}
		
		return emp;
	}

	@Override
	public int updateEmpWithAdmin(EmpDTO emp) {
		int result = 0;
		try {
			result = session.update("updateEmpInfoWithAdmin",emp);
			System.out.println("Update 결과 값:"+result);
		}catch (Exception e) {
			System.out.println("Error Occurred " + e.getMessage());
		}
		
		return result;
	}

	@Override
	public EmpDTO getInfo(int emp_no) {
		System.out.println("EmpDaoImpl getInfo Start");
		
		EmpDTO emp = new EmpDTO();
		
		try {
			emp = session.selectOne("getUserInfo", emp_no);
			if (emp == null) {
				emp = new EmpDTO();
				emp.setResult(0);
				emp.setMsg("아이디 찾기에 실패하셨습니다.");
			} 
		} catch (Exception e) {
			System.out.println("EmpDaoImpl getInfo 에러 발생" + e.getMessage());
		}
		System.out.println("결과 값: "+ emp.getEmp_name());
		return emp;
	}

	@Override
	public int changePw(String emp_password, int emp_no) {
		int result = 0;
		
		Map<String, Object> map = new HashMap();
		map.put("emp_password", emp_password);
		map.put("emp_no", emp_no);
		
		System.out.println("map->"+map);
		
		try {
			result = session.update("changePw", map);
		} catch (Exception e) {
			System.out.println("EmpDaoImpl changePw 에러 발생"+ e.getMessage());
		}
		return result;
	}



}
