package kr.or.ddit.controller.file.item02;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.file.item02.service.ItemService2;
import kr.or.ddit.vo.Item2;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/item2")
@Slf4j
public class FileUploadController02 {
	/*
	 * 
	 * 3. 여러개의 이미지 업로드 - 한 번에 여러 개의 이미지를 업로드하는 파일 업로드 기능을 구현한다.
	 */
	@Resource(name = "uploadPath")
	private String resourcesPath;

	@Inject
	private ItemService2 itemService;

	@GetMapping(value = "/list")
	public String list(Model model) {
		List<Item2> itemList = itemService.list();
		model.addAttribute("itemList", itemList);
		return "item2/list";
	}

	@GetMapping(value = "/register")
	public String item2RegisterForm() {
		return "item2/register";
	}

	@PostMapping(value = "/register")
	public String item2Register(Item2 item, Model model) throws IOException {
		List<MultipartFile> pictures = item.getPictures();

		for (int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);

			log.info("originName: " + file.getOriginalFilename());
			log.info("size: " + file.getSize());
			log.info("contentType: " + file.getContentType());

			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

			if (i == 0) {
				item.setPictureUrl(savedName);
			} else if (i == 1) {
				item.setPictureUrl2(savedName);
			}
		}
		itemService.register(item);
		model.addAttribute("msg", "등록이 완료되었습니다!");
		return "item2/success";
	}

	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		System.out.println("resourthPath: " + resourcesPath);
		UUID uuid = UUID.randomUUID(); // uuid파일 생성명 준비
		String createdFileName = uuid.toString() + "_" + originalName;

		File file = new File(resourcesPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		File target = new File(resourcesPath, createdFileName);
		FileCopyUtils.copy(fileData, target); // 파일 복사
		return createdFileName;
	}
	
	@GetMapping(value = "/modify")
	public String item2ModifyForm(Model model, int itemId) {
		Item2 item = itemService.read(itemId);
		model.addAttribute("item", item);
		return "item2/modify";
	}
	
	@RequestMapping(value = "/display")
	public ResponseEntity<byte[]> displayFile(int itemId) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = itemService.getPicture(itemId);
		log.info("fileName: " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") +1); //확장자 추출
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(resourcesPath + File.separator + fileName);
			if(mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return entity;
	}

	@RequestMapping(value = "/display2")
	public ResponseEntity<byte[]> displayFile2(int itemId) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = itemService.getPicture2(itemId);
		log.info("fileName: " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") +1); //확장자 추출
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(resourcesPath + File.separator + fileName);
			if(mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				in.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return entity;
	}
	
	public MediaType getMediaType(String formatName) {
		if(formatName != null) {
			if(formatName.toUpperCase().equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if(formatName.toUpperCase().equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if(formatName.toUpperCase().equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}

	@PostMapping(value = "/modify")
	public String item2Modify(Model model, Item2 item) throws IOException {
		List<MultipartFile> pictures = item.getPictures();
		
		for (int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			
			if(file != null && file.getSize()>0) {
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				if(i == 0) {
					item.setPictureUrl(savedName);
				}else {
					item.setPictureUrl2(savedName);
				}
			}
		}
		itemService.modify(item);
		model.addAttribute("msg","수정이 완료되었습니다.");
		return "item2/success";
	}
	
	@GetMapping(value = "remove")
	public String item2RemoveForm(Model model, int itemId) {
		Item2 item = itemService.read(itemId);
		model.addAttribute("item", item);
		return "item2/remove";
	}

	@PostMapping(value = "remove")
	public String item2Remove(Model model, int itemId) {
		itemService.remove(itemId);
		model.addAttribute("msg", "삭제가 완료되었습니다.");
		return "item2/success";
	}
	
}
