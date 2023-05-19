package kr.or.ddit.free.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.free.service.IFreeService;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.NoticeVO;

@Controller
@RequestMapping("/free")
public class FreeModifyController {
	
	@Inject
	private IFreeService freeService;
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String updateForm(int boNo, Model model) {
		FreeVO freeVo = freeService.select(boNo);
		model.addAttribute("free", freeVo);
		model.addAttribute("status", "u"); // u: upadate에 대한 flag
		return "free/form";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(FreeVO freeVo, Model model) {
		String goPage = "";
		ServiceResult res = freeService.update(freeVo);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/free/detail.do?boNo="+freeVo.getBoNo();
		}else {
			model.addAttribute("free", freeVo);
			model.addAttribute("status", "u");
			goPage = "free/form";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(int boNo, Model model) { //boNo는 문자열로 받지만 Spring에서 알아서 int로 형변환해줌
		String goPage = "";
		ServiceResult res = freeService.delete(boNo);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/free/list.do";
		}else {
			goPage = "redirect:/free/detail.do?boNo="+boNo;			
		}
		return goPage;
	}
}
