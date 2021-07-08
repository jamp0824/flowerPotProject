package com.flowerPot.admin.dao;

import java.util.List;

import com.flowerPot.admin.vo.ReplyVo;

public interface CReplyMapper {

	void insertReply(ReplyVo rpl);

	ReplyVo getReplyCont(Integer ccno);

	void updateReply(ReplyVo rpl);

	void deleteReply(Integer rno);

	List<ReplyVo> getReplyContList(ReplyVo rpl);

	List<ReplyVo> SelectListByCcno(int ccno);

	ReplyVo getReplyByRno(int rno);

}
