package com.flowerPot.domain;

public class PointEnum {
	//	public static final int seed = 1000;
	public static final int sprout = 10000;
	public static final int flower = 50000;
	public static final int tree = 100000;
	
	public static String ChangeRank(int sum) {
		if(sum > tree) {
			return "나무";
		}else if(sum > flower) {
			return "꽃";
		}else if(sum > sprout) {
			return "새싹";
		}else{
			return null;
		}
	}
}
