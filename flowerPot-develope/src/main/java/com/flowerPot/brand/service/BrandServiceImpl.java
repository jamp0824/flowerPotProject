package com.flowerPot.brand.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.brand.repository.BrandDao;
import com.flowerPot.vo.BrandVo;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandDao brandDao;
	
	@Override
	public List<BrandVo> selectListAllBrand() {
		return brandDao.selectListAllBrand();
	}

}
