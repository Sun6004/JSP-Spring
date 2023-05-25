package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.Card;
import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ModelMemberController {
	/*
	 * 6장. 데이터 전달자 모델
		-Model 객체 이용
		
		1) 매개변수에 선언된 model 객체의 addAttribute() 메서드를 호출하여 데이터를 view에 전달한다
	 */
	@RequestMapping(value = "/read01", method = RequestMethod.GET)
	public String read01(Model model) {
		log.info("read01 start...!");
		
		model.addAttribute("userId","lee");
		model.addAttribute("password", "1234");
		model.addAttribute("email", "sadad@asd.com");
		model.addAttribute("username", "성일");
		model.addAttribute("birthDay", "1999-99-99");
		return "member/read01";
	}
	
	//2) Model 객체에 자바빈즈 클래스 객체를 값으로만 전달할 때는 뷰에서 참조할 이름을 클래스명의 앞글자를 소문자로 변환하여 처리한다.
	@RequestMapping(value = "/read02", method = RequestMethod.GET)
	public String read02(Model model) {
		Member member = new Member();
		member.setUserId("lee");
		member.setPassword("123");
		member.setEmail("asd@asd.com");
		member.setUserName("sad");
		member.setBirthDay("1999-99-99");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 1999);
		cal.set(Calendar.MONTH, 10);
		cal.set(Calendar.DAY_OF_MONTH, 9);
		
		member.setDateOfBirth(cal.getTime());
		model.addAttribute(member);
		return "member/read02";
	}
	
	// 3) Model 객체에 자바빈즈 클래스 객체를 특정한 이름을 지정하여 전달할 수 있다.
	@RequestMapping(value = "/read03", method = RequestMethod.GET)
	public String read03(Model model) {
		Member member = new Member();
		member.setUserId("lee");
		member.setPassword("123");
		member.setEmail("asd@asd.com");
		member.setUserName("sad");
		member.setBirthDay("1999-99-99");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 1999);
		cal.set(Calendar.MONTH, 10);
		cal.set(Calendar.DAY_OF_MONTH, 9);
		
		member.setDateOfBirth(cal.getTime());
		model.addAttribute("user",member);
		return "member/read03";
	}
	
	// 4) Model 객체를 통해 배열과 컬렉션 객체를 전달할 수 있다.
	@RequestMapping(value = "/read04", method = RequestMethod.GET)
	public String read04(Model model) {
		log.info("read04 start...!");
		String[] carArray = {"jeep", "bmw"};
		
		List<String> carList = new ArrayList<String>();
		carList.add("jeep");
		carList.add("volvo");
		
		String[] hobbyArray = {"music","movie"};
		
		List<String> hobbyList = new ArrayList<String>();
		hobbyList.add("game");
		hobbyList.add("music");
		
		model.addAttribute("carArray", carArray);
		model.addAttribute("carList", carList);
		model.addAttribute("hobbyArray", hobbyArray);
		model.addAttribute("hobbyList", hobbyList);
		return "member/read04";
	}
	
	//5) Model 객체를 통해 중첩된 자바빈즈 클래스 객체를 전달할 수 있다.
	@RequestMapping(value = "/read05", method = RequestMethod.GET)
	public String read05(Model model) {
		Member mem = new Member();
		
		Address addr = new Address();
		addr.setPostCode("123123");
		addr.setLocation("Seoul");
		
		mem.setAddress(addr);
		
		List<Card> cardList = new ArrayList<Card>();
		Card card1 = new Card();
		card1.setNo("122321");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 2020);
		cal.set(Calendar.MONTH, 9);
		cal.set(Calendar.DAY_OF_MONTH, 2);
		card1.setValidMonth(cal.getTime());
		
		cardList.add(card1);

		Card card2 = new Card();
		card2.setNo("999999");
		cal.set(Calendar.YEAR, 2020);
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DAY_OF_MONTH, 9);
		card2.setValidMonth(cal.getTime());
		
		cardList.add(card2);
		mem.setCardList(cardList);
		model.addAttribute("user", mem);
		return "member/read05";
	}
	
	//6) Model 객체를 통해 다양한 타입의 값을 전달할 수 있다.
	@GetMapping(value = "/read06")
	public String read06(Model model) {
		log.info("read06 start...!");
		
		Member mem = new Member();
		mem.setUserId("lee");
		mem.setPassword("123");
		mem.setEmail("asd@asd.com");
		mem.setBirthDay("2023-01-01");
		mem.setGender("male");
		mem.setDeveloper("y");
		mem.setForeigner(true);
		mem.setNationality("korea");
		mem.setCars("bmw");
		
		String[] carArray = {"bmw", "benz"};
		mem.setCarArray(carArray);
		
		List<String> carList = new ArrayList<String>();
		carList.add("audi");
		carList.add("benz");
		mem.setCarList(carList);
		mem.setHobby("kill");
		
		String[] hobbyArray = {"Movie", "Game"};
		mem.setHobbyArray(hobbyArray);
		
		List<String> hobbyList = new ArrayList<String>();
		hobbyList.add("die");
		hobbyList.add("travel");
		mem.setHobbyList(hobbyList);
		
		Address addr = new Address();
		addr.setPostCode("123213");
		addr.setLocation("hell");
		mem.setAddress(addr);
		
		List<Card> cardList = new ArrayList<Card>();
		Card card1 = new Card();
		card1.setNo("122321");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 2020);
		cal.set(Calendar.MONTH, 9);
		cal.set(Calendar.DAY_OF_MONTH, 2);
		card1.setValidMonth(cal.getTime());
		
		cardList.add(card1);

		Card card2 = new Card();
		card2.setNo("999999");
		cal.set(Calendar.YEAR, 2020);
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DAY_OF_MONTH, 9);
		card2.setValidMonth(cal.getTime());
		
		cardList.add(card2);
		mem.setCardList(cardList);
		
		mem.setBirthDay("1000-01-01");
		mem.setDateOfBirth(cal.getTime());
		mem.setIntroduction("ㅎㅇ?");
		model.addAttribute("user",mem);
		
		return "member/read06";
	}
}
