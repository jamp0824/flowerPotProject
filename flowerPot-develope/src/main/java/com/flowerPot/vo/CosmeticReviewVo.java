package com.flowerPot.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CosmeticReviewVo {
/*create table f_cosmeticReview(
	crno number(30),
	cno number(30),
	mno number(30),
	category varchar2(50),   -- 평점 / 문의
	grade number(5),
	id varchar2(50),    -- 회원 아이디
	nickname varchar2(50),    -- 회원 닉네임
	content varchar2(3000),  -- 평가내용
	title varchar2(100),    -- 평가제목
	primary key (crno)
);*/
	private Integer crno;
	private Integer cno;
	private Integer mno;
	private String category;
	private Integer rating;
	private String id;
	private String nickname;
	private String title;
	private String content;
	private LocalDateTime regdate;
	
	private CosmeticVo cosmeticVo;
	
}
