package com.oracle.munguFactory.home.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.munguFactory.dto.AuthorityDTO;
import com.oracle.munguFactory.dto.DeptDTO;
import com.oracle.munguFactory.dto.EmpDTO;
import com.oracle.munguFactory.dto.PositDTO;
import com.oracle.munguFactory.kws.service.EmpService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	@GetMapping(value = "/accordion")
	public String goAccordian() {
		return "example/ui-accordian";
	}
	
	@GetMapping(value = "/alerts")
	public String goAlerts() {
		return "example/ui-alerts";
	}
	
	@GetMapping(value = "/badges")
	public String goBadges() {
		return "example/ui-badges";
	}
	
	@GetMapping(value = "/buttons")
	public String goButtons() {
		return "example/ui-buttons";
	}
	
	@GetMapping(value = "/collapse")
	public String goCollapse() {
		return "example/ui-collapse";
	}
	
	@GetMapping(value = "/dropdowns")
	public String goDropdowns() {
		return "example/ui-dropdowns";
	}
	
	@GetMapping(value = "/list-groups")
	public String goListGroups() {
		return "example/ui-list-groups";
	}
	
	@GetMapping(value = "/modals")
	public String goModals() {
		return "example/ui-modals";
	}
	
	@GetMapping(value = "/navbar")
	public String goNavbar() {
		return "example/ui-navbar";
	}
	
	@GetMapping(value = "/pagination-breadcrumbs")
	public String goPagination() {
		return "example/ui-pagination-breadcrumbs";
	}
	
	@GetMapping(value = "/progress")
	public String goProgress() {
		return "example/ui-progress";
	}
	
	@GetMapping(value = "/spinners")
	public String goSpinners() {
		return "example/ui-spinners";
	}
	
	@GetMapping(value = "/tabs-pills")
	public String goTabs() {
		return "example/ui-tabs-pills";
	}
	
	@GetMapping(value = "/tooltips-popovers")
	public String goTooltips() {
		return "example/ui-tooltips-popovers";
	}
	
	@GetMapping(value = "/typography")
	public String goTypo() {
		return "example/ui-typography";
	}
	
	@GetMapping(value = "/forms-basic-inputs")
	public String goBasicInputs() {
		return "example/forms-basic-inputs";
	}
	
	@GetMapping(value = "/forms-input-groups")
	public String goInputGroups() {
		return "example/forms-input-groups";
	}
	
	@GetMapping(value = "/form-layouts-vertical")
	public String goVertical() {
		return "example/form-layouts-vertical";
	}
	
	@GetMapping(value = "/form-layouts-horizontal")
	public String goHorizontal() {
		return "example/form-layouts-horizontal";
	}
	
	@GetMapping(value = "/tables-basic")
	public String goTableBasic() {
		return "example/tables-basic";
	}
	
	@GetMapping(value = "/auth-login-basic")
	public String goLoginBasic() {
		return "blank/auth-login-basic";
	}
	
	@GetMapping(value = "/auth-register-basic")
	public String goRegisterBasic() {
		return "blank/auth-register-basic";
	}
	
	@GetMapping(value = "/auth-forgot-password-basic")
	public String goForgotPw() {
		return "blank/auth-forgot-password-basic";
	}
}
