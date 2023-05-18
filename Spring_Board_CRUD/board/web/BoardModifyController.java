package kr.or.ddit.board.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardModifyController {
	
	@Inject
	private IBoardService boardService;
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String boardUpdateForm(int boNo, Model model) {
		BoardVO boardVo = boardService.selectBoard(boNo);
		model.addAttribute("board", boardVo);
		model.addAttribute("status", "u"); // u: upadate에 대한 flag
		return "board/form";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String boardUpdate(BoardVO boardVo, Model model) {
		String goPage = "";
		ServiceResult result = boardService.updateBoard(boardVo);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/board/detail.do?boNo="+boardVo.getBoNo();
		}else {
			model.addAttribute("board", boardVo);
			model.addAttribute("status", "u");
			goPage = "board/form";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String boardDelete(int boNo, Model model) { //boNo는 문자열로 받지만 Spring에서 알아서 int로 형변환해줌
		String goPage = "";
		ServiceResult result = boardService.deleteBoard(boNo);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/board/list.do";
		}else {
			goPage = "redirect:/board/detail.do?boNo="+boNo;			
		}
		return goPage;
	}
}
