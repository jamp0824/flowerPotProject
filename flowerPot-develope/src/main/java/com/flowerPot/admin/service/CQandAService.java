package com.flowerPot.admin.service;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.CustomerVo;

public interface CQandAService {

	List<CustomerVo> selectQandAList(SearchVO search);

	void insertQandA(CustomerVo qANDa);

	CustomerVo getQandACont(Integer ccno);

	void modifyQandA(CustomerVo qANDa);

	void delQandA(Integer ccno);

	Integer countQandAArticles(SearchVO search);

}
