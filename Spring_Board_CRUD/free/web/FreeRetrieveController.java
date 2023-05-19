package kr.or.ddit.free.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.free.service.IFreeService;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/free")
public class FreeRetrieveController {
	
	@Inject
	private IFreeService freeService;
	
	@RequestMapping(value = "/list.do")
	public String freeList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<FreeVO> pagingVo = new PaginationInfoVO<FreeVO>();
		pagingVo.setCurrentpage(currentPage);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVo.setSearchType(searchType);
			pagingVo.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		int totalRecord = freeService.selectCount(pagingVo);
		pagingVo.setTotalRecord(totalRecord);
		List<FreeVO> dataList = freeService.selectList(pagingVo);
		pagingVo.setDataList(dataList);
		model.addAttribute("pagingVo", pagingVo);
		return "free/list";
	}
	
	@RequestMapping(value = "/detail.do")
	public String detail(int boNo, Model model) {
		FreeVO freeVo = freeService.select(boNo);
		model.addAttribute("free", freeVo );
		return "free/view";
	}
}
