package kr.or.ddit.controller.noticeboard.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.service.INoticeService;
import kr.or.ddit.vo.DDITMemberVO;

@Controller
@RequestMapping("/notice")
public class NoticeProfileController {
	
	@Inject
	private INoticeService noticeService;
	
	@RequestMapping(value = "/profile.do", method = RequestMethod.GET)
	public String noticeProfile(
			HttpServletRequest req, RedirectAttributes ra, Model model) {
		String page = "";
		HttpSession session = req.getSession();
		DDITMemberVO sessionMember = (DDITMemberVO) session.getAttribute("SessionInfo");
		
		if(sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다.");
			return "redirect:/notice/login.do";
		}
		
		DDITMemberVO member = noticeService.selectMember(sessionMember);
		if(member != null) {
			model.addAttribute("member", member);
			page = "notice/profile";
		}else {
			ra.addFlashAttribute("message", "로그인 후 이용 가능합니다!");
			page = " redirect:/notice/login.do";
		}
		return page;
	}
	@PostMapping(value = "/profileUpdate.do")
	public String noticeProfileUpload(
			HttpServletRequest req, DDITMemberVO memberVo, RedirectAttributes ra, Model model
			) {
		String page = "";
		ServiceResult res = noticeService.profileUpdate(req, memberVo);
		if(res.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "회원정보 수정이 완료되었습니다.");
			page = "redirect:/notice/profile.do";
		}else {
			model.addAttribute("member", memberVo);
			page = "notice/profile";
		}
		return page;
	}
	
}
