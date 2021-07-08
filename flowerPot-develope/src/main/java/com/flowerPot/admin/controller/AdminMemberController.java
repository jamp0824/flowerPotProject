package com.flowerPot.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flowerPot.admin.commons.PageCreator;
import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.service.MemService;
import com.flowerPot.brand.service.BrandService;
import com.flowerPot.vo.BrandVo;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	private MemService service;
	@Autowired
	private BrandService brandService;

	
	//회원 관리(목록)
	@RequestMapping("/member")
	public void memList(SearchVO search, Model model) {
		System.out.println("찾아옴");
		System.out.println(search);
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		List<MemberVo> mList = service.getArticleList(search);
		pc.setArticleTotalCount(service.countArticles(search));
		
		List<BrandVo> blist = brandService.selectListAllBrand();
		
		model.addAttribute("blist", blist);
		model.addAttribute("mList", mList);
		model.addAttribute("pc", pc);
	}
	
	//회원 탈퇴
	@RequestMapping("/member_delete")
	public String memDelete(Integer mno) {
		service.deleteMember(mno);
		
		return "redirect:/admin/member";
	}
	
	//회원 탈퇴 복구
	@RequestMapping("/member_restore")
	public String memRestore(Integer mno) {
		service.restoreMember(mno);
		
		return "redirect:/admin/member";
	}
	
}
