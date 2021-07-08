package com.flowerPot.member.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flowerPot.admin.dao.CoupMapper;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.attendance.repository.AttendanceDao;
import com.flowerPot.dao.AuthorityDao;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.member.vo.MemberDTO;
import com.flowerPot.memberAddress.repository.MemberAddressDao;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Service("memberService")
@Slf4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private MemberAddressDao memberAddressDao;
	@Autowired
	private CoupMapper coupDao;
	@Autowired
	private AttendanceDao attendanceDao;

	//회원가입
	@Transactional
	@Override
	public void insertMember(MemberVo member, MemberAddressVo memAddressVo) {
		memberDao.insertMember(member);
		authorityDao.insertAuthority(member);
		System.out.println("회원번호:"+member.getMno());
		memAddressVo.setMno(member.getMno());
		memberAddressDao.insertMemberAddress(memAddressVo);
		authorityDao.insertAuthority(member);
	}
	
	//회원정보수정
	@Override
	public void updateMember(MemberVo vo, MemberAddressVo memberAddress) throws Exception {
		memberDao.updateMember(vo);
		memberAddressDao.updateMemberAddress(memberAddress);
	}
	
	//아이디를 기준으로 회원정보조회
	@Override
	public MemberVo selectOneMemberById(String id) {		
		return memberDao.selectOneMemberById(id);
	}


	public Integer checkId(String member) {
		return memberDao.checkId(member);
	}


	@Override
	public Integer checkEmail(String member) {
		return memberDao.checkEmail(member);
	}


	@Override
	public Integer checkPhone(String member) {
		return memberDao.checkPhone(member);
	}


	@Override
	public MemberVo selectOneDeliMemById(String id) {
		return memberDao.selectOneDeliMemById(id);
	}

	
	public void authentication(MemberDTO dto) {
		memberDao.authentication(dto);
	}

	//회원 정보 업데이트 수정문
	@Override
	public void updateMember(MemberVo vo) throws Exception {
		memberDao.updateMember(vo);
	}

	
	@Override
	public void passwordUpdate(MemberVo vo) throws Exception {
		memberDao.updatePassword(vo);
	}


	@Override
	public MemberVo viewMember(String id) {
		return memberDao.viewMember(id);
	}

	@Override
	public void giveAdminAuth(String empId) {
		memberDao.giveAdminAuth(empId);
	}

	public void insertMember(MemberVo member) {
		
	}

	@Override
	public List<CoupVo> getCoupList(MemberVo member) {
		return coupDao.selectListCoupoBymno(member.getMno());
	}

	@Override
	public List<Integer> selectAllMemberMno() {
		return memberDao.selectAllMemberMno();
	}

	@Override
	public void updateRankByMno(MemberVo m) {
		memberDao.updateRankByMno(m);
	}

	// 포인트 증가, 그리고 출석체크테이블에 insert
	@Transactional
	@Override
	public void addPoint(Integer mno) {
		attendanceDao.insertAttendance(mno);
		memberDao.addPoint(mno);
	}

}
