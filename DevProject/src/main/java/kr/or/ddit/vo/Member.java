package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Member {
	private String userName = "hong";
	private String password = "123";
	private String userId = "h001";
	private int coin = 100;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date dateOfBirth;
	private Address address;
	private List<Card> cardList;
}
