package com.flowerPot.brand.repository;

import java.util.List;

import com.flowerPot.vo.BrandVo;

public interface BrandDao {

	List<BrandVo> selectListAllBrand();

	List<String> selectListNameAllBrand();

	void insertBrand(BrandVo brand);

}
