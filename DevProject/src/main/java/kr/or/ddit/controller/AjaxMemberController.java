package kr.or.ddit.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/ajax")
@Slf4j
public class AjaxMemberController {
	
	// Ajax방식 요청 처리 페이지
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String ajaxRegisterForm() {
		log.info("ajaxRegisterForm start..!");
		return "member/ajaxRegisterForm";
	}
	
	//1) url 경로 상의 경로 변수값을 @PathVariable 어노테이션을 지정하여 문자열 매개변수로 처리한다.
	@RequestMapping(value = "/register/{userId}")
	public ResponseEntity<String> ajaxRegister01(@PathVariable("userId") String userId){
		log.info("userId: " + userId);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	//2) URL 경로 상의 여러개의 경로 변수값을 @PathVariable 어노테이션을 지정하여 여러개의 문자열 매개변수로 처리한다. 
	@RequestMapping(value = "/register/{userId}/{password}")
	public ResponseEntity<String> ajaxRegister02(@PathVariable("userId") String userId, @PathVariable("password") String password){
		log.info("userId: " + userId);
		log.info("password: " + password);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
}
