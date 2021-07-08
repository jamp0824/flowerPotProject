package com.flowerPot.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.CFaQMapper;
import com.flowerPot.admin.vo.CustomerVo;
@Service
public class CFaQServiceImpl implements CFaQService {

	@Autowired
	private CFaQMapper mapper;
	
	@Override
	public void insertFaQ(CustomerVo notice) {
		mapper.insertFaQ(notice);
	}

	@Override
	public List<CustomerVo> selectFaQList(SearchVO search) {
		return mapper.selectFaQList(search);
	}

	@Override
	public CustomerVo getFaQCont(int ccno) {
		return mapper.getFaQCont(ccno);
	}

	@Override
	public void modifyFaQ(CustomerVo notice) {
		mapper.modifyFaQ(notice);
	}

	@Override
	public void delFaQ(Integer ccno) {
		mapper.delFaQ(ccno);
	}

	@Override
	public Integer countFAQArticles(SearchVO search) {
		return mapper.countFAQArticles(search);
	}

}
