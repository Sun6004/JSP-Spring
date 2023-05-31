package kr.or.ddit.controller.form.validation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/formtag/validation")
@Slf4j
public class JSPFormValidationController {
	/*
	 * 8장 스프링 폼 태그
	 * 
	 *  15. 입력값 검증 에러
	 *  - 입력값 검증 에러를 출력하려면 <form:errors> 요소를 사용한다.
	 */
	
	@GetMapping(value = "/registerFormValidation01")
	public String registerFormValidation01(Model model) {
		log.info("registerFormValidation01 start...");
		model.addAttribute("member", new Member());
		return"form/validation/registerFormValidation01";
	}

	@PostMapping(value = "/result")
	public String registerFormValidationResult(Member member) {
		log.info("registerFormValidationResult start...");
		log.info("id: " + member.getUserId());
		log.info("name: " + member.getUserName());
		log.info("mail: " + member.getEmail());
		
		return"form/validation/result";
	}
}
