package kr.or.ddit.vo;

import lombok.Data;

@Data //getter/setter를 자동으로 만들어주는 어노테이션 (lombok 라이브러리 사용)
public class BoardVO {
	private int boNo; 
	private String boTitle;
	private String boWriter;
	private String boContent;
	private String boDate;
	private int boHit;
	
}
