package com.flowerPot.semiadmin.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


public class SemiNoticeVO {
	
	private Integer sBno;
	private String sTitle;
	private String sContent;
	private String sWriter;
	private Date sDate;

	public Integer getsBno() {
		return sBno;
	}

	public void setsBno(Integer sBno) {
		this.sBno = sBno;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public String getsWriter() {
		return sWriter;
	}

	public void setsWriter(String sWriter) {
		this.sWriter = sWriter;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	@Override
	public String toString() {
		return "SemiNoticeVO [sBno=" + sBno + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sWriter=" + sWriter
				+ ", sDate=" + sDate + "]";
	}

	


}
