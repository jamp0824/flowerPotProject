package com.flowerPot.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.attachFile.repository.AttachFileDao;
import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.CosmeticVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class AttachFileDaoTest {

	@Autowired
	private AttachFileDao attachFileDao;
	@Autowired
	private CosmeticDao cosmeticDao;
	
	private CosmeticVo c;
	private AttachFileVo attach;
	private AttachFileVo attach2;
	
	@Before
	public void testCase() {
		cosmeticDao.deleteByName("화장품이름");
		c = new CosmeticVo(0,"화장품이름","스킨","이니스프리","스킨타입",111,0,100,LocalDateTime.now());
		cosmeticDao.insertCosmetic(c);
		
		// AttachFileVo 초기화
		attach = new AttachFileVo(0, c.getCno(), 0, 0, "uuidName", "originalFileName", "uploadFolderPath", "mappingURL","realName");
		attach2 = new AttachFileVo(0, c.getCno(), 0, 0,"uuidName", "originalFileName", "uploadFolderPath", "mappingURL","realName");
	}
	
	@Test
	public void insertAttachFile() {
		attachFileDao.deleteAll();
		int before = attachFileDao.selectCount();
		
		attachFileDao.insertAttachFile(attach);
		int after = attachFileDao.selectCount();
		assertThat(before, is(after-1));
	}
	
	@Test
	public void selectMappingURLByCno() {
		
		attachFileDao.insertAttachFile(attach);
		attachFileDao.insertAttachFile(attach2);
		List<AttachFileVo> list = attachFileDao.selectMappingURLByCno(c.getCno());
		log.info("확인:"+list);
		assertThat(list.size(), is(2));
		log.info("확인:"+attachFileDao.selectMappingURLByCno(0).toString());
	}
	
	@After
	public void after() {
		attachFileDao.deleteAll();
		cosmeticDao.deleteByName("화장품이름");
	}
}
