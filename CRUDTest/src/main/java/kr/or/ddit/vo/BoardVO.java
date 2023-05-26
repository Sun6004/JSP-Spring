package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bono;
	private String botitle;
	private String bocontent;
	private String bowriter;
	private Date bodate;
	private int bohit;
}
