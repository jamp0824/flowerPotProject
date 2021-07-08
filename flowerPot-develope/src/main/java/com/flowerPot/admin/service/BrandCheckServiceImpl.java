package com.flowerPot.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.dao.BrandCheckMapper;

@Service
public class BrandCheckServiceImpl implements BrandCheckService {
	
	@Autowired
	private BrandCheckMapper mapper;
	
	@Override
	public int compCheck(String company) {
		return mapper.compCheck(company);
	}

	@Override
	public int brandCheck(String bName) {
		return mapper.brandCheck(bName);
	}

	@Override
	public int busNoCheck(String busNo) {
		return mapper.busNoCheck(busNo);
	}

	@Override
	public int telCheck(String tel) {
		return mapper.telCheck(tel);
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

}
