package kr.or.ddit.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ajax")
@Slf4j
public class AjaxMemberFileController {
	
	//@GetMapping(value =  "/registerFileForm") //method 속성을 포함하고 있는 Get방식 어노테이션
	//@PostMapping(value = "/registerFileForm")//method 속성을 포함하고 있는 Post방식 어노테이션
	@RequestMapping(value = "/registerFileForm", method = RequestMethod.GET)
	public String ajaxRegisterFileForm() {
		return "member/ajaxRegisterFileForm";
	}
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file){
		String originalFileName = file.getOriginalFilename();
		log.info("uploadAjax start...!");
		log.info("originalFileName: " + originalFileName);
		return new ResponseEntity<String>("UPLOAD SUCCESS", HttpStatus.OK);
	}
}
