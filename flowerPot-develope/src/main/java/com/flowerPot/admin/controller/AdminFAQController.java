package com.flowerPot.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flowerPot.admin.commons.PageCreator;
import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.service.CFaQService;
import com.flowerPot.admin.vo.CustomerVo;

@Controller
@RequestMapping("/admin/customer")
public class AdminFAQController {
	
	@Autowired
	private CFaQService service;
	
	//FAQ 목록 페이지
	@RequestMapping("/faq")
	public String faq(CustomerVo faq,SearchVO search, Model model) {
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		List<CustomerVo> fList = service.selectFaQList(search);
		pc.setArticleTotalCount(service.countFAQArticles(search)); //페이징처리를 위한 게시글 갯수
		model.addAttribute("fList",fList);
		model.addAttribute("pc",pc);
		return "/admin/faq";
	}

	//FAQ 등록 페이지
	@RequestMapping("/faq_write")
	public String faq_write(CustomerVo faq) {
		System.out.println(faq);
		return "/admin/faq_write";
		
	}
	//FAQ 등록 작업
	@RequestMapping("/faq_write_ok")
	public String faq_write_ok(CustomerVo faq, RedirectAttributes ra) {
		
		System.out.println(faq);
		service.insertFaQ(faq);
		ra.addFlashAttribute("msg","writeSuccess");
		return "redirect:/admin/customer/faq";

	}
	//FAQ 내용보기
	@RequestMapping("/faq_content/{ccno}")
	public String faq_content(@PathVariable Integer ccno,Model model) {
		CustomerVo faq = service.getFaQCont(ccno);
		model.addAttribute("faq",faq);
		return "/admin/faq_content";
	}
	
	//FAQ 수정 페이지
	@RequestMapping("/faq_modify")
	public String faq_modify(Integer ccno,Model model) {
		CustomerVo faq = service.getFaQCont(ccno);
		model.addAttribute("faq",faq);
		return "/admin/faq_modify";
	}
	//FAQ 수정 완료 작업
	@RequestMapping("/faq_modify_ok")
	public String faq_modify_ok(CustomerVo faq, RedirectAttributes ra) {
		System.out.println(faq);
		service.modifyFaQ(faq);
		ra.addFlashAttribute("msg","modSuccess");
		return "redirect:/admin/customer/faq";
	}
	//FAQ 삭제 작업
	@RequestMapping("/faq_del")
	public String faq_del(Integer ccno, RedirectAttributes ra) {
		service.delFaQ(ccno);
		ra.addFlashAttribute("msg","delSuccess");
		return "redirect:/admin/customer/faq";
	}
}
