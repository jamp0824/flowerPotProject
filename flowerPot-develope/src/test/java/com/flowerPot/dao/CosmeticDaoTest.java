package com.flowerPot.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThat;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.attachFile.repository.AttachFileDao;
import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.domain.CosmeticCriteria;
import com.flowerPot.test.CosmeticTestCase;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.CosmeticVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/test-case.xml"})
@Slf4j
public class CosmeticDaoTest {

	@Autowired
	private CosmeticDao cosmeticDao;
	@Autowired
	private CosmeticTestCase cosmeticTestCase;
	@Autowired
	private AttachFileDao attachFileDao;
	
	List<CosmeticVo> cList = null;
	CosmeticVo cosmetic = new CosmeticVo();
	
	@Before
	public void testCase() {
		/* cList = cosmeticTestCase.insertCosmeticTestCase(); */
		
		cosmeticDao.deleteByName("화장품이름");
		int before = cosmeticDao.selectCount();
		// Integer cno, String name, String code, String type, String sub_type, String brand, String content, String skinType, Integer price, Integer discountPersent
		CosmeticVo c = new CosmeticVo(0,"화장품이름","code","스킨케어","페이셜","이니스프리","내용","지성",10000,0);
		cosmeticDao.insertCosmetic(c);
		int after = cosmeticDao.selectCount();
		assertThat(before, is(after-1));
		
		log.info("cno : "+c.getCno());  // selectKey 가져오는지
		assertNotEquals(c.getCno(),new Integer(0));
		cosmeticDao.deleteByName("화장품이름");
	}
	
	@Test
	public void insertCosmeticTestCase() {
		cosmeticTestCase.insertCosmeticTestCase();
		cosmeticTestCase.deleteAll();
	}
	
	@Test
	public void selectOneCosmeticByCno() {
		if(cList.size()!=0) {
			AttachFileVo a = new AttachFileVo(1, 1,0, 0, "uuidName", "originalFileName", "uploadFolderPath", "mappingURL","realName");
			CosmeticVo cosmetic = cList.get(0);
			a.setCno(cosmetic.getCno());
			attachFileDao.insertAttachFile(a);
			attachFileDao.insertAttachFile(a);
			CosmeticVo c1 = cosmeticDao.selectOneCosmeticByCno(cosmetic.getCno());  //cosmetic.getCno()
			// assertNotEquals(c1, null);
			log.info("c1:"+c1.toString());
			log.info("alist:"+c1.getMappingList().toString());
			log.info("alist:"+c1.getMappingList().size());
		}
	}
	
	@Test
	public void selectList() {
		CosmeticCriteria c = new CosmeticCriteria();
		c.setType("스킨케어");
		c.setSub_type("페이셜");
		List<CosmeticVo> clist = cosmeticDao.selectListCosmeticByCategory(c);
		log.info("리스트:"+clist);
	}
	
	@Test
	public void selectList2() {
		CosmeticCriteria c = new CosmeticCriteria();
		c.setType("스킨케어");
		c.setSub_type("페이셜");
		List<CosmeticVo> clist = cosmeticDao.selectListCosmeticByCategory2(c);
		log.info("리스트:"+clist);
	}
	
	@Test
	public void selectCountByCategory() {
		CosmeticCriteria c = new CosmeticCriteria();
		c.setType("스킨케어");
		c.setSub_type("페이셜");
		int count = cosmeticDao.selectCountByCategory(c);
		log.info("카운트수:"+count);
	}
	
	@Test
	public void updateCosmeticByCno() {
		cosmetic.setCno(0);
		cosmetic.setName("화장품이름수정");
		cosmetic.setDiscountPersent(10);
		cosmetic.setStockNumber(1000);
		cosmetic.setContent("화장품내용수정");
		cosmetic.setPrice(15000);
		cosmeticDao.updateCosmeticByCno(cosmetic);
	}
}
