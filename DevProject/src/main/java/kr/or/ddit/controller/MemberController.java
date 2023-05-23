package kr.or.ddit.controller;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;
/*
 *  5장 컨트롤러 요청 처리
 *  
 *  1. 컨트롤러 메서드 매개변수
 *  	Model
 *  	- 이동 대상에 전달할 데이터를 가지고 있는 인터페이스
 *  	RedirectAttributes
 *  	- 리다이렉트 대상에 전달할 데이터를 가지고 있는 인터페이스
 *  	MultipartFile
 *  	- 멀티파트 요청을 사용해 업로드 된 파일 정보를 가지고 있는 인터페이스
 *  	BindingResult
 *  	- 도메인 클래스의 입력값 검증을 가지고 있는 인터페이스
 *  	java.security.Principal
 *  	- 클라이언트 인증을 위한 사용자 정보를 가지고 있는 인터페이스
 */
@Controller
@Slf4j
public class MemberController {
	
	// 컨트롤러 요청 처리 시작 컨트롤러 메서드
	// - 페이지를 요청해 테스트를 진행합니다.
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm() {
		log.info("registerForm() 실행....!");
		return "member/registerForm";
	}
	
	/*
	 *  컨트롤러 메서드 매개변수(요청처리)
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerByParameter(String userId, String password) {
		log.info("registerByParameter() 실행....!");
		log.info("userId: " + userId);
		log.info("password: " + password);
		return "success";
	}
	
	@RequestMapping(value = "/register/{userId}", method = RequestMethod.GET)
	public String registerByPath(String userId) {
		// 결과로 userId는 null로 표시된다.
		// 넘겨받은 id를 위와 같은 형태로 받으려면 @PathVariables를 이용한다.		
		log.info("registerByPath()실행....!");
		log.info("userId: " + userId);
		return "success";
	}
	
	// 3) HTML Form 필드명과 컨트롤러 매개변수명이 일치하면 요청 데이터를 취득할 수 있다.
	@RequestMapping(value = "/register01", method = RequestMethod.POST)
	public String register01(String userId) {
		log.info("register01() 실행..!");
		log.info("userId: "+ userId);
		return "success";
	}
	
	// 4) Html Form 필드가 여러개일 경우에도 컨트롤러 매개변수명이 일치하면 요청 데이터를 취득할 수 있다.
	@RequestMapping(value = "/register02", method = RequestMethod.POST)
	public String register02(String userId, String password) {
		log.info("register02() 실행..!");
		log.info("userId: "+ userId);
		log.info("password: "+ password);
		return "success";
	}
	
	// 5) Html Form 필드가 여러개일 경우에 컨트롤러 매개변수의 위치는 상관이 있나?
	@RequestMapping(value = "/register03", method = RequestMethod.POST)
	public String register03(String password, String userId) {
		log.info("register03실행....!");
		log.info("password: " + password);
		log.info("userId: " + userId);
		return "success";
	}
	
	// 6) HTML Form 필드값이 숫자일 경우에는 컨트롤러 매개변수 타입이 문자열이면 그대로 문자열 형태로 들어가는가? 
	@RequestMapping(value = "/register04", method = RequestMethod.POST)
	public String register04(String password, String userId, String coin) {
		log.info("register04실행....!");
		log.info("password: " + password);
		log.info("userId: " + userId);
		log.info("coin: " + coin);
		return "success";
	}
	
	//7) HTML Form 필드값이 숫자일 경우에는 컨트롤러 매개변수 타입이 숫자형이면 숫자로 타입변환하여 데이터를 취득하는가? 
	@RequestMapping(value = "/register05", method = RequestMethod.POST)
	public String register05(String userId, String password, int coin) {
		log.info("register05실행....!");
		log.info("userId: " + userId);
		log.info("password: "+ password);
		log.info("coin: "+ coin);
		return "success";
	}
	
	/*
	 *  3) 요청 데이터 처리 어노테이션
	 *  	@PathVariables
	 *  	- URL에서 경로 변수 값을 가져오기 위한 어노테이션
	 *  	@RequestParam
	 *  	- 요청 파라미터 값을 가져오기 위한 어노테이션
	 *  	@RequestBody
	 *  	- 요청 본문 내용을 가져오기 위한 어노테이션
	 *  	@CookieValue
	 *  	- 쿠키 값을 가져오기 위한 어노테이션
	 */
	@RequestMapping(value = "/register/{userId}/{coin}", method= RequestMethod.GET)
	public String registerByPath(@PathVariable("userId") String userId,@PathVariable("coin") int coin) {
		log.info("registerByPath실행....!");
		log.info("userId: " + userId);
		log.info("coin: "+ coin);
		return "success";
	}
	// HTML 폼의 필드명과 컨트롤러 매개변수명이 일치하면 요청을 처리할 수 있다. 
	@RequestMapping(value = "/register0101", method = RequestMethod.POST)
	public String register0101(String userId) {
		log.info("register0101실행....!");
		log.info("userId: " + userId);
		return "success";
	}
	
