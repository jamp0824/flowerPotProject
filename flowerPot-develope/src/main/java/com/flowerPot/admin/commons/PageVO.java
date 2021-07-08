package com.flowerPot.admin.commons;

public class PageVO {

	private Integer page;
	private Integer countPerPage;
	
	public PageVO() {
		this.page = 1; 
		this.countPerPage = 10; 
		
	}
	
	public Integer getPageStart() {
		return (this.page - 1) * this.countPerPage +1;
	}
	public Integer getPageEnd() {
		return (getPageStart()+this.countPerPage) -1;
	}
	
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		
		if(page <= 0) {
			this.page = 1;
			return;
		}		
		this.page = page;
	}
	public Integer getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(Integer countPerPage) {
		if(countPerPage < 10 || countPerPage > 30) {
			this.countPerPage = 10;
			return;
		}
		this.countPerPage = countPerPage;
	}

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", countPerPage=" + countPerPage + "]";
	}
	
	

}



