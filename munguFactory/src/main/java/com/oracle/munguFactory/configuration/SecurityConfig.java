package com.oracle.munguFactory.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

//IoC 빈(bean)을 등록
@Configuration
@EnableWebSecurity	// 필터 체인 관리 시작 어노테이션
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true) //특정 주소 접근시 권한 및 인증
public class SecurityConfig {

	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		// csrf는 해킹기법
		http.csrf().disable();
		//인증할 시 어떤것이든 허용해주겠다
		//Authentication 인증 (내가 사용자인가 아닌가)
		//authorization 인가 (인증은 받았지만 권한을 확인)
		http.authorizeRequests().antMatchers("/user/**").authenticated()
		.antMatchers("/admin/**").access("hasRole('ROLE_admin')")
		.and().formLogin().loginPage("/loginForm").loginProcessingUrl("/login").failureUrl("/loginFail").defaultSuccessUrl("/loginSuccess")
		// authenticated -> user/**은 인증필요-->인증만되면 들어갈 수 있음
		//http.authorizeRequests().anyRequest().permitAll();
		.and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutForm").invalidateHttpSession(true).deleteCookies("JSESSIONID", "remember-me");
		http.exceptionHandling().accessDeniedPage("/denied");
		return http.build();
		
	}
	
}
