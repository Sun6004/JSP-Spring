package kr.or.ddit.vo.allform;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.vo.Address;
import kr.or.ddit.vo.Card;
import lombok.Data;

@Data
public class MemberAllForm {
	private String userId;
	private String password;
	private String userName;
	private String email;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date dateOfBirth;
	private String gender;
	private String developer;
	private boolean foreigner;
	private String[] nationality;
	private String[] cars;
	private String[] hobby;
	private Address address;
	private List<Card> cardList;
	private String introduction;
}
