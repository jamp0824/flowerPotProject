package com.flowerPot.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberAddressVo {

	private Integer mno;
	private String postcode;
	private String street_address;
	private String parcel_address;
	private String detail_address;
	private String more_infomation;
}
