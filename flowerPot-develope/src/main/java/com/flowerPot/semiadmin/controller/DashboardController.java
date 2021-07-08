package com.flowerPot.semiadmin.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flowerPot.cosmetic.service.CosmeticService;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.semiadmin.model.SemiNoticeVO;
import com.flowerPot.semiadmin.service.ISemiNoticeService;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("/semiadmin")
public class DashboardController {

	@Autowired
	private ISemiNoticeService service;
	@Autowired
	private CosmeticService cosmeticService;
	@Autowired
	private MemberService memberService;


	// 회원 정보 시큐리티에서 가져오기
	public MemberVo getMemberBysecurity(Principal principal) {
		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			String id = principal.getName();
			memberVo = memberService.selectOneMemberById(id);   // 회원정보 가져오기
		}
		return memberVo;
	}

	// { dashboard _ main }
	@RequestMapping("/dashboard")
	public void dashboard(Principal principal, Model model) {
		System.out.println("dashboard 실행중..");
		MemberVo member= getMemberBysecurity(principal);
		// { semi _ notice 같은 게시물 띄우게 하기 }
		List<SemiNoticeVO> blist = service.getArticles();
		model.addAttribute("member", member);
		model.addAttribute("blist", blist);

	}


}
