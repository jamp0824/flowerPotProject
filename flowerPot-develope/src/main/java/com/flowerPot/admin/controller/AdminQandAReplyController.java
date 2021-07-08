package com.flowerPot.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flowerPot.admin.dao.CReplyMapper;
import com.flowerPot.admin.vo.ReplyVo;

@Controller
@RequestMapping("/comments") //replies 매핑주소 등록
public class AdminQandAReplyController {
	
	@Autowired
	private CReplyMapper service;

	//댓글작성 페이지
	@RequestMapping("/q&aComnt_write/{ccno}")//post로 접근하는 매핑주소 
	public String register(@PathVariable Integer ccno, Model m){ 
		System.out.println("register호출됨");
		System.out.println(ccno);
		m.addAttribute("ccno",ccno);
		return "/admin/q&aComnt_write"; 
	}//register()
	
	//댓글등록
	@RequestMapping("/q&aComnt_write_ok")//post로 접근하는 매핑주소 
	public String registerOk(ReplyVo rpl){ 
		System.out.println("여기까지 진행됨?");
		Integer ccno = rpl.getCcno();
		service.insertReply(rpl);
		return "redirect:/admin/customer/q&a_content/"+ccno; 
	}//register()
	
	//댓글조회는 AdminQandA컨트롤러에서 진행
	
	//댓글수정
	@RequestMapping("/q&aComnt_modify")
	public String modifyQandACmnt(ReplyVo rpl,Integer rno, Model m) {
		System.out.println(rno);
		System.out.println(service.getReplyCont(rno));
		m.addAttribute("reply",service.getReplyCont(rno));
		return "/admin/q&aComnt_modify";
	}
	//댓글수정확인
	@RequestMapping("/q&aComnt_modify_ok")
	public String modifyQandACmntOk(ReplyVo rpl,Integer ccno) {
		service.updateReply(rpl);
		return "redirect:/admin/customer/q&a_content/"+ccno;
	}
	

}
