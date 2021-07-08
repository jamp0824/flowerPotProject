package com.flowerPot.admin.dao;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.BrandVo;

public interface BrandMapper {

	List<BrandVo> getBrandList(SearchVO search);

	Integer countBrandArticles(SearchVO search);

	BrandVo getBrandInfo(Integer bno);

	void insertBrand(BrandVo bv);

	void modifyBrand(BrandVo bv);

	void deleteBrand(Integer bno);
}
