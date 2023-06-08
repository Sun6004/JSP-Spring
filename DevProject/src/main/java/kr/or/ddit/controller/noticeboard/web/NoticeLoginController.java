package kr.or.ddit.controller.noticeboard.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.service.INoticeService;
import kr.or.ddit.vo.DDITMemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/notice")
@Slf4j
public class NoticeLoginController {
	
	@Inject
	private INoticeService noticeService;
	
	// 로그인 페이지 요청
	@GetMapping(value = "/login.do")
	public String noticeLogin(Model model) {
		model.addAttribute("bodyText", "login-page");
		return "conn/login";
	}
	
	// 회원가입 페이지 요청
	@GetMapping(value = "/signup.do")
	public String noticeRegister(Model model) {
		model.addAttribute("bodyText", "register-page");
		return "conn/register";
	}
	
	@ResponseBody
	@PostMapping(value = "idCheck.do")
	public ResponseEntity<ServiceResult> idCheck(String memId){
		ServiceResult result = noticeService.idCheck(memId);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@PostMapping(value = "/signup.do")
	public String signup(DDITMemberVO memberVo, Model model, HttpServletRequest req, RedirectAttributes ra) {
		String goPage ="";
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(memberVo.getMemId())) {
			errors.put("memId", "아이디를 입력하세요!");
		}
		if(StringUtils.isBlank(memberVo.getMemPw())) {
			errors.put("memPw", "비밀번호를 입력하세요!");
		}
		if(StringUtils.isBlank(memberVo.getMemName())) {
			errors.put("memName", "이름을 입력하세요!");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("bodyText", "register-page");
			model.addAttribute("errors", errors);
			model.addAttribute("memberVo", memberVo);
			goPage = "conn/register";
		}else {
			ServiceResult res = noticeService.signup(req, memberVo);
			if(res.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "회원가입을 완료하였습니다!"); // 일회용 메세지
				goPage = "redirect:/notice/login.do?stat=1";				
			}else {
				model.addAttribute("bodyText", "register-page");
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				model.addAttribute("memberVo", memberVo);
				goPage = "conn/register";
			}
		}
		return goPage;
	}
	
	// 아이디/비밀번호 찾기 페이지 요청
	@GetMapping(value = "/forget.do")
	public String noticeForget(Model model) {
		model.addAttribute("bodyText", "login-page");
		return "conn/forget";
	}

	@PostMapping(value = "/loginCheck.do")
	public String loginCheck(Model model, DDITMemberVO memberVo, HttpServletRequest req) {
		String page = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(memberVo.getMemId())) {
			errors.put("memId", "아이디를 입력하세요!");
		}
		if(StringUtils.isBlank(memberVo.getMemPw())) {
			errors.put("memPw", "비밀번호를 입력하세요!");
		}
		if(errors.size() >0) {
			model.addAttribute("bodyText", "login-page");			
			model.addAttribute("errors", errors);			
			model.addAttribute("member", memberVo);		
			page = "conn/login";
		}else {
			DDITMemberVO member = noticeService.loginCheck(memberVo);
			if(member != null) {
				HttpSession session = req.getSession();
				session.setAttribute("SessionInfo", member); // 로그인 성공 후 , 세션처리
				page = "redirect:/notice/list.do";
			}else {
				model.addAttribute("bodyText", "login-page");			
				model.addAttribute("message", "서버에러, 로그인 정보를 정확하게 입력하세요!");			
				model.addAttribute("member", memberVo);		
				page = "conn/login";
			}
		}
		return page;
	}
	
	
	
}
