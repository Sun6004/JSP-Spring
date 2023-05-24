package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Card {
	private String no;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date validMonth;
}
