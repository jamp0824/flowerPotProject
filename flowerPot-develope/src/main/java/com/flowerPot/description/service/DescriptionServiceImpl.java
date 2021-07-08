package com.flowerPot.description.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.description.repository.DescriptionDao;
import com.flowerPot.vo.DescriptionVo;

@Service
public class DescriptionServiceImpl implements DescriptionService {

	@Autowired
	private DescriptionDao descriptionDao;

	@Override
	public DescriptionVo selectOneDescriptionByCno(Integer cno) {
		return descriptionDao.selectOneDescriptionByCno(cno);
	}
	
	
}
