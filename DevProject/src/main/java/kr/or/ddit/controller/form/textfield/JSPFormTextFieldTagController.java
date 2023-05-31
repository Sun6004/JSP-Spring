package kr.or.ddit.controller.form.textfield;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/formtag/textfield")
@Slf4j
public class JSPFormTextFieldTagController {

	/*
	 *  4. 텍스트 필드 요소
	 *  - Html 텍스트 필드를 출력하려면 <form:input> 요소를 사용한다.
	 */
	// 1) 모델에 기본 생성자로 생성한 폼 객체를 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerForm01")
	public String registerForm01(Model model) {
		model.addAttribute("member", new Member());
		return "form/textfield/registerForm01";
	}

	@GetMapping(value = "/registerForm02")
	public String registerForm02(Model model) {
		Member member = new Member();
		member.setUserId("a123");
		member.setUserName("ㅁㄴㅇ");
		member.setEmail("zxc@zxc.com");
		model.addAttribute("member", member);
		return "form/textfield/registerForm01";
	}
}
