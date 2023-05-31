package kr.or.ddit.controller.form.selectbox;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.vo.CodeLabelValue;
import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;
import sun.util.logging.resources.logging;

@Controller
@RequestMapping(value = "/formtag/selectbox")
@Slf4j
public class JSPFormSelectboxTagController {
	/*
	 * 8장. 스프링 폼 태그
	 * 
	 * 셀렉트 박스 요소
	 *  - Html 셀렉트 박스를 출력하려면 <form:select>요소를 사용한다.
	 */
	// 모델에 Map타입의 데이터를 생성하여 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerFormSelectbox01")
	public String registerFormSelectbox01(Model model) {
		Map<String, String> nationalityCodeMap = new HashMap<String, String>();
		nationalityCodeMap.put("01", "korea");
		nationalityCodeMap.put("02", "Canada");
		nationalityCodeMap.put("03", "USA");
		
		model.addAttribute("nationalityCodeMap", nationalityCodeMap);
		model.addAttribute("member", new Member());
		return "form/selectbox/registerFormSelectbox01";
	}

	// 모델에 List 타입의 데이터를 생성하여 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerFormSelectbox02")
	public String registerFormSelectbox02(Model model) {
		List<CodeLabelValue> nationalityList = new ArrayList<CodeLabelValue>();
		nationalityList.add(new CodeLabelValue("01", "korea"));
		nationalityList.add(new CodeLabelValue("02", "canada"));
		nationalityList.add(new CodeLabelValue("03", "Austrailia"));
		
		model.addAttribute("nationalityList",nationalityList );
		model.addAttribute("member", new Member());
		return "form/selectbox/registerFormSelectbox02";
	}

	// 
	@GetMapping(value = "/registerFormSelectbox03")
	public String registerFormSelectbox03(Model model) {
		List<CodeLabelValue> carCodeList = new ArrayList<CodeLabelValue>();
		carCodeList.add(new CodeLabelValue("01","BMW"));
		carCodeList.add(new CodeLabelValue("02","Audi"));
		carCodeList.add(new CodeLabelValue("03","Benz"));
		
		model.addAttribute("carCodeList", carCodeList);
		model.addAttribute("member", new Member());
		return "form/selectbox/registerFormSelectbox03";
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public String registerFormSelectboxResult(Model model, Member member) {
		log.info("nationlity: " + member.getNationality());
		model.addAttribute("nationlity", member.getNationality());
		return "form/selectbox/result";
	}
}
