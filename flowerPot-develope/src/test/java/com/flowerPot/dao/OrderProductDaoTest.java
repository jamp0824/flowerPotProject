package com.flowerPot.dao;

import static org.junit.Assert.assertEquals;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.domain.OrderCriteria;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.order.repository.OrderDao;
import com.flowerPot.orderProduct.repository.OrderProductDao;
import com.flowerPot.point.repository.PointDao;
import com.flowerPot.vo.OrderProductVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/test-case.xml"})
@Slf4j
public class OrderProductDaoTest {

	@Autowired 
	private OrderProductDao orderProductDao;

	@Autowired
	private CosmeticDao cosmeticDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private PointDao pointDao;
	@Autowired
	private MemberDao memberDao;

	@Test
	public void insertOrderProduct() {

		OrderProductVo orderProduct = new OrderProductVo(0, 0, 0, 0, "order_num", 0, "state", 
				"deliver_state", "member_rank", 0," coupon_name", LocalDateTime.now(),"name", "tel", "email", 100,"이니스프리", null,null);
		OrderProductVo orderProduct2 = new OrderProductVo(0,0, 0, "order_num", 0, "state", 
				"deliver_state", "member_rank", 0," coupon_name", LocalDateTime.now(), "tel", "email", 100, 100);		

		orderProductDao.deleteAll();
		int before = orderProductDao.selectCount();
		orderProductDao.insertOrderProduct(orderProduct);
		orderProductDao.insertOrderProductNoMember(orderProduct2);
		int after = orderProductDao.selectCount();
		assertEquals(before, after-2);
	}

	@Test
	public void pointCal(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addpoint", 1000);
		map.put("subtractPoint", 100);
		map.put("mno", 3);
		memberDao.updatePoint(map);

	}
	
	@Test
	public void selectListByOrderCriteria() {
		OrderCriteria oc = new OrderCriteria();
		oc.setBrand("이니스프리");
		oc.setCno(1);
		List<OrderProductVo> opList = orderProductDao.selectListByOrderCriteria(oc);
		log.info("주문리스트 : "+opList);
	}
}
