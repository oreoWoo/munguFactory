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
@RequestMapping("/user")
public class EmpController 
{
	//전체 유저의 Controller

	private final EmpService empService;
	private final DeptService deptService;
	private final PositService positService;
	private final AuthService authService;
	
	//암호화 하기 위한 객체 선언
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
	
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
		
		
		//로그인 메소드 [수정]
//		@ResponseBody
		@RequestMapping("/loginSuccess")
		public String login(@AuthenticationPrincipal PrincipalDetails principal, HttpSession session) {
			session.setAttribute("EmpDto", principal.getEmpDTO()); // 세션 적용
			System.out.println("EmpDto"+ principal.getEmpDTO());
			return "emp/admin";
		}
		
		@RequestMapping("/loginFail")
		public String loginFail(Model model) {
			model.addAttribute("msg","로그인에 실패하셨습니다.");
			return "emp/loginForm";
		}
		
		
		//일반 유저 메인 페이지 정보를 보여주는 메소드 
		@RequestMapping("/MyPageForm")
		public String myPageForm(@AuthenticationPrincipal PrincipalDetails principal, HttpSession session,Model model)
		{
			session.setAttribute("emp", principal.getEmpDTO()); // 세션 적용
			System.out.println("EmpService myPageForm Start");
			
			System.out.println("Name : "+ principal.getEmpDTO());
			
			List <DeptDTO> deptlist = (List<DeptDTO>) session.getAttribute("deptlist"); 
			List <AuthorityDTO> authlist = (List<AuthorityDTO>) session.getAttribute("authlist");
			List <PositDTO> poslist = (List<PositDTO>) session.getAttribute("poslist");
			
			model.addAttribute("deptlist",deptlist);
			model.addAttribute("authlist",authlist);
			model.addAttribute("poslist",poslist);
//			model.addAttribute("emp",emp);
			
			return "emp/userMyPageForm";
		}
		
		
		@PostMapping("/editInfo")
		public String upDateUser(@AuthenticationPrincipal PrincipalDetails principal, EmpDTO new_emp, Model model, HttpSession session)
		{
			session.setAttribute("emp", principal.getEmpDTO()); // 세션 적용
			EmpDTO emp = (EmpDTO) session.getAttribute("emp");
			System.out.println("EmpService editInfo Start");
			int result = 0;
			
			try {
				//이름 변경
				emp.setEmp_name(new_emp.getEmp_name());
				System.out.println("이름: "+new_emp.getEmp_name());
				
				//비밀번호 수정한 경우 암호화 한 후 다시 변경 
				if(emp.getEmp_password().equals(new_emp.getEmp_password()))
				{
					emp.setEmp_password(new_emp.getEmp_password());
				}
				
				else {
					String temp = new_emp.getEmp_password();
					temp = encoder.encode(temp);
					emp.setEmp_password(temp);;
				}
				System.out.println("비밀번호: "+emp.getEmp_password());
				
				//이메일 변경
				emp.setEmp_email(new_emp.getEmp_email());
				System.out.println("이메일: "+new_emp.getEmp_email());
				
				//주소 변경
				emp.setEmp_address(new_emp.getEmp_address());
				System.out.println("주소: " + new_emp.getEmp_address());
				
				//변경 사항을 반영한 update문 
				result = empService.updateEmp(emp);
				
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
			
			model.addAttribute("emp",emp);
			model.addAttribute("result",result);
			
			return "emp/userMyPageForm";
		}
		
		
		
}
