package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Item {
	private int itemId;
	private String itemName;
	private int price;
	private String description;
	private MultipartFile picture;
	private String pictureUrl;
}
