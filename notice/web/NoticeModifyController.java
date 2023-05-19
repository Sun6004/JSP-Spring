package kr.or.ddit.notice.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.notice.service.InoticeService;
import kr.or.ddit.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeModifyController {
	
	@Inject
	private InoticeService noticeService;
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String noticeUpdateForm(int boNo, Model model) {
		NoticeVO noticeVo = noticeService.selectNotice(boNo);
		model.addAttribute("notice", noticeVo);
		model.addAttribute("status", "u"); // u: upadate에 대한 flag
		return "notice/form";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVo, Model model) {
		String goPage = "";
		ServiceResult res = noticeService.updateNotice(noticeVo);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/notice/detail.do?boNo="+noticeVo.getBoNo();
		}else {
			model.addAttribute("notice", noticeVo);
			model.addAttribute("status", "u");
			goPage = "notice/form";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String deleteNotice(int boNo, Model model) { //boNo는 문자열로 받지만 Spring에서 알아서 int로 형변환해줌
		String goPage = "";
		ServiceResult res = noticeService.deleteNotice(boNo);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/notice/list.do";
		}else {
			goPage = "redirect:/notice/detail.do?boNo="+boNo;			
		}
		return goPage;
	}
}