	// HTML 폼 필드명과 컨트롤러 매개변수명이 일치(대소문자 구분)하지 않으면 요청을 처리할 수 없다.
	// 클라이언트에서 선언될 필드명은 userId인데 서버 컨트롤러 메서드에서 받는 필드명이 username이면 파라미터를 받을 수 없다.
	// 정확하게 각 필드명이 일치했을 때만 파라미터를 받을 수 있다.
	@RequestMapping(value = "/register0201", method = RequestMethod.POST)
	public String register0201(String username) {
		log.info("register0201 실행!");
		log.info("userName: " + username);
		return "success";
	}
	
	//4) @RequestParam 어노테이션을 사용하여 특정한 HTML Form의 필드명을 지정하여 요청을 처리한다. 
	// 데이터를 받는 필드명은 동일하게 userId로 하되, 사용하는 변수명은 username으로 달리 설정할 수 있다.
	// 우리가 페이징을 구현할 때 page를 넘기는 방법을 해당 이녀석을 채택해서 구현함.
	@RequestMapping(value = "/register0202", method = RequestMethod.POST)
	public String register0202(@RequestParam("userId") String username){
		log.info("register0202 실행!");
		log.info("userName: " + username);
		return "success";
	}
	
	/*
	 * 4.  요청 처리 자바빈즈
	 */
	//1) 폼 텍스트 필드 요소값을 자바빈즈 매개변수로 처리한다.
	@RequestMapping(value = "/beans/register01", method = RequestMethod.POST)
	public String registerJavaBeans01(Member mem) {
		log.info("registerJavaBeans01 실행..!");
		log.info("mem.userId: " + mem.getUserId());
		log.info("mem.password: " + mem.getPassword());
		log.info("mem.coin: " + mem.getCoin());
		return "success";
	}
	
	//2) 폼 텍스트 필드 요소값을 자바빈즈 매개변수 와 기본 데이터 타입인 정수 타입 매개변수로 처리한다.
	@RequestMapping(value = "/beans/register02", method = RequestMethod.POST)
	public String registerJavaBeans02(Member mem, int coin) {
		log.info("registerJavaBeans02 실행..!");
		log.info("mem.userId: " + mem.getUserId());
		log.info("mem.password: " + mem.getPassword());
		log.info("mem.coin: " + mem.getCoin());
		log.info("coin: " + coin);
		return "success";
	}
	
	//3) 여러 개의 폼 텍스트 필드 요소값을 매개변수 순서와 상관없이 매개변수명을 기준으로 처리한다.
	@RequestMapping(value = "/beans/register03", method = RequestMethod.POST)
	public String registerJavaBeans03(Member mem, int uid) {
		log.info("registerJavaBeans03 실행..!");		
		log.info("uid: "+uid);
		log.info("mem.userId: " + mem.getUserId());
		log.info("mem.password: " + mem.getPassword());
		return "success";
	}
	
	/*
	 *  5. Date 타입 처리
	 *   - 스프링 MVC는 Date 타입의 데이터를 처리하는 여러 방법을 제공한다.
	 *   - 따로 지정하지 않으면 변환에 적합한 날짜 문자열 형식이 어떤것이 있는지 알아보자.
	 */
	//1)
	@RequestMapping(value = "/registerByGet01", method = RequestMethod.GET)
	public String registerByGet01(String userId,@DateTimeFormat(pattern = "yyyyMMdd") Date dateOfBirth) {
		log.info("registerByGet01 실행..!");		
		log.info("userId: " + userId);
		log.info("dateOfBirth: " + dateOfBirth);
		return "success";
	}
	
	@RequestMapping(value = "/registerByGet02", method = RequestMethod.GET)
	public String registerByGet02(Member mem) {
		log.info("registerByGet02 실행..!");		
		log.info("mem.userId: " + mem.getUserId());
		log.info("mem.dateOfBirth: " + mem.getDateOfBirth());
		return "success";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member mem) {
		log.info("register 실행..!");		
		log.info("mem.userId: " + mem.getUserId());
		log.info("mem.password: " + mem.getPassword());
		log.info("mem.dateOfBirth: " + mem.getDateOfBirth());
		return "success";
	}
	
	/*
	 *  6. @DateTimeFormat 어노테이션 : pattern속성값에 원하는 날짜형식을 지정할 수 있다.
	 *  
	 *  > 테스트는 /registerByGet02를 요청하고 파라미터로 받아 줄 Member 클래스의 날짜를 받는 필드의 어노테이션 설정
	 */
	
}
