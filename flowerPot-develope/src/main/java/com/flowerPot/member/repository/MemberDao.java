package com.flowerPot.member.repository;

import java.util.List;

import java.util.Map;

import com.flowerPot.domain.MyCriteria;
import com.flowerPot.member.vo.MemberDTO;

import com.flowerPot.vo.MemberVo;

public interface MemberDao {

	public MemberVo read(String id);

	public void insertMember(MemberVo member);

	public int selectTotalCount();

	public void deleteMemberById(String string);

	public MemberVo selectOneMemberById(String id);

	public Integer checkId(String member);
	
	public Integer checkEmail(String member);
	
	public Integer checkPhone(String member);

	public MemberVo selectOneDeliMemById(String id);

	public List<Integer> selectMnoList();

	public void updateBrandById(Map<String, Object> map);
	
	public void authentication(MemberDTO dto);
	
	//회원정보 수정
	public void updateMember(MemberVo member) throws Exception;
		//vo에담겨진 파라미터들을 memberMapper.xml에 memberMapper라는 namespace에
		//아이디가 memberupdate인 쿼리에 파라미터들을 넣어줍니다.
	
	//비밀번호 수정
	public void updatePassword(MemberVo member) throws Exception;

	public MemberVo viewMember(String id);

	public void giveAdminAuth(String empId);

	public void updatePoint(Map<String, Object> map);

	public MemberVo selectOneMemberByMno(int mno);

	public List<Integer> selectAllMemberMno();

	public void updateRankByMno(MemberVo m);

	public void addPoint(Integer mno);

	public List<MemberVo> selectListAll(MyCriteria myCriteria);


}
