package kr.or.ddit.controller.form.button;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/formtag/button")
@Slf4j
public class JSPFormButtonTagController {
	
	/*
	 * 8장 스프링 폼 태그
	 * 
	 * 14. 버튼 요소
	 * - Html 버튼을 출력하려면 <form:button> 요소를 사용한다.
	 */
	@GetMapping(value = "/registerFormButton01")
	public String registerFormButton01(Model model) {
		model.addAttribute("member", new Member());
		return"form/button/registerFormButton01";
	}
}
