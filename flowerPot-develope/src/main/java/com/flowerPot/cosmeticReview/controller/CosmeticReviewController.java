package com.flowerPot.cosmeticReview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.flowerPot.cosmeticReview.service.CosmeticReviewService;
import com.flowerPot.vo.CosmeticReviewVo;

import lombok.extern.slf4j.Slf4j;

@Controller	
@Slf4j
public class CosmeticReviewController {

	@Autowired
	private CosmeticReviewService cosmeticReviewService;
	
	@RequestMapping("cosmeticReviewRegister")
	public String cosmeticReviewRegister(CosmeticReviewVo cosmeticReview) {
		// 너가 썼냐 이 제품을 샀냐 안샀냐?
		log.info("cosmeticReview:"+cosmeticReview.toString());
		cosmeticReviewService.insertcosmeticReview(cosmeticReview);
		return "redirect:/cosmetic/cosmetic?cno="+cosmeticReview.getCno();
	}
	

}
