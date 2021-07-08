package com.flowerPot.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReplyVo {
	private Integer rno;
	private Integer ccno;
	private Integer mno;
	private String name;
	private String title;
	private String content;
	private LocalDateTime regdate;
	private LocalDateTime moddate;
}

