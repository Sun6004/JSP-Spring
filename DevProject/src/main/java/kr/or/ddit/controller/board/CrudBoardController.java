package kr.or.ddit.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.Board;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/crud/board")
@Slf4j
public class CrudBoardController {
	
	@Inject
	private IBoardService service;
	
	@GetMapping(value = "/register")
	public String crudRegisterForm(Model model) {
		log.info("crudRegisterForm() start..");
		model.addAttribute("board", new Board());
		return "crud/register";
	}

	@PostMapping(value = "/register")
	public String crudRegister(Board board, Model model) {
		log.info("crudRegister() start..");
		service.register(board);
		model.addAttribute("msg", "등록이 완료되었습니다!");
		return "crud/success";
	}

	@GetMapping(value = "/list")
	public String crudList(Model model) {
		log.info("crudList() start..");
		List<Board> boardList = service.list();
		model.addAttribute("boardList", boardList);
		return "crud/list";
	}

	@GetMapping(value = "/read")
	public String crudRead(int boardNo, Model model) {
		log.info("crudRead() start..");
		Board board = service.read(boardNo);
		model.addAttribute("board", board );
		return "crud/read";
	}

	@GetMapping(value = "/modify")
	public String crudModifyForm(int boardNo, Model model) {
		log.info("crudModifyForm() start..");
		Board board = service.read(boardNo);
		model.addAttribute("board", board );
		model.addAttribute("status", "u" ); //수정을 진행중이라는 flag값
		return "crud/register";
	}

	@PostMapping(value = "/modify")
	public String crudModify(Board board, Model model) {
		log.info("crudModify() start..");
		service.update(board);
		model.addAttribute("msg", "수정이 성공적으로 완료되었습니다!" );
		
		return "crud/success";
	}
	
	@PostMapping(value = "/remove")
	public String crudDelete(int boardNo, Model model) {
		log.info("crudDelete() start..");
		service.delete(boardNo);
		model.addAttribute("msg", "삭제가 성공적으로 완료되었습니다!");
		return "/crud/success";
	}
	@PostMapping(value = "/search")
	public String crudSearch(String title, Model model) {
		log.info("crudSearch() start..");
		Board board = new Board();
		board.setTitle(title);
		
		List<Board> boardList = service.search(board);
		model.addAttribute("board",board);
		model.addAttribute("boardList",boardList);
		return "crud/list";
	}
}
