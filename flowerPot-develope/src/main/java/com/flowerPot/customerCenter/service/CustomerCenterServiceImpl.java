package com.flowerPot.customerCenter.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.dao.CReplyMapper;
import com.flowerPot.admin.vo.ReplyVo;
import com.flowerPot.customerCenter.repository.CustomerCenterDao;
import com.flowerPot.domain.Criteria;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.vo.CustomerCenterVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerCenterServiceImpl implements CustomerCenterService {

	@Autowired
	private CustomerCenterDao dao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CReplyMapper cReplyMapper;
	
	// 카테고리별, 검색어 조건으로 고객센터 리스트 가져오기
	@Override
	public List<CustomerCenterVo> SelectListByCategory(Criteria c) {
		List<CustomerCenterVo> list = dao.SelectListByCategory(c);
		for(CustomerCenterVo cc : list) {
			cc.setMemberVo(memberDao.selectOneMemberByMno(cc.getMno()));
			List<ReplyVo> rList = new ArrayList<ReplyVo>();
			rList = cReplyMapper.SelectListByCcno(cc.getCcno());
			cc.setRlist(rList);
			log.info("게시판 리스트:"+rList);
		}
		log.info("게시판 리스트:"+list);
		return list;
	}
	
	// 게시판 내용
	@Override
	public CustomerCenterVo getContent(int ccno) {
		CustomerCenterVo costomer = dao.getContent(ccno);
		costomer.setMemberVo(memberDao.selectOneMemberByMno(costomer.getMno()));
		log.info("게시판 내용:"+costomer);
		return costomer;
	}
	
	@Override
	public List<CustomerCenterVo> getFaq() {

		return dao.getFaq();
	}

	@Override
	public List<CustomerCenterVo> getEnqList() {

		return dao.getEnqList();
	}

	@Override
	public List<CustomerCenterVo> getNotice() {
		return dao.getNotice();
	}

	@Override
	public List<CustomerCenterVo> searchKeyword(String keyword) {

		return dao.searchKeyword(keyword);
	}

	// 게시판작업
	@Override
	public void wirteEnq(CustomerCenterVo customer) {
		if (customer.getUrl() == null) {
			System.out.println("중간확인 : " + customer.getTitle() + ", " + customer.getContent());
			dao.NoImgWirteEnq(customer);
		} else {
			System.out
					.println("중간확인 : " + customer.getTitle() + ", " + customer.getContent() + "," + customer.getUrl());

			dao.wirteEnq(customer);
		}
	}
	
	@Override
	public void editEnq(CustomerCenterVo customer) {
		dao.editEnq(customer);

	}

	@Override
	public void deleteEnq(CustomerCenterVo customer) {
		dao.deleteEnq(customer);

	}

	@Override
	public CustomerCenterVo getNotice(int ccno) {
		return dao.getNotice(ccno);
	}

	@Override
	public CustomerCenterVo getResCont(int ccno) {
		return dao.getResCont(ccno);
	}

	@Override
	public int selectCountByCategory(Criteria c) {
		return dao.selectCountByCategory(c);
	}

}
