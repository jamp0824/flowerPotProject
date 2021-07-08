package com.flowerPot.memberAddress.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.memberAddress.repository.MemberAddressDao;
import com.flowerPot.vo.MemberAddressVo;

@Service
public class MemberAddressServiceImpl implements MemberAddressService {

	@Autowired
	private MemberAddressDao memberAddressDao;
	
	@Override
	public MemberAddressVo selectOneMemberAddressByMno(Integer mno) {
		return memberAddressDao.selectOneMemberAddressByMno(mno);
	}

	@Override
	public void insertMemberAddress(MemberAddressVo memberAddress) {
		memberAddressDao.insertMemberAddress(memberAddress);
		
	}

}
