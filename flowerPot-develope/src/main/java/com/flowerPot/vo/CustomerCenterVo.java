package com.flowerPot.vo;

import java.util.List;

import com.flowerPot.admin.vo.ReplyVo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class CustomerCenterVo {
	
	private int ccno;
	private int mno;
	private String title;
	private String content;
	private String regdate;
	private String moddate;
	private String category;
	private String keyword;
	private String url;
	
	private List<ReplyVo> rlist;
	private MemberVo memberVo;
}
