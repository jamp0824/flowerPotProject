package com.flowerPot.admin.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerVo {
	private Integer ccno;
	private Integer mno;
	private String title;
	private String content;
	private Date regDate;
	private Date modDate;
	@Override
	public String toString() {
		return "CustomerVo [ccno=" + ccno + ", mno=" + mno + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", modDate=" + modDate + "]";
	}
	
	
	
}
