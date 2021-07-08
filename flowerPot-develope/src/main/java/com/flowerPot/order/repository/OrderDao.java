package com.flowerPot.order.repository;

import java.util.List;

import com.flowerPot.vo.OrderProductVo;
import com.flowerPot.vo.OrderVo;

public interface OrderDao {

	void insertOrder(OrderVo orderVo);

	List<OrderVo> selectListOrderByMno(Integer mno);

}
