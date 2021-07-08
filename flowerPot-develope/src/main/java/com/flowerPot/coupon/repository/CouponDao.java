package com.flowerPot.coupon.repository;

import java.util.List;

import com.flowerPot.vo.CouponVo;

public interface CouponDao {

	List<CouponVo> selectListAll();

	void insertCoupon(CouponVo coupon);

}
