package com.flowerPot.admin.dao;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.CustomerVo;

public interface CFaQMapper {

	void insertFaQ(CustomerVo notice);

	List<CustomerVo> selectFaQList(SearchVO search);

	CustomerVo getFaQCont(int ccno);

	void modifyFaQ(CustomerVo notice);

	void delFaQ(Integer ccno);

	Integer countFAQArticles(SearchVO search);
	
	
	
}
