package com.flowerPot.semiadmin.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SemiCalendarVO {
	
	private Integer mno;
	private String id;
	private String title;
	private LocalDateTime dateChoice;
	private String content;
	
	@Override
	public String toString() {
		return "SemiCalendarVO [mno=" + mno + ", id=" + id + ", title=" + title + ", content=" + content + "]";
	}
	


}
