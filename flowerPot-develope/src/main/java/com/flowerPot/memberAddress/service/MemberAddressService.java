package com.flowerPot.memberAddress.service;

import com.flowerPot.vo.MemberAddressVo;

public interface MemberAddressService {

	MemberAddressVo selectOneMemberAddressByMno(Integer mno);

	void insertMemberAddress(MemberAddressVo memberAddress);

}
