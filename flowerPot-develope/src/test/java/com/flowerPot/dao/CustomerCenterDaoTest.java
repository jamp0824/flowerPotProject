package com.flowerPot.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.customerCenter.repository.CustomerCenterDao;
import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.CustomerCenterVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/test-case.xml"})
@Slf4j
public class CustomerCenterDaoTest {

	@Autowired
	private CustomerCenterDao customerCenterDao;
	
	@Test
	public void SelectList() {
		Criteria c = new Criteria();
		c.setCategory("notice");
		List<CustomerCenterVo> clist = customerCenterDao.SelectListByCategory(c);
		log.info("리스트:"+clist);
	}
}
