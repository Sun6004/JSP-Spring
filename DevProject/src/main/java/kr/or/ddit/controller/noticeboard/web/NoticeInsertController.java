package kr.or.ddit.controller.noticeboard.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
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
public class NoticeInsertController {
	
	@Inject
	private INoticeService noticeService;
	
	@GetMapping(value = "/form.do")
	public String noticeinsertForm() {
		return "notice/form";
	}

	@PostMapping(value = "/insert.do")
	public String noticeInsert(NoticeVO noticeVo, Model model) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(noticeVo.getBoTitle())) {
			errors.put("boTitle", "제목을 입력하세요");
		}
		if(StringUtils.isBlank(noticeVo.getBoContent())) {
			errors.put("boContent", "내용을 입력하세요");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("noticeVo", noticeVo);
		}else {
			noticeVo.setBoWriter("a001"); // 임시로 넣어둠
			ServiceResult result = noticeService.insertNotice(noticeVo);
			if(result.equals(ServiceResult.OK)) {
				goPage = "redirect:/notice/detail.do?boNo="+noticeVo.getBoNo();
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				goPage = "notice/form";
			}
		}
		return goPage;
	}
}
