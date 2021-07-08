package com.flowerPot.semiadmin.service;

import java.util.List;

import com.flowerPot.semiadmin.model.SemiCalendarVO;
import com.flowerPot.semiadmin.model.SemiInventoryVO;
import com.flowerPot.semiadmin.model.SemiNoticeVO;
import com.flowerPot.semiadmin.model.SemiReviewVO;
import com.flowerPot.vo.CosmeticVo;

public interface ISemiNoticeService {

	// { 공지사항 게시글 목록 가져오기
	List<SemiNoticeVO> getArticles();

	//  공지사항 게시글 번호로 지우기  } 
	void delTable(Integer sBno);
	
	
	//{ Review 후기  } 
	List<SemiReviewVO> getReviewArticles();
	
	// { Inventory 목록
	List<SemiInventoryVO> getInvenArticles();
	
	// Inventory 화장품 번호로  수량 submit 하기 }
	void submitInven(SemiInventoryVO semi);

	//{ calendar 목록 출력 
	List<SemiCalendarVO> getCalendar(SemiCalendarVO scalendar);





}
