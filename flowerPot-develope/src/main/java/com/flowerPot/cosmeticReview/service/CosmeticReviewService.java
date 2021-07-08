package com.flowerPot.cosmeticReview.service;

import java.util.List;

import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.MemberVo;

public interface CosmeticReviewService {

	void insertcosmeticReview(CosmeticReviewVo cosmeticReview);

	List<CosmeticReviewVo> selectListCosmeticReviewListByCno(Integer cno);

	List<CosmeticReviewVo> selectListCosmeticReviewListByBrand(String brand);

	List<CosmeticReviewVo> selectListCosmeticReviewListByMno(MemberVo member);

}
