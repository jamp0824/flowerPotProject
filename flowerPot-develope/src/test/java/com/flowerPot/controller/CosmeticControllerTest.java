package com.flowerPot.controller;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.test.CosmeticTestCase;
import com.flowerPot.vo.CosmeticVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class CosmeticControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	@Autowired 
	private CosmeticDao cosmeticDao;
	@Autowired
	private CosmeticTestCase cosmeticTestCase;
	
	private List<CosmeticVo> cList =  new ArrayList<CosmeticVo>();
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
		// cList = cosmeticTestCase.insertCosmeticTestCase();
	}
	
	@Test
	public void cosmeticRegister() throws Exception  {
		RequestBuilder builder = MockMvcRequestBuilders.post("/cosmetic/cosmeticRegister").contentType(MediaType.APPLICATION_FORM_URLENCODED).param("name", "name").param("brand", "brand").param("skinType", "skinType").param("price","1000")
				.param("content", "content").param("type", "type").param("capacity", "1000").param("period", "1000").param("nation", "nation").param("useMethod", "useMethod");
		
		/*.contentType(MediaType.APPLICATION_FORM_URLENCODED).param("brand", "brand").param("skinType", "skinType").param("price", "price").param("type", "type")
				.param("title", "title").param("capacity", "capacity").param("period", "period").param("nation", "nation").param("useMethod", "useMethod");*/
		mockMvc.perform(builder).andExpect(MockMvcResultMatchers.status().isOk()).andDo(MockMvcResultHandlers .print());
	}
	
	@Test
	public void AttachRegister() throws Exception {
		// 리퀘스트 바디를 어떻게 해야할지??
		RequestBuilder builder = MockMvcRequestBuilders.post("/cosmetic/AttachRegister").contentType(MediaType.APPLICATION_JSON);
		mockMvc.perform(builder).andExpect(MockMvcResultMatchers.status().isOk()).andDo(MockMvcResultHandlers .print());
	}
	
	@After
	public void delete() {
		cosmeticDao.deleteByName("화장품이름");
	}
}
