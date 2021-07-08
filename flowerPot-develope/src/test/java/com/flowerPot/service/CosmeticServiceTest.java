package com.flowerPot.service;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.attachFile.repository.AttachFileDao;
import com.flowerPot.cosmetic.service.CosmeticService;
import com.flowerPot.cosmeticReview.repository.CosmeticReviewDao;
import com.flowerPot.test.CosmeticTestCase;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.CosmeticVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class CosmeticServiceTest {

	@Autowired
	private CosmeticService cosmeticService;
	@Autowired
	private CosmeticTestCase cosmeticTestCase;
	@Autowired
	private AttachFileDao attachFileDao;
	@Autowired
	private CosmeticReviewDao cosmeticReviewDao;
	
	List<CosmeticVo> cList = null;
	
	@Before
	public void testCase() {
		cList = cosmeticTestCase.insertCosmeticTestCase();
		
	}
	
	@Test
	public void selectListCosmeticByCategory() {
		if(cList.size()!=0) {
			AttachFileVo a = new AttachFileVo(1, 1, 0, 0, "uuidName", "originalFileName", "uploadFolderPath", "mappingURL","realName");
			CosmeticVo cosmetic = cList.get(0);
			
			// 첨부파일 삽입
			a.setCno(cosmetic.getCno());
			attachFileDao.insertAttachFile(a);
			attachFileDao.insertAttachFile(a);
			
			// CosmeticReviewVo 삽입
			CosmeticReviewVo cr = new CosmeticReviewVo();
			cosmeticReviewDao.insertcosmeticReview(cr);
			cosmeticReviewDao.insertcosmeticReview(cr);
			cosmeticReviewDao.insertcosmeticReview(cr);
			CosmeticVo c1 = cosmeticService.selectOneCosmeticByCno(cosmetic.getCno());  //cosmetic.getCno()
			
			assertNotEquals(c1, null);
			log.info("c1:"+c1.toString());
			log.info("alist:"+c1.getMappingList().toString());
			log.info("alist:"+c1.getMappingList().size());
		}
	}
}
