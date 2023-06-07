package kr.or.ddit.vo;

import lombok.Data;

@Data
public class Item3 {
	private int itemId;
	private String itemName;
	private int price;
	private String description;
	private String[] files;
}
