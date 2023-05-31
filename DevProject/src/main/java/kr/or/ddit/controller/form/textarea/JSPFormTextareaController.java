package kr.or.ddit.controller.form.textarea;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/formtag/textarea")
@Slf4j
public class JSPFormTextareaController {
	
		/*
		 * 8장. 스프링 폼 태그
		 * 
		 *  텍스트 영역 요소(textarea)
		 *   - Html 텍스트 영역을 출력하려면 <form:textarea>요소를 사용한다.
		 */
	@GetMapping(value = "/registerForm01")
	public String registerForm01(Model model) {
		model.addAttribute("member", new Member());
		return "form/textarea/registerForm01";
	}

	@GetMapping(value = "/registerForm02")
	public String registerForm02(Model model) {
		Member mem = new Member();
		mem.setIntroduction("hihihihihihihi~ \n hello~~~~~~~~~~~~~~~~~~~~~");
		model.addAttribute("member", mem);
		return "form/textarea/registerForm01";
	}
}
