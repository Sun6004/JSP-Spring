package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Item2 {
	private int itemId;
	private String itemName;
	private int price;
	private String description;
	private List<MultipartFile> pictures;
	private String pictureUrl;
	private String pictureUrl2;
}
