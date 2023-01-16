package com.oracle.munguFactory.kws.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
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
public class MainController 
{
	//전체 유저의 Controller

	private final EmpService empService;
	//암호화 하기 위한 객체 선언
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		
		////////////////////////////로그인 성공여부/////////////////////
	//로그인 메소드 [수정]
//		@ResponseBody
	@RequestMapping("/loginSuccess")
	public String login(@AuthenticationPrincipal PrincipalDetails principal, HttpSession session) {
		session.setAttribute("EmpDto", principal.getEmpDTO()); // 세션 적용
		System.out.println("EmpDto"+ principal.getEmpDTO());
		return "emp/admin";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("msg","로그인에 실패하셨습니다.");
		return "main/home";
	}
	
	@RequestMapping("/loginFail")
	public String loginFail(Model model) {
		model.addAttribute("msg","로그인에 실패하셨습니다.");
		return "emp/loginForm";
	}
		
		
		
	////////////////////////////로그인 회원가입 아이디 찾기/////////////////////
	//로그인 뷰 출력
	@GetMapping("/loginForm")
	public String loginForm() 
	{
		return "/emp/loginForm";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/")
	public String goHome() {
		return "redirect:/loginSuccess";
	}
	
	@GetMapping("/signUp")
	public String signUp() {
		System.out.println("signUp 이거 타는거 맞음?");
		return "emp/signUp";
	}
	
	//아이디, 비밀번호 찾기 뷰 출력
	@GetMapping("/findIdPwForm")
	public String findIdPwForm() 
	{
		return "emp/findIdPwForm";
	}
	
	//////////////////////////////////////아이디, 비번 찾기//////////////////////////////
	//아이디 찾기 메소드 [AJAX]
	@ResponseBody
	@RequestMapping("/findId")
	public EmpDTO findId(@RequestParam int emp_no, @RequestParam String emp_name, @RequestParam String emp_email) 
	{
		System.out.println("EmpService login Start");
		EmpDTO emp = new EmpDTO();
		
		System.out.println("Parameter Test 1 Num : "+emp_no);
		System.out.println("Parameter Test 2 Name : "+emp_name);
		System.out.println("Parameter Test 3 Email: "+emp_email);
		
		try {
			emp = empService.getInfo(emp_no); //찾기를 원하는 아이디의 사번을 가져온다.
			System.out.println("쿼리문 실행 후 ");
			
			//찾으려는 사번에 해당하는 유저의 이름과 이메일 일치한 경우 
			if(emp_name.equals(emp.getEmp_name()) && emp_email.equals(emp.getEmp_email()))
			{
				System.out.println("정보가 모두 일치 되었습니다.");
				System.out.println("당신의 아이디는 " + emp.getEmp_id() + " 입니다.");
				emp.setMsg(emp.getEmp_name()+"의 아이디는 "+emp.getEmp_id()+" 입니다."); //결과 메시지에 저장한다.
				emp.setResult(1); //결과 값을 저장한다.
			} else { 
				System.out.println("정보가 일치하지 않습니다."); //찾으려는 사번에 해당하는 유저의 이름과 이메일 일치하지 않은 경우 
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return emp;
	}
	
	//비밀번호 찾기 메소드 [AJAX]
	@ResponseBody
	@RequestMapping("/findPw")
	public EmpDTO findPw(@RequestParam int emp_no, @RequestParam String emp_name, @RequestParam String emp_id, @RequestParam String emp_email) 
	{
		System.out.println("EmpService login Start");
		EmpDTO emp = new EmpDTO();
		
		//파라미터 확인을 위한 로그
		System.out.println("Parameter Test 1 Num : "+ emp_no);
		System.out.println("Parameter Test 2 Name : "+ emp_name);
		System.out.println("Parameter Test 3 Email: "+ emp_email);
		System.out.println("Parameter Test 4 Id: "+ emp_id);
		
		try {
			//사번에 해당하는 유저 정보를 호출한다. 
			emp = empService.getInfo(emp_no);
			
			// 이름 & 이메일 & 아이디를 찾아온 사번에 유저 정보와 일치한 경우
			if(emp_name.equals(emp.getEmp_name()) && emp_email.equals(emp.getEmp_email()) && emp_id.equals(emp.getEmp_id()) )
			{
				System.out.println("정보가 모두 일치 되었습니다.");
				System.out.println("당신의 아이디는 " + emp.getEmp_id() + " 입니다.");
				emp.setMsg("비밀 번호를 수정합니다. <br><h5>비밀 번호를 입력해주세요</h5></br>"); //결과 메시지를 저장한다.
				emp.setResult(1); //결과 값을 저장한다.
			}
			else { // 일치하지 않은 경우
				System.out.println("정보가 일치하지 않습니다.");
				emp = new EmpDTO();
				emp.setMsg("비밀번호 찾기에 실패하셨습니다.");
				emp.setResult(0);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return emp;
	}
	
	@ResponseBody
	@RequestMapping("/changePw") //비밀번호 찾기에 비밀번호 변동이 생긴 경우  [AJAX]
	public int changePw(@RequestParam String emp_password, @RequestParam int emp_no)
	{
		int result = 0;
		System.out.println("EmpService changePw Start");
		
		System.out.println("emp_num : "+ emp_no);
		System.out.println("emp_passwd : "+emp_password);
		
		EmpDTO emp = new EmpDTO();
		try {
			emp = empService.getInfo(emp_no); //해당 사번의 정보 가져오기
			emp.setResult(1);
			System.out.println("암호화된 비밀번호: "+encoder.encode(emp_password));
			emp.setEmp_password(encoder.encode(emp_password)); //새로 입력값으로 받아온 비밀번호 암호화
			result = empService.changePw(emp.getEmp_password(),emp_no); //비밀번호 변동에 대한 결과값 저장
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			emp.setResult(0);
		}
		
		
		return result;
	}
	
	
	//////////////////////////////////////회원가입//////////////////////////////
	@PostMapping("/empSignUp" )
	public String empSignUp(EmpDTO emp, @RequestParam int posit_no, @RequestParam int auth_no, @RequestParam int dept_no,@RequestParam String emp_hire_date)
	{
		System.out.println("EmpController empSignUp Start");
		System.out.println("posit_no->"+posit_no);
		System.out.println("auth_no->"+auth_no);
		System.out.println("dept_no->"+dept_no);
		
		

		PositDTO posit = new PositDTO(); //직책 
		posit.setPosit_no(posit_no);
		emp.setPosit_no(posit_no);
		System.out.println("getPosit_no->"+emp.getPosit_no());
		

		AuthorityDTO authority = new AuthorityDTO(); //계정 권한
		authority.setAuth_no(auth_no);
		emp.setAuth(authority);
		emp.setAuth_no(auth_no);
		System.out.println("getAuth_no->"+emp.getAuth_no());
		

		DeptDTO dept = new DeptDTO(); //부서
		dept.setDept_no(dept_no);
		emp.setDept(dept);
		emp.setDept_no(dept_no);
		System.out.println("setDept_no->"+emp.getDept_no());
		
		
		System.out.println("EmpController EnCrypt Start");
		System.out.println("getEmp_hire_date->"+emp.getEmp_hire_date());
		emp.setEmp_hire_date(emp_hire_date);
		
		String securePassword = encoder.encode(emp.getEmp_password()); //비밀 번호 암호화 작업
		emp.setEmp_password(securePassword);
		
		System.out.println("암호화된 비밀번호: "+securePassword);
		 
		System.out.println("EmpController empSave Start...");
		int result = empService.empSignUp(emp);
		 
		if (result>0) //저장이 성공한 경우
		{
			System.out.println("Emp 테이블 직원 저장 완료");
		}
		else //저장이 실패한 경우 
		{
			System.out.println("Emp 테이블 직원 저장 실패");
		}
		return "emp/loginForm";
	}
	
	//회원가입 아이디 중복여부 확인
	@ResponseBody
	@PostMapping("/checkEmpId")
	public int checkEmpId(String emp_id) {
		System.out.println("empController checkEmpId Start");
		int result = empService.checkEmpId(emp_id);
		String check = "";
		
		if(result > 0) //아이디가 중복되는 경우
		{
			check = "중복";
		}
		else	//아이디가 중복되지 않는 경우 
		{
			check = "사용 가능";
		}
		
		System.out.println(check); //로그용 메시지 출력 
		
		
		return result;
	}
	
	//해당 사번을 가진 계정이 존재하는 지 확인하기 위한 메소드 [AJAX]
		@ResponseBody
		@PostMapping("/checkSignEmp")
		public int checkSignEmp(int emp_no)
		{
			System.out.println("EmpService checkSignEmp Start");
			int result = empService.checkSignEmp(emp_no);
			String res = "";
			
			if(result > 0)
			{
				res = "이미 계정이 존재";
			}
			else {
				res = "회원  가입 가능";
			}
			
			System.out.println(res);
			
			return result;
		}
		
	
	//미리 저장된 사원 정보와 비교를 통해서 회원 가입을 생성할 수 있는 여부를 확인하기 위한 메소드 [AJAX]
			@ResponseBody
			@PostMapping("/getEmpData")
			public EmpListDTO getEmpData(int emp_no, String emp_name)
			{
				System.out.println("EmpService getEmpData Start");
				System.out.println("emp_no : "+emp_no);
				System.out.println("Emp_name : "+emp_name);
				
				EmpListDTO emplist = new EmpListDTO();
				
				try {
					emplist = empService.getEmpData(emp_no);
					System.out.println("emplist Emp_no : "+emplist.getEmp_no());
					System.out.println("emplist Emp_name : "+emplist.getEmp_name());
					System.out.println("emplist 권한: " + emplist.getAuth_no());
					
					if(emplist.getEmp_name().equals(emp_name)) //사원 리스트에 [사번&이름]이 일치한 경우 [가입 가능]
					{
						System.out.println("사용자 확인 성공");
						emplist.setMsg("사원 조회에 성공했습니다.");
						emplist.setResult(1);
					}
					else { 									//사원 리스트에 [사번&이름]이 일치하지 못한 경우 [가입 불가능]
						System.out.println("사용자 확인 실패");
						emplist.setMsg("사원 조회에 실패했습니다.");
						emplist.setResult(0);
					}
				} catch (Exception e) //사원 리스트에 [사번&이름]이 일치하지 못한 경우 예외 [가입 불가능]
				{
					System.out.println(e.getMessage());
					emplist = new EmpListDTO();
					System.out.println("사용자 확인 실패");
					emplist.setMsg("사원 조회에 실패했습니다.");
					emplist.setResult(0);
				}
				
				return emplist;
			}
			
		
	

		
		

		
		
}
