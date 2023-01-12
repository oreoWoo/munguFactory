package com.oracle.munguFactory.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.SecurityUserDTO;
import com.oracle.munguFactory.kws.service.EmpService;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
//DB에 담긴 사용자 인증정보와 비교하기 위해 UserDetailsService에 사용자 정보를 넘겨줌
//Security 설정에서 loginProcessingUrl("/login") 
//login 요청이 오면 자동으로 UserDetailsService Type으로 
//IOC되어 있는  loadUserByUsername Method가 실행(약속)
//Security session( 내부-> Authentication(내부->userDetails) )

public class PrincipalDetailsService implements UserDetailsService {
	
	private final EmpService empService;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("PrincipalDetailsService username : " + username);
		EmpDTO emp = empService.login(username);
		
		if(emp == null) {
			System.out.println("null");
			return null;
		}
		else{
			System.out.println("else");
			SecurityUserDTO securityUser = new SecurityUserDTO(emp.getEmp_id(), emp.getEmp_password(),"ROLE_"+emp.getAuth_name());
			return new PrincipalDetails(securityUser);
		}
	}

}
