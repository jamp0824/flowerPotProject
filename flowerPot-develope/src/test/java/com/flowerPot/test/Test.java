package com.flowerPot.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.domain.MyCriteria;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class Test {

	@org.junit.Test
	public void test() {
		System.out.println("올림 :" + Math.ceil(20.1));
		System.out.println("올림 :" + Math.floor(20.1));
		
		MyCriteria mc = new MyCriteria();
		mc.addMinMaxNum();
		mc.calPageInfo(3012);
		log.info("페이징 : "+mc);
	
		
	}
}
