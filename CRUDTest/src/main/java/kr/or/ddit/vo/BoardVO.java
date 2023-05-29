package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int boNo;
	private String boTitle;
	private String boContent;
	private String boWriter;
	private Date boDate;
	private int boHit;
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoWriter() {
		return boWriter;
	}
	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}
	public Date getBoDate() {
		return boDate;
	}
	public void setBoDate(Date boDate) {
		this.boDate = boDate;
	}
	public int getBoHit() {
		return boHit;
	}
	public void setBoHit(int boHit) {
		this.boHit = boHit;
	}
	

}
