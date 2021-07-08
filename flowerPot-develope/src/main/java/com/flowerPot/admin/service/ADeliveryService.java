package com.flowerPot.admin.service;

import com.flowerPot.vo.MemberVo;

public interface ADeliveryService {
	
	MemberVo selectMemOne(String id);
	MemberVo selectMemDeliIdInfo(String id);
}
