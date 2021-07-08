package com.flowerPot.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.brand.repository.BrandDao;
import com.flowerPot.vo.BrandVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class BrandDaoTest {

	@Autowired
	private BrandDao brandDao;
	
	@Test
	public void selectList() {
		List<BrandVo> bList = brandDao.selectListAllBrand();
		List<String> bList2 = brandDao.selectListNameAllBrand();
		log.info("list:"+bList);
		log.info("bList2:"+bList2);
		
	}
	
}
