package com.flowerPot.domain;

import lombok.Data;

@Data
public class CosmeticCriteria {
	private String sub_type;
	private String brand;
	private String skinType;
	private String type;
	private String filter;
	private int pageNum;
	private int amount;



	public CosmeticCriteria() {
		this(1, 20,"All","All","All","All","All");
	}

	public CosmeticCriteria(int pageNum, int amount, String sub_type,String brand,String skinType, String filter,String type) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.sub_type = sub_type;
		this.brand = brand;
		this.skinType = skinType;
		this.filter = filter;
		this.type = type;
	}

}
