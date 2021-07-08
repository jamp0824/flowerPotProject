package com.flowerPot.admin.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReplyVo {
	
	private int rno; //댓글 번호
	private int ccno; //게시판번호
	private String replyer; //댓글 작성자
	private String replytitle;  //댓글 내용
	private String replytext;  //댓글 내용
	private Date regdate; //댓글 등록 날짜
	private Date updatedate; //댓글 수정 날짜
	
}
