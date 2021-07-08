package com.flowerPot.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderCriteria {

	private int pageNum;
	private int amount;
	private String SearchName;
	private int cno;
	private String brand;

	public OrderCriteria() {
		this(1, 5);
	}

	public OrderCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
