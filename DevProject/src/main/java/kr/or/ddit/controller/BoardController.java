package kr.or.ddit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.vo.Board;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	/*
	 *  1. 요청 경로 매핑
	 *  @RequestMapping 의 value 속성에 요청 경로를 설정한다.
	 *  
	 *   - 요청 경로는 반드시 설정해야 하는 필수 정보이다.
	 *   - 속성이 하나일 때는 속성명이 생략될 수 있다.
	 *   - 컨트롤러의 클레스 레벨과 메서드 레벨로 지정할 수 있다.
	 *   - 클래스 레벨로 요청 경로를 지정하면 메서드 레벨에서 지정한 경로의 기본 경로로 취급된다.
	 *   - 클래스 레벨의 요청 경로에 메서드 레벨의 요청 경로를 덧붙인 형태가 최종 형태가 된다.
	 */
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/register")
	public void resisterForm() {
		logger.info("registerForm() 실행...!");
	}
	
	@RequestMapping(value = "/modify")
	public void modifyForm() {
		logger.info("modifyForm() 실행...!");
	}
	
	@RequestMapping(value = "/list")
	public void list() {
		logger.info("list() 실행...!");
	}
	
	/*
	 *  2.경로 패턴 매핑
	 *  @Requestmapping(value ="/board/read/{boardNo})
	 *  
	 *  - 해당 경로로 요청 시, board폴더에 read.jsp를 찾아서 페이지를 출력해주는것 같지만,
	 *    경로상으로만 보면 /board/read/boardNo라는 파일까지 찾게된다
	 *  - url 경로상의 변하는 값을 경로 변수로 취급한다.
	 *  - 경로 변수에 해당하는 값을 파라미터 변수에 설정할 수 있다.
	 */
	@RequestMapping(value = "/read/{boardNo}")
	public String read(@PathVariable("boardNo") int boardNo) {
		logger.info("read() 실행...!");
		logger.info("read boardNo :" +boardNo);
		return "/board/read";
	}
	
	/*
	 *  3. Http 메서드 매핑
	 *   method 속성을 사용하여 http 메서드를 매핑 조건으로 지정할 수 있다.
	 *   화면으로 응답하는 경우에는 http 메서드로 get 방식과 post방식 두 가지를 사용할 수 있다.
	 */
