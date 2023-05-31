package kr.or.ddit.controller.form.label;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/formtag/label")
@Slf4j
public class JSPFormLabelTagController {
	/*
	 *  8장 스프링 폼 태그
	 *  
	 *  13. 라벨요소
	 *   - Html 라벨을 출력하려면 <form:label> 요소를 사용한다.
	 */
	@GetMapping(value = "/registerFormLabel01")
	public String registerFormlabel01(Model model) {
		model.addAttribute("member", new Member());
		return "form/label/registerFormLabel01";
	}
}
