package com.flowerPot.memberAddress.repository;

import com.flowerPot.vo.MemberAddressVo;

public interface MemberAddressDao {

	MemberAddressVo selectOneMemberAddressByMno(Integer mno);

	void insertMemberAddress(MemberAddressVo memberAddress);

	void updateMemberAddress(MemberAddressVo memberAddress);
	

}
