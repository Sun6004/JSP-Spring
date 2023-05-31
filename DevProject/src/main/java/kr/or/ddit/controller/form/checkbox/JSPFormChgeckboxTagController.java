package kr.or.ddit.controller.form.checkbox;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/formtag/checkbox")
@Slf4j
public class JSPFormChgeckboxTagController {
	/*
	 *  8장 스프링 폼 태그
	 *  
	 *  체크박스 요소
	 *   - Html 체크박스를 출력하려면 <form:checkbox>요소를 사용한다.
	 */
	
	// 1) 모델에 기본 생성자로 생성한 폼 객체를 추가한 후에 화면에 전달한다.
	@GetMapping(value = "/registerForm01")
	public String registerForm01(Model model) {
		model.addAttribute("member", new Member());
		return "form/checkbox/registerForm01";
	}

	@GetMapping(value = "/registerForm02")
	public String registerForm02(Model model) {
		Member mem  = new Member();
		mem.setDeveloper("Y");
		mem.setForeigner(true);
		mem.setHobby("movie");
		
		String[] hobbyArray = {"music","music"};
		mem.setHobbyArray(hobbyArray);
		
		List<String> hobbyList = new ArrayList<String>();
		hobbyList.add("music");
		hobbyList.add("movie");
		mem.setHobbyList(hobbyList);
		
		model.addAttribute("member", mem);
		return "form/checkbox/registerForm01";
	}
	
	@PostMapping(value = "/result")
	public String registerResult(Member member, Model model) {
		log.info("member.developer: "+ member.getDeveloper());
		log.info("member.foreigner: "+ member.isForeigner());
		log.info("member.hobby: "+ member.getHobby());
		
		String[] hobbyArray = member.getHobbyArray();
		if(hobbyArray != null) {
			for (int i = 0; i < hobbyArray.length; i++) {
				log.info("hobbyArray["+i+"]: " + hobbyArray[i]);
			}
		}else {
			log.info("hobbyArray is null");
		}
		
		List<String> hobbyList = member.getHobbyList();
		if(hobbyList != null) {
			for (int i = 0; i < hobbyList.size(); i++) {
				log.info("hobbyList["+i+"]: " + hobbyList.get(i));
			}
		}else {
			log.info("hobbyList is null");
		}
		
		model.addAttribute("member", member);
		return "form/checkbox/result";
	}
	
}
