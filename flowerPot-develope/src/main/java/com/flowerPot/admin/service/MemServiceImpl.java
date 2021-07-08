package com.flowerPot.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.MemMapper;
import com.flowerPot.vo.MemberVo;

@Service
public class MemServiceImpl implements MemService {

	@Autowired
	private MemMapper mapper;

	@Override
	public List<MemberVo> selectUserT() {
		return mapper.selectUserT();
	}

	@Override
	public List<MemberVo> getArticleList(SearchVO search) {
		return mapper.getArticleList(search);
	}

	@Override
	public Integer countArticles(SearchVO search) {
		return mapper.countArticles(search);
	}

	@Override
	public void deleteMember(Integer mno) {
		mapper.deleteMember(mno);
	}

	@Override
	public void restoreMember(Integer mno) {
		mapper.restoreMember(mno);
	}
	
	
	
	
}
