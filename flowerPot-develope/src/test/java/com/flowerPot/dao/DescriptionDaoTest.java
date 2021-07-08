package com.flowerPot.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.description.repository.DescriptionDao;
import com.flowerPot.test.DescriptionTestCase;
import com.flowerPot.vo.DescriptionVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class DescriptionDaoTest {

	@Autowired
	private DescriptionTestCase descriptionTestCase;
	@Autowired
	private DescriptionDao descriptionDao;
	DescriptionVo description;
	@Before
	public void testCase() {
		description = descriptionTestCase.insertDescriptionTestCase();
	}
	
	@Test
	public void testCaseTest() {
		DescriptionVo description = descriptionTestCase.insertDescriptionTestCase();
		assertNotEquals(description, null);
	}
	
	@Test
	public void selectOneDescriptionByCno() {
		DescriptionVo d1 = descriptionDao.selectOneDescriptionByCno(description.getCno());
		assertNotEquals(d1, null);
		DescriptionVo d2 = descriptionDao.selectOneDescriptionByCno(null);
		assertEquals(d2, null);;
	}	
}
