package com.flowerPot.admin.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CoupVo {
	private Integer couNo;
	private Integer mno;
	private String couponName;
	private Integer discountMoney;
	private Integer discountPercent;
	private LocalDateTime startDate;
	private LocalDateTime endDate;
	private Boolean enable;
	
	/*
	@Override
	public String toString() {
		return "CoupVo [couNo=" + couNo + ", couponName=" + couponName + ", discountMoney=" + discountMoney
				+ ", discountPercent=" + discountPercent + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	public Integer getCouNo() {
		return couNo;
	}
	public void setCouNo(Integer couNo) {
		this.couNo = couNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public Integer getDiscountMoney() {
		return discountMoney;
	}
	public void setDiscountMoney(Integer discountMoney) {
		this.discountMoney = discountMoney;
	}
	public Integer getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(Integer discountPercent) {
		this.discountPercent = discountPercent;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Date getStartPDate() {
		return startPDate;
	}
	
	public void setStartPDate(String startDate) {
		Date startPDate = null;
		try {
			startPDate = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(startDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		 
		this.startPDate = startPDate;
	}
	
	public Date getEndPDate() {
		return endPDate;
	}
	
	public void setEndPDate(String endDate) {
		Date endPDate = null;
		try {
			endPDate = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		 
		this.endPDate = endPDate;
	}*/
}
