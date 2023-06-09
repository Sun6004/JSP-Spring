package kr.or.ddit.controller.noticeboard.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.service.INoticeService;
import kr.or.ddit.vo.NoticeVO;



@Controller
@RequestMapping("/notice")
public class noticeModifyController {
	
	@Inject
	private INoticeService noticeService;
	
	@GetMapping(value = "/update.do")
	public String noticeModifyForm(int boNo, Model model) {
		NoticeVO noticeVo = noticeService.selectNotice(boNo);
		model.addAttribute("notice", noticeVo);
		model.addAttribute("status", "u");
		return "notice/form";
	}

	@PostMapping(value = "/update.do")
	public String noticeModify(NoticeVO noticeVo, Model model,
				HttpServletRequest req
			) {
		String goPage = "";
		ServiceResult res = noticeService.updateNotice(req, noticeVo);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/notice/detail.do?boNo=" + noticeVo.getBoNo();
		}else {
			model.addAttribute("message", "수정에 실패하였습니다!");
			model.addAttribute("noticeVo", noticeVo);
			model.addAttribute("status", "u");
		}
		return goPage;
	}

	@PostMapping(value = "/delete.do")
	public String noticeDelete(int boNo, Model model, HttpServletRequest req) {
		String goPage = "";
		ServiceResult res = null;
		
		res = noticeService.deleteNotice(boNo, req);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/notice/list.do";
		}else {
			model.addAttribute("message", "서버오류,다시 시도해주세요!");
			goPage = "redirect:/notice/detail.do?boNo="+boNo;
		}
		
		return goPage;
	}
}
