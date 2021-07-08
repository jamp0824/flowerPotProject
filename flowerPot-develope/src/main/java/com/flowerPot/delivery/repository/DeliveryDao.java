package com.flowerPot.delivery.repository;

import com.flowerPot.vo.DeliveryVo;

public interface DeliveryDao {

	void insertDelivery(DeliveryVo delivery);

	void deleteAll();
	
	int selectCount();

	DeliveryVo selectMemDeliIdInfo(String id);

	void updateStateByDno(Integer dno);
}
