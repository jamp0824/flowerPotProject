package com.flowerPot.semiadmin.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttenVO {
	
	String mno;
	Date startDate;
	
	@Override
	public String toString() {
		return "attendanceCheck [mno=" + mno + ", startDate=" + startDate + "]";
	}
	
	

}