//	@RequestMapping(value = "/formHome", method = RequestMethod.GET)
//	public String formHome() {
//		return "formHome";
//	}
//	
//	// register 경로에 get방식
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public String registerForm1() {
//		logger.info("registerForm() 실행...!");
//		return "sucess";
//	}
//	
//	// register 경로에 post방식
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String register() {
//		logger.info("register() 실행...!");
//		return "sucess";
//	}
//	
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public String modifyForm1() {
//		logger.info("modifyForm() 실행...!");
//		return "sucess";
//	}
//	
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String modify() {
//		logger.info("modify() 실행...!");
//		return "sucess";
//	}
//	
//	@RequestMapping(value = "/remove", method = RequestMethod.POST)
//	public String remove() {
//		logger.info("remove() 실행...!");
//		return "sucess";
//	}
//	
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list1() {
//		logger.info("list() 실행...!");
//		return "sucess";
//	}
	
	/*
	 * 4. Params 매핑
	 * @RequestMapping(value="/board/get, method = RequestMethod.GET, params="register")
	 *  - 요청 파라미터를 매핑 조건으로 지정하는 경우에는 params 속성을 사용한다.
	 *    버튼이나 링크에 따라 호출할 메서드를 바꿔야 할 때 사용한다.
	 *    
	 *  확인 페이지: views/board/list,modify,register,read 등
	 */
	// board/get 경로, GET방식, register 요청 파라미터에 대한 처리
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "register")
	public String registerFormParamsGet() {
		logger.info("registerFormParamsGet() 실행!");
		return "board/register";
	}
	
	// board/post 경로, post방식, register 요청 파라미터에 대한 처리
	@RequestMapping(value = "/post", method = RequestMethod.POST, params = "register")
	public String registerParamsPost() {
		logger.info("registerFormParamsPost() 실행!");
		return "board/list";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "modify")
	public String modifyFormParamsGet() {
		logger.info("modifyFormParamsGet() 실행!");
		return "board/modify";
	}
	
	@RequestMapping(value = "/post", method = RequestMethod.POST, params = "modify")
	public String modifyParamsPost() {
		logger.info("modifyparamsPost() 실행!");
		return "board/list";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "remove")
	public String removeParamsGet() {
		logger.info("removeParamsGet() 실행!");
		return "board/remove";
	}
	
	@RequestMapping(value = "/post", method = RequestMethod.POST, params = "remove")
	public String removeParamsPost() {
		logger.info("removeParamsPost() 실행!");
		return "board/list";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "list")
	public String listParamsGet() {
		logger.info("listParamsGet() 실행!");
		return "board/list";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "read")
	public String readParamsGet() {
		logger.info("readParamsGet() 실행!");
		return "board/read";
	}
	
	/*
	 *  5. Headers 매핑
	 *   - 요청 헤더를 매핑 조건으로 지정하는 경우에는 headers 속성을 사용한다.
	 */
	@RequestMapping(value = "/ajaxHome", method = RequestMethod.GET)
	public String ajaxhome() {
		logger.info("ajaxhome() 실행!");
		return "ajaxHome";
	}
	
	// Header 매핑이지만, headers 설정을 하지 않고 매핑
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyPut(@PathVariable("boardNo") int boardNo, @RequestBody Board board){
		logger.info("modifyPut() 실행!");
		
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.PUT, headers = "X-HTTP-Method-Override=PUT")
	public ResponseEntity<String> modifyByHeader(
			@PathVariable("boardNo") int boardNo, @RequestBody Board board){
		log.info("modifyByHeader() 실행!");
		log.info("boardNo: "+boardNo);
		log.info("title: "+board.getTitle());
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	/*
	 * 6. content type 매핑
	 *  - 요청의 Content0Type 헤더 값을 매핑 조건으로 지정하는 경우에는 consumes속성을 사용한다.
	 */
	// ResponseEntity : 응답 상태코드와 값을 제네릭에 설정되어 있는 타입에 따라서 내 마음대로 내보낼 수 있다.
	// 응답 상태코드 : HttpStatus라는 객체 안에 있는 여러 상태 코드를 선택해서 내보낼 수 있다.
	// 결과값: 제네릭 타입에 설정되어 있는 해당 타입의 값으로 결과의 값을 설정해서 내보낼 수 있다.
	
	//consumes 속성값을 지정하지 않고 테스트
	//consumes 속성값을 지정하지 않으면 기본값으로 application/json 미디어 타입으로 지정된다
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.POST)
	public ResponseEntity<String> modifyContentType(
			@PathVariable("boardNo") int boardNo, @RequestBody Board board ){
		log.info("modifyContentType() 실행..!");
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	//consumes 속성값에 "application/json" 미디어 타입을 지정한다.
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.PUT, consumes = "application/json")
	public ResponseEntity<String> modifyByJson(
			@PathVariable("boardNo") int boardNo, @RequestBody Board board ){
		log.info("modifyByJson() 실행..!");
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.PUT, consumes = "application/xml")
	public ResponseEntity<String> modifyContentTypeXml(
			@PathVariable("boardNo") int boardNo, @RequestBody Board board ){
		log.info("modifyContentTypeXml() 실행..!");
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	// 7. Accept 매핑 사용
	// produces 속성값을 지정해서 요청하는 미디어 타입을 처리한다.
	// produces 속성값을 저정하지 않고 테스트
	// produces 속성값을 저정하지 않으면 기본값인 "application/json" 미디어 타입으로 지정된다.	
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.GET)
	public ResponseEntity<Board> readAccept(@PathVariable("boardNo") int boardNo){
		log.info("readAccept() 실행..!");
		
		Board board = new Board();
		board.setTitle("제목1");
		board.setContent("내용1");
		board.setWriter("작성자1");
		
		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Board> readToJson(@PathVariable("boardNo") int boardNo){
		log.info("readToJson()실행...!");
		
		String addStr = "_json";
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setTitle("제목1"+ addStr);
		board.setContent("내용1" + addStr);
		board.setWriter("작성자1" + addStr);
		
		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.GET, produces = "application/xml")
	public ResponseEntity<Board> readToXml(@PathVariable("boardNo") int boardNo){
		log.info("readToXml()실행...!");
		
		String addStr = "_xml";
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setTitle("제목1"+ addStr);
		board.setContent("내용1" + addStr);
		board.setWriter("작성자1" + addStr);
		
		ResponseEntity<Board> entity = new ResponseEntity<Board>(board, HttpStatus.OK);
		return entity;
	}
}	
