package kr.or.ddit.controller.file.item03;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.file.item03.service.ItemService3;
import kr.or.ddit.vo.Item3;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/item3")
@Slf4j
public class FileUploadController03 {
	/*
	 * 13장 파일 업로드
	 * 
	 * 4. 비동기 방식 업로드
	 * - 비동기 방식으로 여러 개의 이미지를 업로드 하는 파일 업로드 기능을 구현한다.
	 * 
	 * 	1-1) 의존 관계 정의
	 * 	- commons-io: 파일을 처리하기 위한 의존 라이브러리
	 * 	- imgscalr-lib: 이미지 변환을 처리하기 위한 의존 라이브러리
	 * 	- jackson-databind: json 데이터 바인딩을 위한 의존 라이브러리
	 * 	*** MAVEN > Update Projects 진행하여 의존 등록
	 */
	
	// root-context.xml 에서 설정한 uploadPath 빈 등록 path경로를 사용한다.
	
	@Inject
	private ItemService3 itemService;
	
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@GetMapping(value = "/register")
	public String itemRegisterForm() {
		return "item3/register";
	}
	
	@PostMapping(value = "/uploadAjax", produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws IOException{
		log.info("fileName: " + file.getOriginalFilename());
		
		String savedName = UploadFileUtil.uploadFile(resourcePath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
	
	@PostMapping(value = "/register")
	public String item3Register(Item3 item, Model model) {
		String[] files = item.getFiles();
		
		for (int i = 0; i < files.length; i++) {
			log.info("files["+i+"]: " + files[i]);
		}
		itemService.register(item);
		model.addAttribute("msg", "등록이 완료되었습니다!");
		return "item3/success";
	}
	
	@RequestMapping(value = "/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws IOException{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("fileName: " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(resourcePath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf(".")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\" " +
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping(value = "list")
	public String item3List(Model model) {
		List<Item3> itemList = itemService.list();
		model.addAttribute("itemList", itemList);
		return "item3/list";
	}

	@GetMapping(value = "modify")
	public String item3Modify(Model model, int itemId) {
		Item3 item = itemService.read(itemId);
		model.addAttribute("item", item);
		return "item3/modify";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAttach/{itemId}")
	public List<String> getAttach(@PathVariable("itemId") int itemId){
		log.info("itemId: " + itemId);
		return itemService.getAttach(itemId);
	}
	@PostMapping(value = "/modify")
	public String item3Modify(Item3 item, Model model) {
		String[] files = item.getFiles();
		
		for (int i = 0; i < files.length; i++) {
			log.info("files["+i+"]: " + files[i]);
		}
		
		itemService.modify(item);
		model.addAttribute("msg", "수정이 완료되었습니다!");
		return "item3/success";
	}
	
	@GetMapping(value = "/remove")
	public String item3RemoveForm(int itemId, Model model) {
		Item3 item = itemService.read(itemId);
		model.addAttribute("item", item);
		
		return "item3/remove";
	}
	
	@PostMapping(value = "/remove")
	public String item3Remove(Item3 item, Model model) {
		itemService.remove(item);
		model.addAttribute("msg", "삭제가 완료되었습니다!");
		
		return "item3/success";
	}
}
