package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("crudTest")
public class BoardController {

    @Inject
    private IBoardService service;

    @RequestMapping(value = "/list.do")
    public String boardList(Model model) {
        List<BoardVO> list = service.selectBoardList();
        model.addAttribute("boardList", list);

        return "/list";
    }

    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
    public String insertBoard(BoardVO boardVo, Model model, HttpSession session) {

        String page = "";
        Map<String, String> error = new HashMap<String, String>();
        if (boardVo.getBoTitle() == null || boardVo.getBoTitle().equals("")) {
            error.put("boTitle", "제목을 입력하지 않았습니다!");
        }
        if (boardVo.getBoContent() == null || boardVo.getBoContent().equals("")) {
            error.put("boContent", "내용을 입력하지 않았습니다!");
        }

        if (error.size() > 0) {
            model.addAttribute("error", error);
            model.addAttribute("board", boardVo);
            page = "/form";
        } else {
            // 세션에서 memVo 가져오기
            MemberVO memVo = (MemberVO) session.getAttribute("memVo");
            if (memVo != null) {
                boardVo.setBoWriter(memVo.getMemId());
                ServiceResult res = service.insertBoard(boardVo);
                if (res.equals(ServiceResult.OK)) {
                    page = "redirect:/board/detail.do?boNo=" + boardVo.getBoNo();
                }
            } else {
                // 로그인되지 않은 상태 처리
                page = "redirect:/siginin.do";
            }
        }
        return page;
    }
    
    @GetMapping(value = "update.do")
    public String updateBoardForm(int boNo, Model model) {
    	BoardVO boardVo = service.selectBoard(boNo);
		model.addAttribute("board", boardVo);
		model.addAttribute("status", "u");
		return "/form";
    }
    
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String boardUpdate(BoardVO boardVo, Model model) {
		String page = "";
		ServiceResult result = service.updateBoard(boardVo);
		if(result.equals(ServiceResult.OK)) {
			page = "redirect:/detail.do?boNo="+boardVo.getBoNo();
		}else {
			
			model.addAttribute("board", boardVo);
			model.addAttribute("status", "u");
			page = "board/form";
		}
		return page;
	}
    
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String deleteBoard(int boNo, Model model) { //boNo는 문자열로 받지만 Spring에서 알아서 int로 형변환해줌
		String page = "";
		ServiceResult result = service.deleteBoard(boNo);
		if(result.equals(ServiceResult.OK)) {
			page = "redirect:/board/list.do";
		}else {
			page = "redirect:/detail.do?boNo="+boNo;			
		}
		return page;
	}
}
