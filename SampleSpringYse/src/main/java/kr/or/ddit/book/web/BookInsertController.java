package kr.or.ddit.book.web;

import org.springframwork.stereotype.Controller;

/*
 *  @Controller 어너테이션이 있는 클래스는 스프링이 브라우저의 요청(request)을 받아들이는 컨트롤러라고 인지해서
 *  Java Bean으로 등록해서 관리한다.
 *  여기서 자바 빈이란 객체를 만들어서 메모리에 올리는 형태를 말한다.
 */
@Controller
@RequestMapping("/book")
public class BookInsertController {
	
	/*
	 *  @Requestmapping
	 *  - 요청 URL을 어떤 메소드가 처리할지 여부를 결정
	 *  
	 *  method 속성을 http 요청 메서드를 의미한다.
	 *  일반적인 웹 페이지 개발에서 GET 메서드는 데이터를 변경하지 않는 경우에, POST 메서드는 데이터가 변경될 경우 사용
	 *  
	 *  ModelAndView는 컨트롤러가 반환할 데이터를 담당하는 모델과 화면을 담당하는 뷰의 경로를 합쳐놓은 객체이다.
	 *  ModelAndView의 생성자에 문자열 타입 파라미터가 입력되면 뷰의 경로라고 간주됨
	 *  뷰의 경로를 book/form과 같은 형태로 전달하는 이유는 요청(request)에 해당하는 url의 mapping되는 화면의 경로 값을
	 *  viewresolver라는 녀석이 제일 먼저 받아 surfix, prefix속성에 의해서 앞에는 /WEB-INF/Views/가 붙고
	 *  뒤에는 '.jsp' 가 붙어 최종 위치에 해당하는 jsp파일을 찾아준다.
	 */
	@RequestMapping(value="/form.do",method = RequestMethod.GET)
	public ModelAndView bookForm() {
		return new ModelAndView("book/form");
	}
}
