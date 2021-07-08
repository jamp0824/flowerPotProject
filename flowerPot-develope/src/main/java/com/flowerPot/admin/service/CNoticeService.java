package com.flowerPot.admin.service;

import java.util.List;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.vo.CustomerVo;

public interface CNoticeService {

	void insertNotice(CustomerVo notice);

	List<CustomerVo> selectNoticeList(SearchVO search);

	CustomerVo getNoticeCont(int ccno);

	void modifyNotice(CustomerVo notice);

	void delNotice(Integer ccno);

	Integer countNoticeArticles(SearchVO search);
	
	
	
}
