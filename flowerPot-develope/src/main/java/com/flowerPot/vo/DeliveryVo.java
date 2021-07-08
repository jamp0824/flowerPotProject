package com.flowerPot.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DeliveryVo {

	private Integer dno;
	private String id;    //  이거 누가 만든거지?
	private String t_code; //택배회사 코드
	private String t_invoice; //운송장번호
	private String postcode;
	private String street_address;
	private String parcel_address;
	private String detail_address;
	private String more_infomation;
	private String deliver_state;
	
	public DeliveryVo(String t_code, String t_invoice, String postcode, String street_address, String parcel_address,
			String detail_address, String more_infomation) {
		super();
		this.t_code = t_code;
		this.t_invoice = t_invoice;
		this.postcode = postcode;
		this.street_address = street_address;
		this.parcel_address = parcel_address;
		this.detail_address = detail_address;
		this.more_infomation = more_infomation;
	}
}
