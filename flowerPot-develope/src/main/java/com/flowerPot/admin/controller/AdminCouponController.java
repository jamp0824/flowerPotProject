package com.flowerPot.admin.controller;

import java.time.LocalDate;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flowerPot.admin.commons.PageCreator;
import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.service.CoupService;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminCouponController {
	
	@Autowired
	private CoupService service;
	
	@RequestMapping("/coupon")
	public void coupon(Model model,SearchVO search) {
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		List<CoupVo> cList = service.selectCoupList(search);
		pc.setArticleTotalCount(service.countCouponArticles(search));
		model.addAttribute("cList",cList);
		model.addAttribute("pc",pc);
	}
	
	@RequestMapping("/couponRegist")
	public String couponRegist( CoupVo coupon, 
								@RequestParam("startPDate") String startPDate, 
								@RequestParam("endPDate") String endPDate) {

		//String 날짜데이터 형태를 "yyyy-MM-dd"로 포맷하기위해 지정
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		//String StartPDate의 날짜를 formatter객체인 yyyy-MM-dd 형태로포맷 후 시 분 초 인스턴스를 생성 
		coupon.setStartDate(LocalDate.parse(startPDate, formatter).atTime(0, 0, 0));
		coupon.setEndDate(LocalDate.parse(endPDate, formatter).atTime(0, 0, 0)); //.atTime() : localDateTime 시 분 초 인스턴스 생성

			service.couponRegist(coupon);
			
		return "redirect:/admin/coupon";
	}
	
	@RequestMapping("/coupon/{id}")
	@ResponseBody
	public MemberVo searchId(@PathVariable String id/*HttpServletRequest request*/) {
		//String id = request.getParameter("id"); 
		System.out.println("searchId()메서드 접근!");
		MemberVo mv = service.selectMemOne(id);
		System.out.println(mv);
		return mv;
	}
	/*
	public ResponseEntity<MemberVo> searchId(@PathVariable String id) {
		System.out.println("searchId()메서드 접근!");
		MemberVo mv = service.selectMemOne(id);
		System.out.println(mv);
		return new ResponseEntity<MemberVo>(mv, HttpStatus.OK);
	}*/
	
	@RequestMapping("/couponRegistToMember")
	public String couponRegistToMember(String id, Integer couNo, Integer radio) {
		Log.info("couNo:"+couNo);
		
		service.insertCouponToMember(id,couNo,radio);
		return "redirect:/admin/coupon";
	}
}
