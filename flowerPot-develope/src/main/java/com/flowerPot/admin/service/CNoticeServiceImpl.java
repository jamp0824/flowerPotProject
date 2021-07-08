package com.flowerPot.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.CNoticeMapper;
import com.flowerPot.admin.vo.CustomerVo;
@Service
public class CNoticeServiceImpl implements CNoticeService {

	@Autowired
	private CNoticeMapper mapper;
	
	@Override
	public void insertNotice(CustomerVo notice) {
		mapper.insertNotice(notice);
	}

	@Override
	public List<CustomerVo> selectNoticeList(SearchVO search) {
		return mapper.selectNoticeList(search);
	}

	@Override
	public CustomerVo getNoticeCont(int ccno) {
		return mapper.getNoticeCont(ccno);
	}

	@Override
	public void modifyNotice(CustomerVo notice) {
		mapper.modifyNotice(notice);
	}

	@Override
	public void delNotice(Integer ccno) {
		mapper.delNotice(ccno);
	}

	@Override
	public Integer countNoticeArticles(SearchVO search) {
		return mapper.countNoticeArticles(search);
	}

}
