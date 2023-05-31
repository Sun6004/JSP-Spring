package kr.or.ddit.controller.form.password;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/formtag/password")
@Slf4j
public class JSPFormPasswordTagController {
	
	/*
	 * 8장. 스프링 폼 태그
	 * 
	 *  패스워드 필드 요소
	 *  - Html 패스워드 필드를 출력하려면 <form:password>요소를 사용한다.
	 */
	
	//1) 모델에 기본 생성자로 생성한 폼 객체를 추가한 후에 화면에 전달합니다.
	@GetMapping(value = "/registerForm01")
	public String registerForm01(Model model) {
		log.info("registerForm01 실행...");
		model.addAttribute("member", new Member());
		return "form/password/registerForm01";
		}

	@GetMapping(value = "/registerForm02")
	public String registerForm02(Model model) {
		// 값을 설정해서 뷰에 전달하더라도 패스워드 필드에 반영되지 않는다.(패스워드만 그럼)
		log.info("registerForm02 실행...");
		Member mem = new Member();
		mem.setPassword("123334");
		model.addAttribute("member", mem);
		return "form/password/registerForm01";
	}
	
}
