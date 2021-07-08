package com.flowerPot.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;

public class ReFact01 {
	
	public static void main(String[] args) {
		
		int original_price = 12144;
		int price = 12142;
		double price2 = 12142;
		int discountPercent = 0;
		int amount = 1;
		int addpoint = 0;
		addpoint = price * amount * (100-discountPercent)/100;
		System.out.println(addpoint*2/100);
		Double addpoint2 = price2 * amount * (100-discountPercent)/100;
		System.out.println(addpoint2*2/100);
		
		System.out.println("올림 :" + Math.ceil(20.1));
	} 
}
