package com.flowerPot.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flowerPot.admin.commons.PageCreator;
import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.service.ABrandService;
import com.flowerPot.admin.vo.BrandVo;


@Controller
@RequestMapping("/admin")
public class AdminBrandController {

	@Autowired
	private ABrandService service; //서비스단 추가하기

	//입점 관리(목록)
	@RequestMapping("/brand")
	public void brand(Model m, SearchVO search) {
		System.out.println("호출성공");
		List<BrandVo> bList = service.getBrandList(search);
		System.out.println("호출성공");
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setArticleTotalCount(service.countBrandArticles(search));
		m.addAttribute("bList",bList);
		m.addAttribute("pc",pc);
	}
	
	/*
	//restAPI로 작동시킴
	//브랜드 추가
	//브랜드 추가 완료
	@PostMapping("/brandAdd")
	public String brandAdd(BrandVo Bv, RedirectAttributes ra) {
		service.insertBrand(Bv);
		ra.addFlashAttribute("msg","addSuccess");
		return "redirect:/admin/brand";
	}
	*/
	@RequestMapping("/brandAdd")
	public String brandAdd(Model m) {
		return"/admin/brandAdd";
	}	
	
	//브랜드 추가
	@PostMapping("/brandAdd_ok")
	@ResponseBody
	public String brandAdd(@RequestBody BrandVo brand) {
		System.out.println(brand);
		service.insertBrand(brand);
		String result = "addSuccess";
		return result;
	}	
	
	@RequestMapping("/brandInfo/{bno}")
	public String brandInfo(@PathVariable Integer bno, Model m) {
		BrandVo brand = service.getBrandInfo(bno);
		m.addAttribute("brand",brand);
		return "/admin/brandInfo";
	}
	//브랜드 정보 수정
	@RequestMapping("/brandModify")
	public String brandModify(Integer bno, Model m) {
		BrandVo brand = service.getBrandInfo(bno);
		m.addAttribute("brand",brand);
		return "/admin/brandModify";
	}
	//브랜드 정보 수정완료
	@PostMapping("/brandModifyOk")
	public String brandModifyOk(Integer bno, RedirectAttributes ra) {
		BrandVo brand = service.getBrandInfo(bno);
		service.modifyBrand(brand);
		ra.addFlashAttribute("msg","modSuccess");
		return "redirect:/admin/brandInfo?bno="+bno;
	}
	@RequestMapping("/brandDelete")
	public String brandDelete(Integer bno, RedirectAttributes ra) {
		service.deleteBrand(bno);
		ra.addFlashAttribute("msg","delSuccess");
		return "redirect:/admin/brand";
	}
	
}
