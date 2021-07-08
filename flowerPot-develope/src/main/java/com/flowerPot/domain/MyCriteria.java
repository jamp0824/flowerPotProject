package com.flowerPot.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyCriteria {
	private Boolean prev = false;
	private Boolean next = false;
	
	private int pageNum;
	private int amount;
	
	private int startNum;
	private int endNum;
	
	private int minNum;  // 한페이지 최소
	private int maxNum;  // 한페이지 최대숫자
	
	private String category;
	private String searchName;
	private String searchCategory;  // 검색할 카테고리
	
	public MyCriteria() {
		this(1,10);
	}
	
	public MyCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public void addMinMaxNum() {
		this.minNum = (pageNum-1) * amount + 1;
		this.maxNum = pageNum * amount;
	}
	
	public void calPageInfo(int totalCount) {
		int realEnd = (int)Math.ceil((double)totalCount/amount);  // 마지막 페이지
		startNum = (int)(Math.floor((double)pageNum/10)*10 +1);
		endNum = (int)(Math.ceil((double)pageNum/10)*10);   // 보여줄 페이지중 마지막 페이지
		
		if(endNum > realEnd ) {
			endNum = realEnd;
		}else {
			// 페이지가 더 남아 있다
			next = true;
		}
		
		
		if(startNum >= 11) {
			prev = true;
		}
		
	}
}
