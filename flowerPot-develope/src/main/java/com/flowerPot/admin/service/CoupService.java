package com.flowerPot.admin.service;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.vo.MemberVo;

public interface CoupService {

	void couponRegist(CoupVo coupon);

	List<CoupVo> selectCoupList(SearchVO search);

	MemberVo selectMemOne(String id);

	Integer countCouponArticles(SearchVO search);

	void insertCouponToMember(String id, Integer couNo,Integer radio);

	List<CoupVo> selectCoupList(Integer mno);

}
