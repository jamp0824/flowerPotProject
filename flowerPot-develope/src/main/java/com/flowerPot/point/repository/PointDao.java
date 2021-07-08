package com.flowerPot.point.repository;

import java.util.List;

import com.flowerPot.vo.PointVo;

public interface PointDao {

	void insertPoint(PointVo p);

	List<PointVo> selectListPointByMno(Integer mno);

}
