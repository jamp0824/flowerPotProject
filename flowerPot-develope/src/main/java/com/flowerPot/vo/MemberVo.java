package com.flowerPot.vo;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVo {
	private Integer mno;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String gender;
	private String tel;
	private String birth;
	private String member_rank;
	private Boolean enabled;
	private LocalDateTime regdate;
	private Integer point;
	private List<AuthorityVo> authList;
	private String brand;
	
	//	private List<EmpVo> empList;

	/*
	 * public MemberVo(Integer mno, String id, String password, String name, String
	 * nickname, String address, String email, String gender, String birth, String
	 * member_rank, Boolean enabled) {
	 */

	public MemberVo(int mno, String id, String password, String name, String nickname,   String email,
		String gender, String tel,String birth, String member_rank, Boolean enabled) {
		super();
		this.mno = mno;
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.tel = tel;
		this.birth = birth;
		this.member_rank = member_rank;
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "MemberVo [mno=" + mno + ", id=" + id + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", email=" + email + ", gender=" + gender + ", tel=" + tel + ", birth=" + birth
				+ ", member_rank=" + member_rank + ", enabled=" + enabled + ", regdate=" + regdate + ", point=" + point
				+ ", authList=" + authList + ", brand=" + brand + "]";
	}
	
}

