package kr.or.ddit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);
	
	// 공지사항 게시판 목록 화면
	@GetMapping("/list")
	public String list() {
		log.info("list() 실행...!");
		return "notice/list";
	}
	
	// 공지사항 게시판 등록 화면
	@GetMapping("/register")
	public String registerForm() {
		log.info("registerForm() 실행...!");
		return "notice/register";
	}
}
