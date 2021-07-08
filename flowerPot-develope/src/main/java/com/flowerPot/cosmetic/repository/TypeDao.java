package com.flowerPot.cosmetic.repository;

import java.util.List;

import com.flowerPot.vo.TypeVo;

public interface TypeDao {

	public List<TypeVo> selectListType();

	public List<TypeVo> selectListSubType(String type);

}
