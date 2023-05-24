package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileMember {
	private String userId;
	private String password;
	private MultipartFile picture;
}
