package com.flowerPot.lastAdmin.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flowerPot.brand.repository.BrandDao;
import com.flowerPot.coupon.repository.CouponDao;
import com.flowerPot.coupon.repository.HasCouponDao;
import com.flowerPot.dao.AuthorityDao;
import com.flowerPot.domain.MyCriteria;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.vo.BrandVo;
import com.flowerPot.vo.CouponVo;
import com.flowerPot.vo.HasCouponVo;
import com.flowerPot.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("lastAdmin")
@Slf4j
public class LastAdminController {

	@Autowired
	private BrandDao brandDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private HasCouponDao hasCouponDao;
	@Autowired
	private AuthorityDao authorityDao;
	
	// 관리자 메인페이지
	@RequestMapping("home")
	public void home() {
		
	}
	
	// 브랜드관리 메인페이지
	@RequestMapping("brandManage")
	public void brandManage(Model model) {
		List<BrandVo> bList = brandDao.selectListAllBrand();
		
		model.addAttribute("bList", bList);
	}
	
	// 브랜드 등록
	@RequestMapping("brandRegister_ok")
	public String brandRegister_ok(BrandVo brand) {
		brandDao.insertBrand(brand);
		return "redirect:/lastAdmin/brandManage";
	}
	
	
	// 회원관리
	@RequestMapping("memberManage")
	public void memberManage(MyCriteria myCriteria, Model model) {
		myCriteria.addMinMaxNum();
		List<MemberVo> mList = memberDao.selectListAll(myCriteria);
		for(MemberVo member : mList) {
			member.setAuthList(authorityDao.selectAuthList(member.getId()));
		}
		int totalCount = memberDao.selectTotalCount();
		myCriteria.calPageInfo(totalCount);
		
		List<BrandVo> bList = brandDao.selectListAllBrand();
		
		model.addAttribute("bList", bList);
		model.addAttribute("myCriteria", myCriteria);
		model.addAttribute("mList", mList);
	}
	
	// 권한부여
	@RequestMapping("insertAuthority")
	public String insertAuthority(Integer mno, String id, String authority, String brand) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(authority.equals("ROLE_BRAND")) {
			map.put("id", id);
			map.put("authority", authority);
			map.put("brand", brand);
		}else {
			map.put("id", id);
			map.put("authority", authority);
		}
		authorityDao.insertAuthorityById(map);
		return "redirect:/lastAdmin/memberManage";
	}
	
	// 쿠폰관리
	@RequestMapping("couponManage")
	public void couponManage(Model model) {
		List<CouponVo> cplist = couponDao.selectListAll();
		
		model.addAttribute("cplist",cplist);
	}
	
	// 쿠폰등록
	@RequestMapping("couponRegister")
	public String couponRegister(CouponVo coupon, String startDate, String endDate) {
		log.info("쿠폰삽입 : " + coupon);
		log.info("startDate : " + startDate);
		log.info("endDate : " + endDate);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate temp = LocalDate.parse(startDate, formatter);
		coupon.setStart_date(temp.atStartOfDay());
		temp = LocalDate.parse(endDate, formatter);
		coupon.setEnd_date(temp.atStartOfDay());
		couponDao.insertCoupon(coupon);
		
		return "redirect:/lastAdmin/couponManage";
	}
	
	// 고객센터
	@RequestMapping("customerCenter")
	public void customerCenter() {
		
	}
	
	@RequestMapping("isMember")
	@ResponseBody
	public ResponseEntity<String> isMember(String id) {
		MemberVo member = memberDao.selectOneMemberById(id);
		if(member==null) {
			return new ResponseEntity<String>("null", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("exist", HttpStatus.OK);
		}
	}
	
	// 회원 추가
	@RequestMapping("memberAdd")
	@ResponseBody
	public ResponseEntity<MemberVo> memberAdd(String id) {
		
		MemberVo member = memberDao.selectOneMemberById(id);
		
		return new ResponseEntity<MemberVo>(member, HttpStatus.OK);
		
	}
	
	// 쿠폰 배포
	@RequestMapping("couponDeploy")
	@ResponseBody
	public ResponseEntity<String> couponDeploy(@RequestBody Map<String, Object> map) {
		List<Integer> list = (List<Integer>) map.get("memberArray");
		Integer couNo = (Integer) map.get("couNo");
		Integer kinds = (Integer) map.get("kinds");
		try {
			if(kinds==1) {
				List<Integer> mnolist = memberDao.selectMnoList();
				for(Integer mno : mnolist) {
					HasCouponVo hc = new HasCouponVo();
					hc.setCouNo(couNo);
					hc.setMno(mno);
					hasCouponDao.insertOne(hc);
				}
			}else {
				for(Integer mno : list) {
					HasCouponVo hc = new HasCouponVo();
					hc.setCouNo(couNo);
					hc.setMno(mno);
					hasCouponDao.insertOne(hc);
				}
			}
		} catch (Exception e) {
			return new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
}
