package com.flowerPot.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CouponVo {

	private Integer couNo;
	private String couponName;
	private int discountMoney;
	private int discountPercent;
	private LocalDateTime start_date;
	private LocalDateTime end_date;
	private Boolean enable;
}
