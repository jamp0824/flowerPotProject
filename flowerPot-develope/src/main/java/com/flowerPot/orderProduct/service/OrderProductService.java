package com.flowerPot.orderProduct.service;

import java.util.List;

import com.flowerPot.domain.OrderCriteria;
import com.flowerPot.vo.OrderProductVo;

public interface OrderProductService {

	List<OrderProductVo> selectListOrderProductByBrand(String brand);

	List<OrderProductVo> selectListOrderProductByBrandCno(String brand, Integer cno);

	void updateOrderProductTOComplete(Integer ono);

	List<OrderProductVo> selectListOrderProductByMno(Integer mno);

	List<OrderProductVo> selectListByOrderCriteria(OrderCriteria oc);

}
