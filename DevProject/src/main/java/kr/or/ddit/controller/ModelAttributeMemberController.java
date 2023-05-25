package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/modelattribute")
public class ModelAttributeMemberController {
	
	// 3. @ModelAttribute 어노테이션
	//	-매개변수로 전달받은 데이터를 전달할 때 사용한다.
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm() {
		return "member/registerModelAttributeForm";
	}
	@PostMapping(value = "/register01")
	public String register01(String userId, String password) {
		log.info("id: "+ userId);
		log.info("pw: "+ password);
		return "result";
	}
	
	// 2) 기본 자료형인 매개변수에 @ModelAttribute 어노테이션을 지정하여 데이터를 전달한다.
	@PostMapping(value = "/register02")
	public String register02(
			@ModelAttribute("userId") String userId,
			@ModelAttribute("password") String password) {
		
		log.info("id: " + userId);
		log.info("pw: " + password);
		return "result";
	}
	
	// 3)자바빈즈 규칙에 맞는 객체는 매개변수로 선언하면 기본적으로 전달된다
	@RequestMapping(value = "/register03", method = RequestMethod.POST)
	public String register03(Member member) {
		log.info("member.userId: " + member.getUserId());
		log.info("member.password: " + member.getPassword());
		return "result";
	}
}
