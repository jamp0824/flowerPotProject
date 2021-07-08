package com.flowerPot.admin.service;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.EmpVo;
import com.flowerPot.vo.AuthorityVo;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;

public interface EmpService {

	void insertEmpOne(EmpVo emp);

	List<EmpVo> selectEmpList(SearchVO search);

	void deleteEmpOne(EmpVo emp);

	Integer countArticles(SearchVO search);

	void restoreEmpOne(EmpVo emp);

	List<AuthorityVo> selectEmpAuth();

	void insertMember(MemberVo member, MemberAddressVo memberAddress, EmpVo emp);

	void updateAuthorityById(String empId);

	MemberVo selectMemberAuth(String id);

}
