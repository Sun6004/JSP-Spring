package com.sun.bangbang.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.bangbang.vo.TestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class SunController {
	
	@GetMapping("/") // 여기다 @RequestMapping 쓰지않음
	public String home() {
		return "home";
	}
	
	@GetMapping("/sun/{num}")
	@ResponseBody //얘가 붙으면 바로 직접 답변	
	public String restGet(@PathVariable int num){
		if(num == 1) {
			return "바보";			
		}
		return "안바보";			
	}
	// 대부분 클라이언트 <-> 값 주고 받기만 잘하자
	// 데이터 타입이 이것저것 섞이면 어쩔수 없이 모든 타입을 받을 수 있는 최상위 Object객체가 와야함.
	// 필요하다면 꺼낼 때 향(데이터타입)변환이 필요할 때도 있음.
	@PostMapping(value = "/sun", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<TestVO> restPost(@RequestBody List<TestVO> list){
		
		for (TestVO testVo : list) {
			System.out.println(testVo.getName());
			System.out.println(testVo.getAge());
			System.out.println("---------------------");
		}
		return list;
	}
	
	@PostMapping(value = "/mFile", produces = "application/json;charset=utf-8")
	@ResponseBody
	// formData를 받을 때는 @RequestBody를 사용하지 않음
	public String restFile(MultipartFile myFile) throws Exception{
		
		log.info(myFile.getOriginalFilename());
		log.info(""+myFile.getSize());
		
		String destPath = "d:/upload/" + myFile.getOriginalFilename();
		
		myFile.transferTo(new File(destPath));
		
		return "/upload/"+ myFile.getOriginalFilename();
	}

	@PutMapping(value = "/sun", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<TestVO> restPut(@RequestBody List<TestVO> list){
		
		for (TestVO testVo : list) {
			System.out.println(testVo.getName());
			System.out.println(testVo.getAge());
			System.out.println("---------------------");
		}
		return list;
	}

	@DeleteMapping(value = "/sun", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<TestVO> restDel(@RequestBody List<TestVO> list){
		
		for (TestVO testVo : list) {
			System.out.println(testVo.getName());
			System.out.println(testVo.getAge());
			System.out.println("---------------------");
		}
		return list;
	}
}
