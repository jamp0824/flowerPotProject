package com.flowerPot.point.service;

import java.util.List;

import com.flowerPot.vo.PointVo;

public interface PointService {

	List<PointVo> selectListPointByMno(Integer mno);

}
