package com.flowerPot.admin.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BrandVo {
	private int bno;
	private String name;
	private String company;
	private String brandName;
	private String busNo;
	private String ceoName;
	private String tel;
	private String email;
	private String postcode;
	private String roadAddr;
	private String jibunAddr;
	private String extraAddr;
	private String detailAddr;
	private String introduce;
	private Date regDate;
	
	@Override
	public String toString() {
		return "BrandVo [bno=" + bno + ", name=" + name + ", company=" + company + ", brandName=" + brandName
				+ ", busNo=" + busNo + ", ceoName=" + ceoName + ", tel=" + tel + ", email=" + email + ", postcode="
				+ postcode + ", roadAddr=" + roadAddr + ", jibunAddr=" + jibunAddr + ", extraAddr=" + extraAddr
				+ ", detailAddr=" + detailAddr + ", introduce=" + introduce + ", regDate=" + regDate + "]";
	}

}


