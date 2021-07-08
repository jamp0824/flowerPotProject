package com.flowerPot.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotEquals;
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
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class MemberDaoTest {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	public static MemberVo memberTestCase(MemberDao memberDao,PasswordEncoder passwordEncoder,AuthorityDao authorityDao) {
		authorityDao.deleteAuthorityById("testId");
		memberDao.deleteMemberById("testId"); // 해당아이디가 없으면 삭제 당근안함
		MemberVo member = new MemberVo(0,"testId","testPassword","testname","testnickname","testtel","testemail","M","testbirth","브론즈",true);
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDao.insertMember(member);
		return member;
	}
	
	@Test
	public void insertMember() {
		// 외래키 제약조건 제거
		authorityDao.deleteAuthorityById("testId");
		// 기본키 제약조건 제거, 중복된 레코드 삽입불가
		memberDao.deleteMemberById("testId"); 
		MemberVo member = new MemberVo(0,"testId","testPassword","testname","testnickname","testtel","testemail","M","testbirth","브론즈",null);
		// 비밀번호 인코딩
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		
		int before = memberDao.selectTotalCount();
		memberDao.insertMember(member);
		int after = memberDao.selectTotalCount();
		// 레코드가 삽입됬는지 확인
		assertThat(before, is(after-1));
		log.info("getMno : "+member.getMno());
		assertNotEquals(member.getMno(), new Integer(0));
		
	
	}
}
