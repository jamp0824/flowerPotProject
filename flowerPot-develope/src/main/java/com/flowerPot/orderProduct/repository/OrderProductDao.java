package com.flowerPot.orderProduct.repository;

import java.util.List;
import java.util.Map;

import com.flowerPot.domain.OrderCriteria;
import com.flowerPot.vo.OrderProductVo;

public interface OrderProductDao {

	void insertOrderProduct(OrderProductVo orderProduct);

	void insertOrderProductNoMember(OrderProductVo orderProduct);

	void deleteAll();
	
	int selectCount();

	List<OrderProductVo> selectListOrderProductByOrderNum(String order_num);

	List<OrderProductVo> selectListOrderProductByBrand(OrderCriteria oc);

	List<OrderProductVo> selectListOrderProductByBrandCno(Map<String, Object> map);

	OrderProductVo selectOneByono(Integer ono);

	void updateOrderProductTOComplete(Integer ono);

	List<OrderProductVo> selectListOrderProductByMno(Integer mno);

	List<OrderProductVo> selectListByOrderNum(String order_num);

	List<OrderProductVo> selectListByOrderCriteria(OrderCriteria oc);

	List<OrderProductVo> selectListOrderProductByBrand(String brand);

	List<OrderProductVo> selectListByMno(Integer integer);
}
