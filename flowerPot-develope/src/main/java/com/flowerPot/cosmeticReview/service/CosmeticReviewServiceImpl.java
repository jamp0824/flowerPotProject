package com.flowerPot.cosmeticReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.cosmeticReview.repository.CosmeticReviewDao;
import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.MemberVo;

@Service
public class CosmeticReviewServiceImpl implements CosmeticReviewService {

	@Autowired
	private CosmeticReviewDao cosmeticReviewDao;
	@Autowired
	private CosmeticDao cosmeticDao;
	
	@Override
	public void insertcosmeticReview(CosmeticReviewVo cosmeticReview) {
		cosmeticReviewDao.insertcosmeticReview(cosmeticReview);
	}

	@Override
	public List<CosmeticReviewVo> selectListCosmeticReviewListByCno(Integer cno) {
		return cosmeticReviewDao.selectListCosmeticReviewListByCno(cno);
	}


	@Override
	public List<CosmeticReviewVo> selectListCosmeticReviewListByBrand(String brand) {
		List<CosmeticReviewVo> list = cosmeticReviewDao.selectListCosmeticReviewListByBrand(brand);
		for(CosmeticReviewVo cr : list) {
			cr.setCosmeticVo(cosmeticDao.selectOneCosmeticByCno(cr.getCno()));
		}
		return list;
	}


	@Override
	public List<CosmeticReviewVo> selectListCosmeticReviewListByMno(MemberVo member) {
		return cosmeticReviewDao.selectListCosmeticReviewListByMno(member);
	}


}
