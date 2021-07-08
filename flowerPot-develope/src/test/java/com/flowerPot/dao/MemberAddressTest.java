package com.flowerPot.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.memberAddress.repository.MemberAddressDao;
import com.flowerPot.vo.MemberAddressVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class MemberAddressTest {
	
	@Autowired
	private MemberAddressDao memberAddressDao;
	
	@Test
	public void selectOne() {
		
		MemberAddressVo memberAddress = memberAddressDao.selectOneMemberAddressByMno(3);
		log.info("memberAddress"+memberAddress);
	}
}
