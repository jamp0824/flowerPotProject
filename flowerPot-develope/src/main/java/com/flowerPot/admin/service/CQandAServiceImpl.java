package com.flowerPot.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.CQandAMapper;
import com.flowerPot.admin.vo.CustomerVo;

@Service
public class CQandAServiceImpl implements CQandAService {

	@Autowired
	private CQandAMapper mapper;
	
	@Override
	public List<CustomerVo> selectQandAList(SearchVO search) {
		return mapper.selectQandAList(search);
	}

	@Override
	public void insertQandA(CustomerVo qANDa) {
		mapper.insertQandA(qANDa);
	}

	@Override
	public CustomerVo getQandACont(Integer ccno) {
		return mapper.getQandACont(ccno);
	}

	@Override
	public void modifyQandA(CustomerVo qANDa) {
		mapper.modifyQandA(qANDa);
	}

	@Override
	public void delQandA(Integer ccno) {
		mapper.delQandA(ccno);

	}

	@Override
	public Integer countQandAArticles(SearchVO search) {
		return mapper.countQandAArticles(search);
	}

}
