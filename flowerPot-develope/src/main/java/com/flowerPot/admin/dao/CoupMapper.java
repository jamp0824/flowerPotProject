package com.flowerPot.admin.dao;

import java.util.List;
import java.util.Map;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.vo.HasCouponVo;
import com.flowerPot.vo.MemberVo;

public interface CoupMapper {

	void couponRegist(CoupVo coupon);
	
	List<CoupVo> selectCoupList(SearchVO search);
	
	MemberVo selectMemOne(String id);
	
	Integer countCouponArticles(SearchVO search);
	
	void insertCouponToMember(Integer mno, Integer couNo);

	void insertCouponAll(Integer couNo);

	void insertCouponToMember(Map<String, Object> map);

	List<HasCouponVo> selectListHasCoupListByMno(Integer mno);

	CoupVo selectCoupListByCouno(Integer couno);

	CoupVo selectOneCouponByName(String couponName);

	void deleteCoupon(HasCouponVo hc);

	List<CoupVo> selectListCoupoBymno(Integer mno);

}
