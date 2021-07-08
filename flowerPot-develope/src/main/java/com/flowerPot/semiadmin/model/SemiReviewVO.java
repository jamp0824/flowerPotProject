package com.flowerPot.semiadmin.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SemiReviewVO {

	private Integer crno;
	private Integer cno;
	private Integer mno;
	private String category;
	private String id;
	private String title;
	private String nickname;
	private String content;
	private String rating;
	
	@Override
	public String toString() {
		return "SemiReviewVO [crno=" + crno + ", cno=" + cno + ", mno=" + mno + ", category=" + category + ", id=" + id
				+ ", title=" + title + ", nickname=" + nickname + ", content=" + content + ", rating=" + rating + "]";
	}

	
}
