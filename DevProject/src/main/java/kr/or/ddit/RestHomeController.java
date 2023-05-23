package kr.or.ddit;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

/*
 * @RestController는 @Controller와 @ResponseBody를 포함하고 있는 어노테이션이다.
 */

@RestController
@Slf4j
public class RestHomeController {

	// 반환값이 객체 타입이면 JSON 타입으로 자동 변환된다.
	@RequestMapping(value = "/goRestHome0301", method = RequestMethod.GET)
	public Member restHome0301() {
		log.info("restHome0301()실행 ..!");
		return new Member();
	}

	// 반환값이 컬렉션 list 타입이면 Json 객체 배열 타입으로 자동 반환된다.
	@RequestMapping(value = "/goRestHome0401", method = RequestMethod.GET)
	public List<Member> restHome0401() {
		log.info("restHome0401()실행 ..!");
		List<Member> list = new ArrayList<Member>();

		Member mem = new Member();
		Member mem2 = new Member();

		list.add(mem);
		list.add(mem2);
		return list;
	}

	@RequestMapping(value = "/goRestHome0501", method = RequestMethod.GET)
	public Map<String, Member> restHome0501() {
		log.info("restHome0501() 실행..!");
		Map<String, Member> map = new HashMap<String, Member>();
		Member mem = new Member();
		Member mem2 = new Member();
		map.put("key1", mem);
		map.put("key2", mem2);
		return map;
	}

	// 200 OK 상태코드를 전송한다.
	// Void 타입은 아무런 형태가 아닌데 제네릭타입의 뭔가는 채워야겠어서 채우는 placeholder같은 느낌
	@RequestMapping(value = "/goRestHome0601", method = RequestMethod.GET)
	public ResponseEntity<Void> restHome0601() {
		log.info("restHome0601() 실행..!");
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// "SUCCESS"메세지와 200 OK 상태코드를 전송한다.
	@RequestMapping(value = "/goRestHome0701", method = RequestMethod.GET)
	public ResponseEntity<String> restHome0701() {
		log.info("goHome0701()실행..!");
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}

	// 객체의 json타입의 데이터와 200 ok상태코드를 전송한다.
	@RequestMapping(value = "/goRestHome0801", method = RequestMethod.GET)
	public ResponseEntity<Member> restHome0801() {
		log.info("goHome0801()실행..!");
		Member mem = new Member();
		return new ResponseEntity<Member>(mem, HttpStatus.OK);
	}

	// 객체의 Json 객체 배열 타입의 데이터와 200 OK 상태코드를 전송한다.
	@RequestMapping(value = "/goRestHome0901", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> restHome0901() {
		List<Member> list = new ArrayList<Member>();
		Member mem = new Member();
		Member mem2 = new Member();
		list.add(mem);
		list.add(mem2);
		return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
	}

	// 객체의 Json 객체 타입의 데이터와 200 OK 상태코드를 전송한다.
	@RequestMapping(value = "/goRestHome1001", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Member>> restHome1001() {
		log.info("goHome1001()실행..!");
		Map<String, Member> map = new HashMap<String, Member>();
		Member mem = new Member();
		Member mem2 = new Member();
		map.put("key1", mem);
		map.put("key2", mem2);
		return new ResponseEntity<Map<String, Member>>(map, HttpStatus.OK);
	}
	
	// 바이트 배열로 이미지 파일의 데이터를 전송한다.
	@RequestMapping(value = "/goRestHome1101", method = RequestMethod.GET)
	public ResponseEntity<byte[]> restHome1101(){
		log.info("goRestHome1101() 실행....!");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		try {
			// 파일 경로를 나타내는 방법 2가지 ( \\ or /)
			in = new FileInputStream("D:\\img\\회사1.jpg");
			headers.setContentType(MediaType.IMAGE_JPEG);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
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
	
	// 파일의 데이터를 브라우저에서 다운로드 받도록 한다.
	@RequestMapping(value = "/goRestHome1102", method = RequestMethod.GET)
	public ResponseEntity<byte[]> restHome1102() throws IOException{
		log.info("goHome1102()실행!");
		String fileName = "data.zip";
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			in = new FileInputStream("D:\\img\\"+fileName);
			// MediaType.APPLICATION_OCTET_STREAM은 이전 파일을 위한 기본값입니다.
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"),"ISO-8859-1")+"\"");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
}
