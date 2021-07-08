package com.flowerPot.domain;

public class CustomerEnum {
	public final static int notice = 1;
	public final static int FAQ = 2;
	public final static int enquiry = 3;

	public static void categoryChangeToNum(Criteria c) {
		switch (c.getCategory()) {
		case "notice":
			c.setN_category(1);
			break;
		case "FAQ":
			c.setN_category(2);
			break;
		case "enquiry":
			c.setN_category(3);
			break;
		}
	}

	public static void categoryChangeToString(Criteria c) {
		switch (c.getN_category()) {
		case 1:
			c.setCategory("notice");
			break;
		case 2:
			c.setCategory("FAQ");
			break;
		case 3:
			c.setCategory("enquiry");
			break;
		}
	}
}
