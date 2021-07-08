package com.flowerPot.cosmetic.service;

import java.util.List;

import com.flowerPot.vo.TypeVo;

public interface TypeService {

	List<TypeVo> selectListType();

	List<TypeVo> selectListSubType(String type);

}
