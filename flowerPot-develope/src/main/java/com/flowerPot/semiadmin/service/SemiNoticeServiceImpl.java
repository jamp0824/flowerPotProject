package com.flowerPot.semiadmin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.flowerPot.semiadmin.model.SemiCalendarVO;
import com.flowerPot.semiadmin.model.SemiInventoryVO;
import com.flowerPot.semiadmin.model.SemiNoticeVO;
import com.flowerPot.semiadmin.model.SemiReviewVO;
import com.flowerPot.semiadmin.repository.ISemiNoticeMapper;
import com.flowerPot.vo.CosmeticVo;

@Service
@Repository
public class SemiNoticeServiceImpl implements ISemiNoticeService {

	@Autowired
	private ISemiNoticeMapper mapper;
	
	//{ 공지사항 게시글 목록 가져오기
	@Override
	public List<SemiNoticeVO> getArticles() {
		return mapper.getArticles();
	}

	// 공지사항 게시글 번호로 지우기  } 
	@Override
	public void delTable(Integer sBno) {
		mapper.delete(sBno);
	}

	//{ Review 후기   목록 가져오기 } 
	@Override
	public List<SemiReviewVO> getReviewArticles() {
		return mapper.getReviewArticles();
	}

	// {Inventory 목록 가져오기 }
	@Override
	public List<SemiInventoryVO> getInvenArticles() {
		return mapper.getInvenArticles();
	}

	// Inventory 화장품 번호로  수량 submit 하기}
	@Override
	public void submitInven(SemiInventoryVO semi) {
		mapper.submitInven(semi);
	}

	// { calendar 일정 전체 출력 
	@Override
	public List<SemiCalendarVO> getCalendar(SemiCalendarVO scalendar) {
		return mapper.getCalendar(scalendar) ;
	}



	// { productManage 상품 } 


	



	
	

}
