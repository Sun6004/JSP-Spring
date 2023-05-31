package kr.or.ddit.controller.form.checkboxes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.CodeLabelValue;
import kr.or.ddit.vo.Member;


@Controller
@RequestMapping("/formtag/checkboxes")
public class JSPFormCheckboxesTagController {
	
	/*
	 *  8. 스프링 폼 태그
	 *  
	 *   여러 개의 체크박스 요소
	 *   - Html 여러개의 체크박스를 출력하려면 <form:checkboxes>요소를 사용한다.
	 */
	
	// 1) 모델에 map 타입의 데이터를 생성하여 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerForm01")
	public String registerForm01(Model model) {
		
		Map<String, String> hobbyMap = new HashMap<String, String>();
		hobbyMap.put("01", "sports");
		hobbyMap.put("02", "music");
		hobbyMap.put("03", "movie");
		model.addAttribute("hobbyMap", hobbyMap);
		model.addAttribute("member", new Member());
		return "form/checkboxes/registerForm01";
	}

	// 2) 모델에 List타입의 데이터를 생성하여 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerForm02")
	public String registerForm02(Model model) {
		List<CodeLabelValue> hobbyList = new ArrayList<CodeLabelValue>();
		hobbyList.add(new CodeLabelValue("01","sport"));
		hobbyList.add(new CodeLabelValue("02","music"));
		hobbyList.add(new CodeLabelValue("03","movie"));
		
		model.addAttribute("hobbyList", hobbyList);
		model.addAttribute("member", new Member());
		return "form/checkboxes/registerForm02";
	}
}
