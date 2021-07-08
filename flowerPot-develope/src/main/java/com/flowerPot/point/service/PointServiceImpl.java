package com.flowerPot.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.point.repository.PointDao;
import com.flowerPot.vo.PointVo;

@Service("pointService")
public class PointServiceImpl implements PointService {

	@Autowired
	private PointDao pointDao;
	
	@Override
	public List<PointVo> selectListPointByMno(Integer mno) {
		return pointDao.selectListPointByMno(mno);
	}

}
