package kr.or.ddit.controller.form.radio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.CodeLabelValue;
import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/formtag/radio")
@Slf4j
public class JSPFormRadioTagController {
	/*
	 * 8장 스프링 폼 태그
	 * 
	 *  여러 개의 라디오 버튼 요소
	 *   - Html 라디오 버튼을 출력하려면 <form:radiobuttion> 요소를 사용한다.
	 */
	// 1) 모델에 map 타입의 데이터를 생성하여 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerFormRadios01")
	public String registerFormRadios01(Model model) {
		Map<String, String> genderCodeMap = new HashMap<String, String>();
		genderCodeMap.put("01", "male");
		genderCodeMap.put("02", "female");
		genderCodeMap.put("03", "other");
		
		model.addAttribute("genderCodeMap", genderCodeMap);
		model.addAttribute("member", new Member());
		return "/form/radio/registerFormRadios01";
	}
	
	// 모델에 List 타입의 데이터를 생성하여 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerFormRadios02")
	public String registerFormRadios02(Model model) {
		List<CodeLabelValue> genderList = new ArrayList<CodeLabelValue>();
		genderList.add(new CodeLabelValue("01", "male"));
		genderList.add(new CodeLabelValue("02", "female"));
		genderList.add(new CodeLabelValue("03", "gay"));
		
		model.addAttribute("genderList", genderList);
		model.addAttribute("member", new Member());
		return "/form/radio/registerFormRadios02";
	}

	@PostMapping(value = "/result")
	public String registerFormRadioResult(Member member ,Model model) {
		log.info("member.gender: " + member.getGender());
		
		model.addAttribute("gender", member.getGender());
		model.addAttribute("member", new Member());
		return "/form/radio/result";
	}
	
	// 여기서 부터는 단일 radio 버튼입니다
	
	/*
	 * 라디오 버튼 요소
	 *  - Html 라디오 버튼을 출력하려면 <form:radiobutton> 요소를 사용한다.
	 */
	// 1) 모델에 기본 생성자로 생성한 폼 객체를 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerFormRadio01")
	public String registerFormRadio01(Model model) {
		model.addAttribute("member", new Member());
		return "form/radio/registerFormRadio01";
	}
	
	// 2) 객체를 생성하여 값을 설정한 후에 화면으로 전달한다.
	@GetMapping(value = "/registerFormRadio02")
	public String registerFormRadio02(Model model) {
		Member mem = new Member();
		mem.setGender("female");
		model.addAttribute("member", mem);
		return "form/radio/registerFormRadio01";
	}
	
}
