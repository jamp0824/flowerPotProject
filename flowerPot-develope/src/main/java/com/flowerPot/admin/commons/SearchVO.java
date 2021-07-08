package com.flowerPot.admin.commons;

public class SearchVO extends PageVO {
	
	private String keyword;
	private String condition;
	
	public SearchVO() {
		this.keyword = "";
		this.condition = "";
	}
	
	@Override
	public Integer getPageStart() {
		return super.getPageStart();
	}

	@Override
	public Integer getPage() {
		return super.getPage();
	}

	@Override
	public void setPage(Integer page) {
		super.setPage(page);
	}

	@Override
	public Integer getCountPerPage() {
		return super.getCountPerPage();
	}

	@Override
	public void setCountPerPage(Integer countPerPage) {
		super.setCountPerPage(countPerPage);
	}

	@Override
	public String toString() {
		return super.toString();
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
	
}
