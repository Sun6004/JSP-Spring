package kr.or.ddit.book.web;

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
}
