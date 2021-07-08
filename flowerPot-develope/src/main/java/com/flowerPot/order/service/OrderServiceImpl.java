package com.flowerPot.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.order.repository.OrderDao;
import com.flowerPot.orderProduct.repository.OrderProductDao;
import com.flowerPot.vo.OrderProductVo;
import com.flowerPot.vo.OrderVo;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderProductDao orderProductDao;
	@Autowired
	private CosmeticDao cosmeticDao;

	@Override
	public List<OrderVo> selectListOrderByMno(Integer mno) {
		List<OrderVo> Olist = orderDao.selectListOrderByMno(mno);
		for(OrderVo order :Olist) {
			List<OrderProductVo> opList = orderProductDao.selectListByOrderNum(order.getOrder_num());
			for(OrderProductVo op : opList) {
				op.setCosmeticVo(cosmeticDao.selectOneCosmeticByCno(op.getCno()));
			}
			order.setOrderProductList(opList);
		}
		return Olist;
	}
}
