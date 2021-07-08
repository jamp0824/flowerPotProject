package com.flowerPot.cosmetic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.cosmetic.repository.TypeDao;
import com.flowerPot.vo.TypeVo;

@Service
public class TypeServiceImpl implements TypeService {

	@Autowired
	private TypeDao typeDao;

	@Override
	public List<TypeVo> selectListType() {
		return typeDao.selectListType();
	}

	@Override
	public List<TypeVo> selectListSubType(String type) {
		return typeDao.selectListSubType(type);
	}
	
}
