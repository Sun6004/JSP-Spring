package kr.or.ddit.controller.noticeboard.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.controller.noticeboard.service.INoticeService;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/notice")
@Slf4j
public class NoticeRetrieveController {
	
	@Inject
	private INoticeService noticeService;
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/list.do")
	public String noticeList(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,  
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		log.info("noticeList start....");
		PaginationInfoVO<NoticeVO> pagingVo= new PaginationInfoVO<NoticeVO>();
		
		// 검색 기능 추가시 활용
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVo.setSearchType(searchType);
			pagingVo.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVo.setCurrentPage(currentPage);
		int totalRecord = noticeService.selectNoticeCount(pagingVo);
		pagingVo.setTotalRecord(totalRecord);
		
		List<NoticeVO> dataList = noticeService.selectNoticeList(pagingVo);
		pagingVo.setDataList(dataList);
		
		model.addAttribute("pagingVo", pagingVo);
		
		return "notice/list";
	}

	@RequestMapping(value = "/detail.do")
	public String noticeDetail(int boNo, Model model) {
		log.info("noticeList start....");
		NoticeVO noticeVo = noticeService.selectNotice(boNo);
		model.addAttribute("notice", noticeVo);
		return "notice/detail";
	}
	
	@GetMapping(value = "testForm.do")
	public String testForm(Model model) {
		return "notice/testForm";
	}
}
