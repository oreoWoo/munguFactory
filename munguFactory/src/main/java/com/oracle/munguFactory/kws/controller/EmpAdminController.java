package com.oracle.munguFactory.kws.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.munguFactory.auth.PrincipalDetails;
import com.oracle.munguFactory.dto.AuthorityDTO;
import com.oracle.munguFactory.dto.DeptDTO;
import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.EmpListDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.PositDTO;
import com.oracle.munguFactory.kws.service.AuthService;
import com.oracle.munguFactory.kws.service.DeptService;
import com.oracle.munguFactory.kws.service.EmpService;
import com.oracle.munguFactory.kws.service.Paging;
import com.oracle.munguFactory.kws.service.PositService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class EmpAdminController 
{
	//전체 유저의 Controller

	private final EmpService empService;
	private final DeptService deptService;
	private final PositService positService;
	private final AuthService authService;
	
	//암호화 하기 위한 객체 선언
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		

	
	
	
	//회원 가입을 위한 유저 리스트 만들기 폼 [관리자 기능]
	@GetMapping("/makeUserList")
	public String makeUserList(Model model)
	{	
		List <DeptDTO> deptlist = new ArrayList<DeptDTO>();
		deptlist = deptService.getDeptInfo();
		
		List <AuthorityDTO> authlist = new ArrayList<AuthorityDTO>();
		authlist = authService.getAuthInfo();
		
		List <PositDTO> positlist = new ArrayList<PositDTO>();
		positlist = positService.getPosInfo();
		
		model.addAttribute("deptlist",deptlist);
		model.addAttribute("authlist",authlist);
		model.addAttribute("positlist",positlist);
		
		System.out.println("makeUserList Return 전 ... ");
		
		return "emp/makeUserList";
	}
	
	//회원 가입을 위한 유저 리스트 만들기 [관리자 기능]
	@RequestMapping("/createUserList")
	public String createUserList(Model model, EmpListDTO emplist, @RequestParam String emp_hire_date) 
	{
		System.out.println("EmpController createUserList Start");
		
		System.out.println("Emplist Hire Date:" + emp_hire_date);
		
		
		emplist.setEmp_hire_date(emp_hire_date);;
		
		int result = empService.userlistSave(emplist);
		System.out.println("유저 리스트 생성 결과: "+result);
		
		List <DeptDTO> deptlist = new ArrayList<DeptDTO>();
		deptlist = deptService.getDeptInfo();
		
		List <AuthorityDTO> authlist = new ArrayList<AuthorityDTO>();
		authlist = authService.getAuthInfo();
		
		List <PositDTO> positlist = new ArrayList<PositDTO>();
		positlist = positService.getPosInfo();
		
		model.addAttribute("deptlist",deptlist);
		model.addAttribute("authlist",authlist);
		model.addAttribute("positlist",positlist);
		
		if(result == 0)
		{
			result += 2;
		}
		
		model.addAttribute("result",result);

	
		System.out.println("createUserList 전 result의 값: "+result);
		
		return "emp/makeUserList";
	}
	
	// 가입 관리  유저 리스트 보기
	@RequestMapping("/userlist")
	public String userlist(Model model, HttpSession session, String currentPage)
	{
//		Emp emp = (Emp) session.getAttribute("emp");
		//EmpForSearch empForSearch = (EmpForSearch) session.getAttribute("empForSearch");
		System.out.println("EmpService userlist [모든 유저 조회 기능] Start");
		
		//직원 조회를 위한 리스트
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		
		PageDTO pg = new PageDTO();
		
		//전체 직원수를 체크
		int totalEmp = empService.getEmpCount();
		
		//부서 이름 조회를 위한 리스트
		List<DeptDTO> deptlist = new ArrayList<DeptDTO>();
		
		System.out.println("모든 사용자의 수 : "+ totalEmp);
		
		Paging page = new Paging(totalEmp, currentPage);
		System.out.println("page getStart ->"+page.getStart());
		System.out.println("page getEnd ->"+page.getEnd());
		pg.setStart(page.getStart());
		pg.setEnd(page.getEnd());
		
		try {
			//직원 조회 기능 수행
			emplist = empService.getAllUserInfo(pg);
			
			//부서 선택 조회 기능을 위해 부서 이름 가져오기 수행
			deptlist = deptService.getDeptInfo();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		model.addAttribute("emplist",emplist);
//		model.addAttribute("emp",emp);
		model.addAttribute("page", page);
		model.addAttribute("deptlist",deptlist);
		
		int dept_no = 0; 
		model.addAttribute("dept_no",dept_no);
		
		return "emp/userlist";
	}
	
	@RequestMapping("/userlistDeptSearch")
	public String userlistDeptSearch(@RequestParam int dept_no, Model model, HttpSession session, String currentPage)
	{
		System.out.println("Current Page: "+currentPage);
		System.out.println("dept_no: "+dept_no);
		
		if(dept_no == 0)
		{
			return userlist(model, session, currentPage);
		}
		
		System.out.println("EmpService userlist ['부서별 유저 조회 기능'] Start");
		
		//직원 조회를 위한 리스트
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		
		PageDTO pg = new PageDTO();
		
		//전체 직원수를 체크
		int totalEmp = empService.getEmpCount(dept_no);
		
		//부서 이름 조회를 위한 리스트
		List<DeptDTO> deptlist = new ArrayList<DeptDTO>();
		
		System.out.println("모든 사용자의 수 : "+ totalEmp);
		
		Paging page = new Paging(totalEmp, currentPage);
		pg.setStart(page.getStart());
		pg.setEnd(page.getEnd());
		
		try {
			//직원 조회 기능 수행
			emplist = empService.getUserInfo(pg, dept_no);
			//부서 조회 기능 수행
			deptlist = deptService.getDeptInfo();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		model.addAttribute("emplist",emplist);
//		model.addAttribute("emp",emp);
		model.addAttribute("page", page);
		model.addAttribute("deptlist",deptlist);
		model.addAttribute("dept_no",dept_no);
		
		return "emp/userlist";
	}
		
		@RequestMapping("/adminGetUserInfo")
		public String adminEditUser(@RequestParam int emp_no, Model model,HttpSession session)
		{
			
			System.out.println("EmpService adminEditUser Start");
			System.out.println("emp_no : "+emp_no);
			System.out.println("해당 사번을 가진 유저의 데이터를 가져오기");
			
			EmpDTO emp = new EmpDTO();
			try {
				emp = empService.adminGetUserInfo(emp_no);
			} catch (Exception e) {
				System.out.println("EmpService adminEditUser Error 발생" + e.getMessage());
			}
			
			/*
			 * List <Dept> deptlist = (List<Dept>) session.getAttribute("deptlist"); List
			 * <Authority> authlist = (List<Authority>) session.getAttribute("authlist");
			 * List <Position> poslist = (List<Position>) session.getAttribute("poslist");
			 * List <Status> statuslist = (List<Status>) session.getAttribute("statuslist");
			 */
			
			List <DeptDTO> deptlist = new ArrayList<DeptDTO>();
			deptlist = deptService.getDeptInfo();
			
			List <AuthorityDTO> authlist = new ArrayList<AuthorityDTO>();
			authlist = authService.getAuthInfo();
			
			List <PositDTO> poslist = new ArrayList<PositDTO>();
			poslist = positService.getPosInfo();
			
			model.addAttribute("userEmp",emp);
			model.addAttribute("deptlist",deptlist);
			model.addAttribute("authlist",authlist);
			model.addAttribute("poslist",poslist);
			
			return "emp/adminEditUserForm";
		}
		
		
		@PostMapping("/adminEditUserInfo")
		public String adminUpDateUserData(@AuthenticationPrincipal PrincipalDetails principal, EmpDTO new_emp, Model model, HttpSession session)
		{
			session.setAttribute("emp", principal.getEmpDTO()); // 세션 적용
			EmpDTO emp = (EmpDTO) session.getAttribute("emp");
			System.out.println("EmpController adminUpDateUserData Start");
			System.out.println("Emp_No : "+new_emp.getEmp_no());
			System.out.println("해당 사번을 가진 유저의 데이터를 가져오기");
			
			try {
				emp = empService.adminGetUserInfo(new_emp.getEmp_no());
			} catch (Exception e) {
				System.out.println("EmpService adminUpDateUserData Error 발생" + e.getMessage());
			}
			
			int result = 0;
			
			try {
				//이름 변경
				emp.setEmp_name(new_emp.getEmp_name());
				System.out.println("이름: "+new_emp.getEmp_name());
				
				//비밀번호 변경
				//비밀번호 수정한 경우 암호화 한 후 다시 변경 
				if(emp.getEmp_password().equals(new_emp.getEmp_password()))
				{
					emp.setEmp_password(new_emp.getEmp_password());
				} else {
					String temp = new_emp.getEmp_password();
					temp = encoder.encode(temp);
					emp.setEmp_password(temp);
				}
				System.out.println("비밀번호: "+emp.getEmp_password());
				
				//이메일 변경
				emp.setEmp_email(new_emp.getEmp_email());
				System.out.println("이메일: "+new_emp.getEmp_email());
				
				//권한 등급 변경
				emp.setAuth_no(new_emp.getAuth_no());
				System.out.println("권한 등급: "+new_emp.getAuth_no());
				
				//부서 변경
				emp.setDept_no(new_emp.getDept_no());
				System.out.println("부서: "+new_emp.getDept_no());
				
				//직책 변경
				emp.setPosit_no(new_emp.getPosit_no());
				System.out.println("직책: "+new_emp.getPosit_no());
				
				
				//주소 변경
				emp.setEmp_address(new_emp.getEmp_address());
				System.out.println("주소: " + new_emp.getEmp_address());
				
				//변경 사항을 반영한 update문 
				result = empService.updateEmpWithAdmin(emp);
				
				if(result == 1)
				{
					System.out.println("회원 정보 변경에 성공하였습니다.");
				}
				else if(result == 2)
				{
					System.out.println("회원 정보 변경에 실패하였습니다.");
				}
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			List <DeptDTO> deptlist = new ArrayList<DeptDTO>();
			deptlist = deptService.getDeptInfo();
			
			List <AuthorityDTO> authlist = new ArrayList<AuthorityDTO>();
			authlist = authService.getAuthInfo();
			
			List <PositDTO> poslist = new ArrayList<PositDTO>();
			poslist = positService.getPosInfo();
			
			
			model.addAttribute("deptlist",deptlist);
			model.addAttribute("authlist",authlist);
			model.addAttribute("poslist",poslist);
//			model.addAttribute("emp",admin_emp);세션?
			model.addAttribute("userEmp",emp);
			model.addAttribute("result",result);
			
			return "emp/adminEditUserForm";
		}
		
		
		@RequestMapping("/deleteEmpData")
		public String deleteEmpData(int emp_no, Model model, HttpSession session, String currentPage) {
			System.out.println("EmpController deleteEmpData Start");
			int result = 0;
			System.out.println("EmpService adminEditUser Start");
			System.out.println("emp_no : "+emp_no);
			System.out.println("해당 사번을 가진 유저의 데이터를 가져오기");
			
			System.out.println("EmpService userlist [모든 유저 조회 기능] Start");
			
			//직원 조회를 위한 리스트
			List<EmpDTO> emplist = new ArrayList<EmpDTO>();
			
			PageDTO pg = new PageDTO();
			
			//전체 직원수를 체크
			int totalEmp = empService.getEmpCount();
			
			//부서 이름 조회를 위한 리스트
			List<DeptDTO> deptlist = new ArrayList<DeptDTO>();
			
			System.out.println("모든 사용자의 수 : "+ totalEmp);
			
			Paging page = new Paging(totalEmp, currentPage);
			System.out.println("page getStart ->"+page.getStart());
			System.out.println("page getEnd ->"+page.getEnd());
			pg.setStart(page.getStart());
			pg.setEnd(page.getEnd());
			
			try {
				//직원 조회 기능 수행
				emplist = empService.getAllUserInfo(pg);
				
				//부서 선택 조회 기능을 위해 부서 이름 가져오기 수행
				deptlist = deptService.getDeptInfo();
				
				//삭제 기능
				result = empService.deleteEmpData(emp_no);
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
			model.addAttribute("emplist",emplist);
//			model.addAttribute("emp",emp);
			model.addAttribute("page", page);
			model.addAttribute("deptlist",deptlist);
			
			int dept_no = 0; 
			model.addAttribute("dept_no",dept_no);
			

			return "emp/userlist";
		}
		
		
}
