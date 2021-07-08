package com.flowerPot.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.dao.DeliveryMapper;
import com.flowerPot.vo.MemberVo;

@Service
public class ADeliveryServiceImpl implements ADeliveryService {

	@Autowired
	private DeliveryMapper mapper;
	
	@Override
	public MemberVo selectMemOne(String id) {
		return mapper.selectMemOne(id);
	}

	@Override
	public MemberVo selectMemDeliIdInfo(String id) {
		return mapper.selectMemDeliIdInfo(id);
	}

}
