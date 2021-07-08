package com.flowerPot.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/test-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class AuthorityDaoTest {

	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Test
	public void insertAuthority() {
		
		MemberVo member = MemberDaoTest.memberTestCase(memberDao,passwordEncoder,authorityDao);  // testcode 삽입
		log.info("memberVo : "+member);
		authorityDao.deleteAuthorityById(member.getId());
		int before = authorityDao.selectTotalCount();
		authorityDao.insertAuthority(member);
		int after = authorityDao.selectTotalCount();
		assertThat(before, is(after-1));
		authorityDao.deleteAuthorityById(member.getId());
	}
}
