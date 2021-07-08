package com.flowerPot.admin.dao;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.EmpVo;
import com.flowerPot.admin.vo.UserTVO;
import com.flowerPot.vo.MemberVo;

public interface MemMapper {
	
	public void insertUserT(UserTVO userT); 
	
	public List<MemberVo> selectUserT();

	public List<MemberVo> getArticleList(SearchVO search);

	public Integer countArticles(SearchVO search);

	public void deleteMember(Integer mno);

	public void restoreMember(Integer mno);
	


	
} 
