package com.flowerPot.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.EmpMapper;
import com.flowerPot.admin.vo.EmpVo;
import com.flowerPot.dao.AuthorityDao;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.memberAddress.repository.MemberAddressDao;
import com.flowerPot.vo.AuthorityVo;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private EmpMapper mapper;
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberAddressDao memberAddressDao;
	@Autowired
	private AuthorityDao authorityDao;
	
	
	@Override
	public void insertEmpOne(EmpVo emp) {
		mapper.insertEmpOne(emp);		
	}

	@Override
	public List<EmpVo> selectEmpList(SearchVO search) {
		return mapper.selectEmpList(search);
	}

	@Override
	public void deleteEmpOne(EmpVo emp) {
		mapper.deleteEmpOne(emp);
	}

	@Override
	public Integer countArticles(SearchVO search) {
		return mapper.countArticles(search);
	}

	@Override
	public void restoreEmpOne(EmpVo emp) {
		mapper.restoreEmpOne(emp);
		
	}

	@Override
	public List<AuthorityVo> selectEmpAuth() {
		return mapper.selectEmpAuth();
	}

	@Transactional
	@Override
	public void insertMember(MemberVo member, MemberAddressVo memberAddress, EmpVo emp) {
		memberDao.insertMember(member);
		memberAddress.setMno(member.getMno());
		memberAddressDao.insertMemberAddress(memberAddress);
		authorityDao.insertAuthority(member);
		mapper.addEmpId(emp);


	}

	@Override
	public void updateAuthorityById(String empId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", empId);
		map.put("authority", "ROLE_ADMIN");
		authorityDao.insertAuthorityById(map);
	}

	@Override
	public MemberVo selectMemberAuth(String id) {

		return memberDao.read(id);
	}



}
