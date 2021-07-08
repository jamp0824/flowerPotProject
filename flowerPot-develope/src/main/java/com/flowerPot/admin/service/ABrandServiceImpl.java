package com.flowerPot.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.BrandMapper;
import com.flowerPot.admin.vo.BrandVo;
@Service
public class ABrandServiceImpl implements ABrandService {

	@Autowired
	private BrandMapper mapper;
	
	@Override
	public List<BrandVo> getBrandList(SearchVO search) {
		return mapper.getBrandList(search);
	}

	@Override
	public Integer countBrandArticles(SearchVO search) {
		return mapper.countBrandArticles(search);
	}

	@Override
	public BrandVo getBrandInfo(Integer bno) {
		return mapper.getBrandInfo(bno);
	}

	@Override
	public void insertBrand(BrandVo bv) {
		mapper.insertBrand(bv);
	}

	@Override
	public void modifyBrand(BrandVo bv) {
		mapper.modifyBrand(bv);
	}

	@Override
	public void deleteBrand(Integer bno) {
		mapper.deleteBrand(bno);
	}

}
