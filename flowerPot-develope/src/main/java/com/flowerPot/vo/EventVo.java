package com.flowerPot.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class EventVo {
	
	private Integer eno;
	private Integer mno;
	private String title;
	private String content;
	private Boolean enable;
	private String mappingURL;
	private LocalDateTime regdate;
	private LocalDateTime moddate;
}
