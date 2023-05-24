package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MultiFileMember {
	private String userId;
	private String password;
	private List<MultipartFile> pictureList;
}
