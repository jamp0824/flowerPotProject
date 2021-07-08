package com.flowerPot.admin.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flowerPot.admin.commons.PageCreator;
import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.service.MemService;
import com.flowerPot.admin.vo.EmpVo;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminTestController {
	
	@Autowired
	private MemService service;
	
	//종합 현황
	@RequestMapping("/dashboard")
	public void dashboard() {
	}
	
	
	@RequestMapping("/inventory")
	public void template() {
		
	}
	

	
	@RequestMapping("/icons")
	public void upgrade() {
		
	}
	
	@RequestMapping("/notifications")
	public void notifications() {
		
	}
	
}
