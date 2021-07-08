package com.flowerPot.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.delivery.repository.DeliveryDao;
import com.flowerPot.vo.DeliveryVo;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private DeliveryDao deliveryDao;
	
	@Override
	public void insertDelivery(DeliveryVo delivery) {
		deliveryDao.insertDelivery(delivery);
	}

	@Override
	public DeliveryVo selectMemDeliIdInfo(String id) {
		return deliveryDao.selectMemDeliIdInfo(id);
	}

}
