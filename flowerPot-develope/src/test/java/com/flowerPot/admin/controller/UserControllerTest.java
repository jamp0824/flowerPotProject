package com.flowerPot.admin.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.CReplyMapper;
import com.flowerPot.admin.dao.EmpMapper;
import com.flowerPot.admin.vo.EmpVo;
import com.flowerPot.admin.vo.ReplyVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserControllerTest {
	
	/*
	 * @Autowired private MemMapper mapper;
	 */
	
	@Autowired
	private EmpMapper eMapper;
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void test() {
		System.out.println(eMapper.toString());
		System.out.println(eMapper);
		EmpVo a = new EmpVo();
		eMapper.insertEmpOne(a);
	}
	/*
	@Test
	public void userInsertTest() {
		for(int i=1; i<=367; i++) {
			UserTVO userT = new UserTVO();
			userT.setMno(i);
			userT.setId("id"+i);
			userT.setName("이름"+i);
			mapper.insertUserT(userT);
			System.out.println("게시물 등록 성공!");
		}
	}*/
	@Test
	public void EmpInsertTest() {
		for(int i=1; i<=367; i++) {
			EmpVo eT = new EmpVo();
			eT.setEmpId(""+i);
			eT.setEmpName("이름"+i);
			eT.setDeptNo(10);
			eT.setPoNo(3);
			System.out.println(eT.toString());
			eMapper.insertEmpOne(eT);
			System.out.println("게시물 등록 성공!");
		}
	}
	@Test
	public void EmpInsertTest2() {
		String sql = "insert into employee (empNo, empName, deptNo, poNo)"
				+ "values (eno_seq.nextval,?,?,?)";

		for(int i = 0; i < 368; i++) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "이름"+i);
				
				pstmt.setInt(2, 50);
				pstmt.setInt(3, 1);
				pstmt.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
				if(con != null) { try { con.close();  } catch(Exception e) {} }

			}
		}
	}
	@Test
	public void EmpSelectTest() {
		for(int i=1; i<=367; i++) {
			SearchVO search = new SearchVO();
			System.out.println(eMapper.countArticles(search));
		}
	}
	
	/*
	@Test
	public void userSelectTest() {
		mapper.selectUserT().forEach(userT -> System.out.println("회원 목록 : "+userT));
	}
	@Test
	public void memSelectTest() {
		mapper.selectUserT().forEach(userT -> System.out.println("회원 목록 : "+userT));
	}*/
	@Autowired
	private CReplyMapper service;
	
	@Test
	public void reply(){
		ReplyVo rpl = new ReplyVo();
		rpl.setCcno(105);
		rpl.setReplyer("관리자");
		rpl.setReplytitle("메롱");
		rpl.setReplytext("메롱");
		
		
		service.insertReply(rpl);
	      
	}
	
}