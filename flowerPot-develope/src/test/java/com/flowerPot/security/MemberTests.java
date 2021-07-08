package com.flowerPot.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTests {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private DataSource dataSource;

	//가짜테이블 테스트
	@Test
	public void testInsertMember() {
		String sql = "insert into f_member(mno, id, password,name,nickname,address,email,gender,birth,regdate,enabled) "
				+ "values (mno_seq.nextval,?,?,?,?,?,?,'f',?,sysdate,'1')";

		for(int i = 0; i < 368; i++) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "user"+i);
				pstmt.setString(2, passwordEncoder.encode("password"+i));
				pstmt.setString(3, "이름" + i);
				pstmt.setString(4, "닉네임");
				pstmt.setString(5, "주소");
				pstmt.setString(6, "이메일"+i);
				pstmt.setString(7, "생일");

				pstmt.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
				if(con != null) { try { con.close();  } catch(Exception e) {} }

			}
		}//end for
	}
	// 진짜 테이블 테스트
	@Test
	public void testInsertMember2() {
		String sql = "insert into f_member(mno, id, password, name,nickname,address,email,gender,birth,member_rank,regdate)"
				+ "values (mno_seq.nextval,?,?,?,'유통령','서울 동작구 장승배기로 171 아이비빌딩','yjk7454@naver.com','f','10-23','대통령',sysdate)";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "admin");
			pstmt.setString(2, passwordEncoder.encode("0000"));
			pstmt.setString(3, "대통령");

			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
			if(con != null) { try { con.close();  } catch(Exception e) {} }

		}

	}

}
