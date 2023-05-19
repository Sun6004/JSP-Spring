package kr.or.ddit.notice.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.notice.service.InoticeService;
import kr.or.ddit.vo.NoticeVO;


@Controller
@RequestMapping("/notice")
public class NoticeInserController{
	
	@Inject
	private InoticeService noticeService;
	
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String noticeForm() {
		return "notice/form";
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insertNotice(NoticeVO noticeVo, Model model) {
		String goPage = ""; //페이지를 담을 공간
		Map<String, String> errors = new HashMap<String, String>(); //에러를 담을 공간
		
		//StringUtils.isBlank(boardVo.getBoTitle()) 
		//org.apache.commons 라이브러리를 이용해서
		//boardVo 안에 들어있는 제목,내용을 공백/null체킹을 통해 필터를 처리할수 있음
		if(StringUtils.isBlank(noticeVo.getBoTitle())) { 
			errors.put("boTitle","제목을 입력해주세요!");
		}
		if(StringUtils.isBlank(noticeVo.getBoContent())) {
			errors.put("boContent","내용을 입력해주세요!");
		}
		
		if(errors.size() > 0) { //에러발생!
			// model은 데이터 전달자
			// 내가 넘기고자 하는 데이터를 대신 넘겨주는 역할을 담당한다.
			model.addAttribute("errors",errors);
			model.addAttribute("notice",noticeVo);
			goPage = "notice/form";
		}else { //에러가 발생하지 않았을 때(정상)
			noticeVo.setBoWriter("N001");
			ServiceResult result = noticeService.insertNotice(noticeVo);
			if(result.equals(ServiceResult.OK)) { //등록 성공
				goPage = "redirect:/notice/detail.do?boNo="+noticeVo.getBoNo();
			}else {
				errors.put("msg","서버에러! 다시 시도해주세요!");
				model.addAttribute("errors",errors);
				goPage = "notice/form.jsp";
			}
		}
		return goPage;
	}
}
