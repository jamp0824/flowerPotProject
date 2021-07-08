package com.flowerPot.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.UUID;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
// Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/test-context.xml",
    "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Slf4j
public class MagazineControllerTest {

	/*
	 * @Setter(onMethod_ = { @Autowired }) private WebApplicationContext ctx;
	 * 
	 * private MockMvc mockMvc;
	 * 
	 * @Before public void setup() { this.mockMvc =
	 * MockMvcBuilders.webAppContextSetup(ctx).build(); }
	 */

  @Test
  public void testConvert() throws Exception {
	  
	  	UUID ud = UUID.randomUUID();
		System.out.println(ud.toString());
		/*
		 * System.out.println(ud.getLeastSignificantBits());
		 * System.out.println(ud.getMostSignificantBits());
		 * 
		 * byte[] b = {1,2,3}; UUID udf = UUID.nameUUIDFromBytes(b);
		 * 
		 * System.out.println(udf.clockSequence());
		 * System.out.println(udf.getLeastSignificantBits());
		 * System.out.println(udf.getMostSignificantBits()); System.out.println(); UUID
		 * udfs = UUID.fromString("뭐야이건");
		 * 
		 * System.out.println(udfs.clockSequence());
		 * System.out.println(udfs.getLeastSignificantBits());
		 * System.out.println(udfs.getMostSignificantBits()); System.out.println();
		 */
	  
  }

}


