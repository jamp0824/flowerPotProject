package com.flowerPot.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/test-context.xml")
public class Test2 {

	@Test
	public void test() {
		
		LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		String rootfolder = "c:\\192.168.0.8\\upload\\";
		LocalDateTime currentDateTime = LocalDateTime.now(); // 컴퓨터 현재 날짜 정보
		String today = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		File f = new File(rootfolder+today);
		
		if(f.exists()==false) {
			f.mkdirs();
		}
	
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid.toString();
		uuidName = uuidName +".txt";
		File file = new File(f, uuidName);
		
		System.out.println(file.getAbsolutePath());
		System.out.println(file.getPath());
		System.out.println(file.getAbsolutePath());
		System.out.println(file.getAbsolutePath());
		
		
				
	}
	
	@Test
	public void test2() {
		String path = "C:\\upload\\profileImage\\2020-08-22\\161ce973-963b-4f1a-bb58-fd1f2feaa0b9.png";
		path.indexOf("\\");
		System.out.println(path.indexOf("\\"));
		System.out.println(path.replace("\\", "/"));
		System.out.println(path.substring(2));
	}
}
