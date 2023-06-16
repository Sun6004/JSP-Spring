package kr.or.ddit.vo;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeFileVO {
	private MultipartFile item;
	private Integer boNo;
	private Integer fileNo;
	private String fileName;
	private long fileSize;
	private String fileFancysize;
	private String fileMime;
	private String fileSavepath;
	private int fileDowncount;
	
	public NoticeFileVO() {}
	
	public NoticeFileVO(MultipartFile item) {
		this.item = item;
		this.fileName = item.getOriginalFilename();
		this.fileSize = item.getSize();
		this.fileMime = item.getContentType();
		
		// kb, mb, gb 형태로 근사값에 맞춰서 나타내준다.
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);
	}
}
