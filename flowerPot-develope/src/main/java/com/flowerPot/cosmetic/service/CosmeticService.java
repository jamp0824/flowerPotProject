package com.flowerPot.cosmetic.service;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flowerPot.domain.CosmeticCriteria;
import org.springframework.ui.Model;
import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.CosmeticVo;
import com.flowerPot.vo.DescriptionVo;

public interface CosmeticService {

	void insertCosmeticAndDescription(CosmeticVo cosmetic, DescriptionVo description);

	List<CosmeticVo> selectListCosmeticByCategory(CosmeticCriteria c);

	CosmeticVo selectOneCosmeticByCno(Integer cno);

	void shoppingCart_register(Integer cno, Integer isNextpage, Integer numProduct, HttpSession session, HttpServletRequest request, HttpServletResponse response);

	void updateCosmeticHitsByCno(Integer cno);
	
	List<CosmeticVo> productManage(Model model);

	int selectCountByCategory(CosmeticCriteria c);

	void updateHits(Integer cno);

	void updateLikey(Integer cno);

	void updateCosmeticStock(CosmeticVo cosmetic);

	List<CosmeticVo> selectListCosmetic();

	List<CosmeticVo> selectListCosmeticByBrand(String brand);

	void updateCosmeticByCno(CosmeticVo cosmetic);

}
