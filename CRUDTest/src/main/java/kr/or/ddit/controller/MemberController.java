package kr.or.ddit.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Inject
	private IMemberService memberService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String logIn(Model model, @RequestParam("memId") String memId, @RequestParam("memPw") String memPw) {
	    log.info("로그인 실행..");
	    log.info("id: " + memId);
	    log.info("pw: " + memPw);
	    
	    String goPage;
	    
	    MemberVO memberVo = new MemberVO();
	    memberVo.setMemId(memId);
	    memberVo.setMemPw(memPw);
	    
	    MemberVO memVo = memberService.selectMember(memberVo);
	    log.info("쿼리 실행결과: " + memVo);
	    
	    if (memVo == null) {
	        goPage = "crudTest/form";
	    } else {
	        model.addAttribute("memVo", memVo);
	        goPage = "crudTest/list";
	    }
	    
	    return goPage;
	}
}
