package com.flowerPot.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import org.hamcrest.core.Is;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.delivery.repository.DeliveryDao;
import com.flowerPot.vo.DeliveryVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/test-case.xml"})
@Slf4j
public class DeliveryDaoTest {

	@Autowired
	private DeliveryDao deliveryDao;
	
	@Test
	public void insertDelivery() {

		DeliveryVo delivery = new DeliveryVo("메롱","deliver_num", "postcode", "street_address", "parcel_address","detail_address", "more_infomation");
		int before = deliveryDao.selectCount();
		deliveryDao.insertDelivery(delivery);
		int after = deliveryDao.selectCount();
		assertEquals(before, after-1);
		deliveryDao.deleteAll();
		log.info("delivery.getDno():"+delivery.getDno());
		assertNotNull(delivery.getDno());
	}
}
