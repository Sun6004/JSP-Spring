package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class mainController {
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String mainForm(){
		log.info("main page start..");
		return "crudTest/form";
	}
	
	@RequestMapping(value = "/siginin.do", method = RequestMethod.GET)
	public String loginForm(){
		log.info("login page start..");
		return "crudTest/siginin";
	}

	@RequestMapping(value = "/siginup.do", method = RequestMethod.GET)
	public String signUpForm(){
		log.info("siginup page start..");
		return "crudTest/siginup";
	}
	
}
