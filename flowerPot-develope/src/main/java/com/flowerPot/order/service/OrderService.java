package com.flowerPot.order.service;

import java.util.List;

import com.flowerPot.vo.OrderVo;

public interface OrderService {

	List<OrderVo> selectListOrderByMno(Integer mno);

}
