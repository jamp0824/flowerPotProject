package com.flowerPot.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.flowerPot.admin.service.BrandCheckService;

@RestController
@RequestMapping("/admin")
public class AdminBrandCheckController {

	@Autowired
	private BrandCheckService service;
	
	//회사명 중복체크
	@PostMapping("/cmpnyCheck")
	public String companyCheck(@RequestBody String company){
		System.out.println("check");
		int checkNum = service.compCheck(company);
		System.out.println(checkNum);
		String result = null;
		if(checkNum == 1) {
			System.out.println("회사명 중복됨!");
			result = "NO"; 
		}else {
			System.out.println("회사명 사용 가능!");
			result = "OK";
		}
		return result;
	}
	
	//브랜드명 중복체크
	@PostMapping("/bNameCheck")
	public String brandNameCheck(@RequestBody String bName){
		System.out.println("check");
		int checkNum = service.brandCheck(bName);
		System.out.println(checkNum);
		String result = null;
		if(checkNum == 1) {
			System.out.println("브랜드명 중복됨!");
			result = "NO"; 
		}else {
			System.out.println("브랜드명 사용 가능!");
			result = "OK";
		}
		return result;
	}
	
	//사업자번호 중복체크
	@PostMapping("/busNoCheck")
	public String busNoCheck(@RequestBody String busNo){
		System.out.println("check");
		int checkNum = service.busNoCheck(busNo);
		System.out.println(checkNum);
		String result = null;
		if(checkNum == 1) {
			System.out.println("사업자번호 중복됨!");
			result = "NO"; 
		}else {
			System.out.println("사업자번호 사용 가능!");
			result = "OK";
		}
		return result;
	}
	
	//전화번호 중복체크
	@PostMapping("/telCheck")
	public String telCheck(@RequestBody String tel){
		System.out.println("check");
		int checkNum = service.telCheck(tel);
		System.out.println(checkNum);
		String result = null;
		if(checkNum == 1) {
			System.out.println("전화번호 중복됨!");
			result = "NO"; 
		}else {
			System.out.println("전화번호 사용 가능!");
			result = "OK";
		}
		return result;
	}
	
	//이메일 중복체크
	@PostMapping("/emailCheck")
	public String emailCheck(@RequestBody String email){
		System.out.println("check");
		int checkNum = service.emailCheck(email);
		System.out.println(checkNum);
		String result = null;
		if(checkNum == 1) {
			System.out.println("이메일 중복됨!");
			result = "NO"; 
		}else {
			System.out.println("이메일 사용 가능!");
			result = "OK";
		}
		return result;
	}
}
