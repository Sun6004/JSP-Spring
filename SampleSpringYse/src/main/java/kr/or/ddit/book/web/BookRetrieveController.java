package kr.or.ddit.book.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.book.service.BookService;

@Controller
@RequestMapping("/book")
public class BookRetrieveController {
	
	@Inject
	private BookService bookService;
	
	@RequestMapping(value="/detail.do",method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		// 데이터베이스에서 조회한 결과를 detailMap 변수에 담는다.
		Map<String, Object> detailMap = bookService.selectBook(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("book", detailMap);
		String bookId = map.get("bookId").toString();
		mav.addObject("bookId",bookId);
		mav.setViewName("book/detail");
		return mav;
	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String,Object> map) {
		List<Map<String, Object>> list = bookService.selectBookList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		
		// 검색 기능 추가
		// 목록 페이지에서는 keyword가 http 파라미터가 있을수도 있고, 없을 수도 있다.
		if(map.containsKey("keyword")) {
			mav.addObject("keyword", map.get("keyword"));
		}
		mav.setViewName("book/list");
		return mav;
	}
	
}
