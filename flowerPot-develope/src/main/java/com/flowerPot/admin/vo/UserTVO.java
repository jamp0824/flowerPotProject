package com.flowerPot.admin.vo;

import lombok.Data;

@Data
public class UserTVO {
	private int mno;
	private String id;
	private String name;
	
	@Override
	public String toString() {
		return "UserTVO [mno=" + mno + ", id=" + id + ", name=" + name + "]";
	}
}

