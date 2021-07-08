package com.flowerPot.service;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThat;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flowerPot.attachFile.service.AttachFileService;
import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.CosmeticVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class AttachFileServiceTest {

	@Autowired
	private AttachFileService attachFileService;
	
	@Autowired
	private CosmeticDao cosmeticDao;
	private CosmeticVo c;
	
	@Before
	public void insertCosmetic() {
		cosmeticDao.deleteByName("화장품이름");
		int before = cosmeticDao.selectCount();
		c = new CosmeticVo(0,"화장품이름","스킨","이니스프리","지성","페이셜",10000,0,100);
		cosmeticDao.insertCosmetic(c);
		int after = cosmeticDao.selectCount();
		assertThat(before, is(after-1));
		log.info("cno : "+c.getCno());  // selectKey 가져오는지
		assertNotEquals(c.getCno(),new Integer(0));
	}
	
	@Test
	public void insertAttachFile() {
		AttachFileVo attachFile =  new AttachFileVo(0, c.getCno(),0,0, "uuidName", "originalFileName", "uploadFolderPath", "mappingURL", "realName");
		attachFileService.deleteAll();
		int before = attachFileService.selectCount();
		attachFileService.insertAttachFile(attachFile);
		int after = attachFileService.selectCount();
		assertThat(before, is(after-1));
		attachFileService.deleteAll();
	}
}
