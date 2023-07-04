package com.sun.test.silver.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // Controller + responseBody
public class TestController {
	
	@GetMapping("/test")
	//@ResponseBody @RestController 덕분에 안써도됨!
	public String getTest() {
		log.info("h");
		return "테스트!";
	}
}
