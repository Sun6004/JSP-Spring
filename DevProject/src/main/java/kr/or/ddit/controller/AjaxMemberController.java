package kr.or.ddit.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.Card;
import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/ajax")
@Slf4j
public class AjaxMemberController {
	
	// Ajax방식 요청 처리 페이지
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String ajaxRegisterForm() {
		log.info("ajaxRegisterForm start..!");
		return "member/ajaxRegisterForm";
	}
	
	//1) url 경로 상의 경로 변수값을 @PathVariable 어노테이션을 지정하여 문자열 매개변수로 처리한다.
	@RequestMapping(value = "/register/{userId}")
	public ResponseEntity<String> ajaxRegister01(@PathVariable("userId") String userId){
		log.info("userId: " + userId);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}

	//2) URL 경로 상의 여러개의 경로 변수값을 @PathVariable 어노테이션을 지정하여 여러개의 문자열 매개변수로 처리한다. 
	@RequestMapping(value = "/register/{userId}/{password}")
	public ResponseEntity<String> ajaxRegister02(@PathVariable("userId") String userId, @PathVariable("password") String password){
		log.info("userId: " + userId);
		log.info("password: " + password);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	//3) 객체 타입의 json 요청 데이터 @RequestBody 어노테이션을 지정하여 자바빈즈 매개변수로 처리한다. 
	@RequestMapping(value = "/register03", method = RequestMethod.POST)
	public ResponseEntity<String> ajaxRegister03(
			@RequestBody Member mem){
		log.info("ajaxRegister03 start.....!");
		log.info("userId: " + mem.getUserId());
		log.info("password: " + mem.getPassword());
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	//4) 객체 타입의 json 요청 데이터는 문자열 매개변수로 처리할 수 없다. 
	@RequestMapping(value = "/register04", method = RequestMethod.POST)
	public ResponseEntity<String> ajaxRegister04(String userId){
		// userId는 요청본문에서 데이터를 바인딩해 받아오지 못하므로  null이 뜬다.
		// 요청 본문에서 데이터를 가져오려면 @RequestBody 어노테이션을 꼭 붙여주어야만 한다.
		log.info("ajaxRegister04 start.....!");
		log.info("userId: " + userId);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	//5) 요청 URL에 쿼리 파라미터를 붙여서 전달하면 문자열 매개변수로 만들 수 있다.
	@RequestMapping(value = "/register05", method = RequestMethod.POST)
	public ResponseEntity<String> ajaxRegister05(String userId, String password){
		// userId는 쿼리스트링에 담겨져 오는 데이터이기 때문에, 일반적인 방식으로도 데이터를 받을 수 있지만,
		// password는 요청본문에서 데이터를 바인딩해 받아오지 못하므로  null이 뜬다.
		log.info("ajaxRegister05 start.....!");
		log.info("userId: " + userId);
		log.info("password: " + password);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	//6) 객체 타입의 JSON 요청 데이터를 @PathVariable 어노테이션을 지정한 문자열 매개변수와 @RequestBody 어노테이션을 지정한 자바빈즈 매개변수로 처리한다.
	@RequestMapping(value = "/register06/{userId}", method = RequestMethod.POST)
	public ResponseEntity<String> ajaxRegister06(@PathVariable("userId")String userId, @RequestBody Member mem){
		// userId는 쿼리스트링에 담겨져 오는 데이터이기 때문에, 일반적인 방식으로도 데이터를 받을 수 있지만,
		// password는 요청본문에서 데이터를 바인딩해 받아오지 못하므로  null이 뜬다.
		log.info("ajaxRegister06 start.....!");
		log.info("userId: " + userId);
		log.info("memeber.userId: " + mem.getUserId());
		log.info("memeber.password: " + mem.getPassword());
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	//7) 객체 배열 타입의 json 요청 데이터를 자바빈즈 요소를 가진 리스트 컬렉션 매개변수에 @RequestBody 어노테이션을 지정하여 처리한다.
	@RequestMapping(value = "/register07", method = RequestMethod.POST)
	public ResponseEntity<String> ajaxRegister07(
			@RequestBody List<Member> memList){
		// 비동기 처리시, List컬렉션으로 데이터를 받을떄에는 @RequestBody라는 어노테이션을 이용하여 바인딩한다.
		// 동기 처리시에는 컨트롤러 메서드 내에서 List 타입으로 값을 바인딩 할 수 없지만, 객체 내 존재하는 List타입으로는 데이터를 바인딩 할 수 있다.
		// 동기와 비동기 처리시의 차이점을 꼭 기억하자
		log.info("ajaxRegister07 start.....!");
		for (Member member : memList) {
			log.info("memeber.userId: " + member.getUserId());
			log.info("memeber.password: " + member.getPassword());			
		}
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	//8) 중첩된 객체 타입의 JSON 요청 데이터를 @RequestBody어노테이션을 지정하여 중첩된 자바빈즈 매개변수로 처리한다.
	@RequestMapping(value = "/register08", method = RequestMethod.POST)
	public ResponseEntity<String> register08(@RequestBody Member mem){
		log.info("register08 start.....!");
		log.info("userId: " + mem.getUserId());
		log.info("password: " + mem.getPassword());
		
		Address addr = mem.getAddress();
		if(addr != null) {
			log.info("postCode: " + addr.getPostCode());
			log.info("location: " + addr.getLocation());
		}else {
			log.info("address is null");
		}
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}

	//9) 중첩된 객체 타입의 JSON 요청 데이터를 @RequestBody어노테이션을 지정하여 중첩된 자바빈즈 매개변수로 처리한다.(List)
	@RequestMapping(value = "/register09", method = RequestMethod.POST)
	public ResponseEntity<String> register09(@RequestBody Member mem){
		log.info("register08 start.....!");
		log.info("userId: " + mem.getUserId());
		log.info("password: " + mem.getPassword());
		
		List<Card> cardList = mem.getCardList();
		
		if(cardList != null) {
			for (Card card : cardList) {
				log.info("cardNo: " + card.getNo());
				log.info("validMonth: " + card.getValidMonth());				
			}
		}else {
			log.info("cardList is null");
		}
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
}
