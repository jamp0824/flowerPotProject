package com.flowerPot.admin.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberDeliveryVo {
	private String id;
	private String name;
	private String t_code;
	private String t_invoice;
	
	@Override
	public String toString() {
		return "MemberDeliveryVo [id=" + id + ", name=" + name + ", t_code=" + t_code + ", t_invoice=" + t_invoice
				+ "]";
	}
	
}


