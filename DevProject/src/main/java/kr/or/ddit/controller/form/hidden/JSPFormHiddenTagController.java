package kr.or.ddit.controller.form.hidden;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/formtag/hidden")
@Slf4j
public class JSPFormHiddenTagController {
	/*
	 * 8장 스프링 폼 태그
	 * 
	 *  숨겨진 필드 요소
	 *   - Html 숨겨진 필드를 출력하려면 <form:hidden> 요소를 사용한다.
	 */
	
	@GetMapping(value = "/registerFormHidden01")
	public String registerFormHidden01(Model model) {
		Member mem = new Member();
		mem.setUserId("asd123");
		mem.setUserName("asd");
		model.addAttribute("member", mem);
		return "form/hidden/registerFormHidden01";
	}
	
	@PostMapping(value = "/result") 
	public String registerFormHiddenResult(Member member, Model model) {
		log.info("id: " + member.getUserId());
		log.info("name: " + member.getUserName());
		model.addAttribute("member", member);
		return "form/hidden/result";
	}
}
