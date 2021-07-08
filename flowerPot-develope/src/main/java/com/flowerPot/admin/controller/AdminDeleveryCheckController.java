package com.flowerPot.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flowerPot.admin.vo.MemberDeliveryVo;
import com.flowerPot.delivery.service.DeliveryService;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.vo.DeliveryVo;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminDeleveryCheckController {
	
/*	@Autowired
	private DeliveryMapper service;*/
	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private DeliveryService deliveryService;
	
	@RequestMapping("/delivery")
	public void delivery() {
		
	}
	
	
	//회원정보를 조회한다. 구매내역을 조회한다.
	@RequestMapping("/delivery/{id}")
	@ResponseBody
	public Map<String, Object> searchId(Model model,@PathVariable String id/*HttpServletRequest request*/) {
//		String id = request.getParameter("id"); 
		System.out.println("searchId()메서드 접근!");
//		MemberVo mv = service.selectMemOne(id);
//		MemberVo mv = service.selectDeliveryIdInfo(id);
		MemberVo member = memberSerivce.selectOneDeliMemById(id);
		DeliveryVo delivery = deliveryService.selectMemDeliIdInfo(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("delivery", delivery);
	
		return map;
	}
	
	
}
