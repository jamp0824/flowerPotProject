package com.flowerPot.admin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.dao.CoupMapper;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.vo.HasCouponVo;
import com.flowerPot.vo.MemberVo;

@Service
public class CoupServiceImpl implements CoupService {
	
	@Autowired
	private CoupMapper mapper;
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void couponRegist(CoupVo coupon) {
		mapper.couponRegist(coupon);
	}
	@Override
	public List<CoupVo> selectCoupList(SearchVO search) {
		return mapper.selectCoupList(search);
	}
	@Override
	public MemberVo selectMemOne(String id) {
		return mapper.selectMemOne(id);
	}
	@Override
	public Integer countCouponArticles(SearchVO search) {
		return mapper.countCouponArticles(search);
	}
	@Override
	public void insertCouponToMember(String id, Integer couNo, Integer radio) {
		
		if(radio.equals(1)) { 
			// 모든회원
			List<Integer> mnoList = memberDao.selectMnoList();
			Log.info("멤버배열리스트" + mnoList);
			for(Integer mno : mnoList) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("mno", mno);
				map.put("couNo", couNo);
				mapper.insertCouponToMember(map);
			}
			
		}else {
			// 특정회원
			String[] list = id.split(id, ',');
			Log.info("배열리스트" + list);
			List<String> id_list = new ArrayList<>(Arrays.asList(list));
			Log.info("배열리스트" + id_list);
			for(String idOne : id_list) {
				Map<String, Object> map = new HashMap<String, Object>();
				MemberVo member = memberDao.selectOneMemberById(idOne);
				map.put("mno", member.getMno());
				map.put("couNo", couNo);
				mapper.insertCouponToMember(map);
			}
		}
	}
	@Override
	public List<CoupVo> selectCoupList(Integer mno) {
		List<HasCouponVo> hasCoupList =  mapper.selectListHasCoupListByMno(mno);
		Log.info("쿠폰목록:"+hasCoupList);
		List<CoupVo> coupList = new ArrayList<CoupVo>();
		for(HasCouponVo hc : hasCoupList) {
			CoupVo coupVo = mapper.selectCoupListByCouno(hc.getCouNo());
			coupVo.setMno(mno);
			coupList.add(coupVo);
		}
		return coupList;
	}
	
}
