package kr.or.ddit.controller.noticeboard.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.service.INoticeService;
import kr.or.ddit.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeInsertController {
	
	@Inject
	private INoticeService noticeService;
	
	@GetMapping(value = "/form.do")
	public String noticeinsertForm() {
		return "notice/form";
	}

	@PostMapping(value = "/insert.do")
	public String noticeInsert(NoticeVO noticeVo, Model model, HttpServletRequest req, RedirectAttributes ra) {
		String goPage = "";
		System.out.println("boTitle: " + noticeVo.getBoTitle());
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(noticeVo.getBoTitle())) {
			errors.put("boTitle", "제목을 입력하세요");
		}
		if(StringUtils.isBlank(noticeVo.getBoContent())) {
			errors.put("boContent", "내용을 입력하세요");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("noticeVo", noticeVo);
		}else {
//			HttpSession session = req.getSession();
//			DDITMemberVO memberVO = (DDITMemberVO)session.getAttribute("SessionInfo");
//			if(memberVO != null) {
//				noticeVo.setBoWriter(memberVO.getMemId()); // 임시로 넣어둠
			
				User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
				noticeVo.setBoWriter(user.getUsername());
				ServiceResult result = noticeService.insertNotice(noticeVo, req);
				if(result.equals(ServiceResult.OK)) {
					goPage = "redirect:/notice/detail.do?boNo="+noticeVo.getBoNo();
				}else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					goPage = "notice/form";
				}				
//			}else {
//				ra.addFlashAttribute("message","로그인 후에 사용 가능합니다!");
//				goPage = "redirect:/notice/login.do";
//			}
		}
		return goPage;
	}
	
	// 요청 uri: /notice/generalForm
	@GetMapping(value = "/generalForm")
	public String generalForm() {
		return "notice/generalForm";
	}
	
	// @ResponseBody: json, 하지만 텍스트로 리턴해줌
	@ResponseBody 
	@PostMapping(value = "/generalFormPost")
	public String generalFormPost(Model model, NoticeVO noticeVo ,HttpServletRequest req) {
		log.info("notice: "+ noticeVo);
		// 파일을 업로드할 대상
		String uploadFolder = "D:\\A_TeachingMetereal\\JspSpring\\02.Spring2\\workspace_spring2\\DevProject\\src\\main\\webapp\\resources\\upload";
		
		//파일 객체 꺼내오기
		MultipartFile[] boFile = noticeVo.getBoFile();
		
		// 파일 배열 객체로부터 파일을 하나씩 꺼내오기
		for (MultipartFile multipartFile : boFile) {
			log.info("------------------------------");
			log.info("upload file name: " + multipartFile.getOriginalFilename());
			log.info("upload file size: " + multipartFile.getSize());
			log.info("upload file contentType: " + multipartFile.getContentType());
			
			// File 객체 복사 설계(복사할 대상 경로, 파일명)
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			//연/월/일 폴더 생성
			
			// UUID처리(파일명 중복방지)
			
			// 파일 복사 실행(파일원본.transferTo(설계))
			try {
				multipartFile.transferTo(saveFile);
				return "Success";
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
				return "Failed";
			}
		}
		this.noticeService.insertNotice(noticeVo, req);
		model.addAttribute("message","등록에 성공했습니다.");
		return "Success";
	}
}
