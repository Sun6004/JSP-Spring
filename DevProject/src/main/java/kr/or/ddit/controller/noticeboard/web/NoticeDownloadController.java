package kr.or.ddit.controller.noticeboard.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.controller.noticeboard.service.INoticeService;
import kr.or.ddit.controller.noticeboard.view.NoticeDownloadView;
import kr.or.ddit.vo.NoticeFileVO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeDownloadController {
	
	@Inject
	private INoticeService noticeService;
	
	@RequestMapping(value = "/download.do")
	public View noticeDownloadProcess(Model model, int fileNo) {
		NoticeFileVO noticeFileVo = noticeService.noticeDownload(fileNo);
		
		Map<String, Object> noticeFileMap = new HashMap<String, Object>();
		noticeFileMap.put("fileName", noticeFileVo.getFileName());
		noticeFileMap.put("fileSize", noticeFileVo.getFileSize());
		noticeFileMap.put("fileSavepath", noticeFileVo.getFileSavepath());
		model.addAttribute("noticeFileMap", noticeFileMap);
		
		// 리턴되는 noticeDownloadView는 jsp 페이지로 존재하는 페이지 name을 요청하는 게 아니라,
		// 클래스를 요청하는 것인데 해당 클래스가 스프링에서 제공하는 AbstractView 클래스를 상속받는 클래스인데,
		// 그 클래스는 AbstractView를 상속받아 renderMergedOutputModel 함수를 제정의 할 때 View로 취급할 수 있게 해준다.
		return new NoticeDownloadView();
	}
}
