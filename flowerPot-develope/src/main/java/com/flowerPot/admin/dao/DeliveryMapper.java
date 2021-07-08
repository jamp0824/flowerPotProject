package com.flowerPot.admin.dao;

import com.flowerPot.vo.MemberVo;

public interface DeliveryMapper {
	
	MemberVo selectMemOne(String id);
	MemberVo selectMemDeliIdInfo(String id);
}
