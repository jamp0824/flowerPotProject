package com.flowerPot.cosmetic.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.flowerPot.attachFile.repository.AttachFileDao;
import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.cosmeticReview.repository.CosmeticReviewDao;
import com.flowerPot.description.repository.DescriptionDao;
import com.flowerPot.domain.CosmeticCriteria;
import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.CosmeticVo;
import com.flowerPot.vo.DescriptionVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CosmeticServiceImpl implements CosmeticService {

	@Autowired
	private CosmeticDao cosmeticDao;
	@Autowired
	private DescriptionDao descriptionDao;
	@Autowired
	private AttachFileDao attachFileDao;
	@Autowired
	private CosmeticReviewDao cosmeticReviewDao;

	// 상품등록
	@Transactional
	@Override
	public void insertCosmeticAndDescription(CosmeticVo cosmetic, DescriptionVo description) {
		String code = cosmetic.getBrand() + "_" + UUID.randomUUID().toString(); // 상품코드 생성
		cosmetic.setCode(code);
		cosmeticDao.insertCosmetic(cosmetic);
		description.setCno(cosmetic.getCno());
		descriptionDao.insertDescription(description);
	}

	// 상품 정보 가져오기
	@Override
	public List<CosmeticVo> selectListCosmeticByCategory(CosmeticCriteria c) {
		List<CosmeticVo> cList = cosmeticDao.selectListCosmeticByCategory(c);

		// 화장품에 섬네일 이미지 하나를 가져오는 작업, 없다면 가져오지 않음
		for (CosmeticVo cosmetic : cList) {
			List<AttachFileVo> mappingURLList = attachFileDao.selectMappingURLByCno(cosmetic.getCno());
			if (mappingURLList.size() != 0) {
				cosmetic.setMappingURL(mappingURLList.get(0).getMappingURL());
				log.info("cosmetic : " + cosmetic.toString());
			}
		}
		return cList;
	}

	// cno로 화장품 정보 가져오기
	@Override
	public CosmeticVo selectOneCosmeticByCno(Integer cno) {
		CosmeticVo cosmetic = cosmeticDao.selectOneCosmeticByCno(cno);
		List<CosmeticReviewVo> crList = cosmeticReviewDao.selectListCosmeticReviewListByCnoRating(cno);
		Integer rating = 0;
		Double drating = 0.0;
		// 화장품 평점리스트가 0이 아니면
		if (crList.size() != 0) {
			for (CosmeticReviewVo c : crList) {
				if (c.getRating() != null) {
					rating += c.getRating();
					drating += c.getRating();
				}
			}
			cosmetic.setRating(rating / crList.size());
			cosmetic.setDrating(Math.round(drating / crList.size() * 100) / 100.0);
		} else {
			cosmetic.setRating(rating);
			cosmetic.setDrating(0.0);
		}

		return cosmetic;
	}

	// 장바구니 ,세션에 화장품 리스트 넣기
	@Override
	public void shoppingCart_register(Integer cno, Integer isNextpage, Integer numProduct, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		CosmeticVo cosmetic = cosmeticDao.selectOneCosmeticByCno(cno);
		cosmetic.setNumProduct(numProduct);
		log.info("장바구니 : 담김"+cosmetic);
		if (session.getAttribute("shoppingCartList") == null) {
			List<CosmeticVo> shoppingCartList = new ArrayList<CosmeticVo>();
			shoppingCartList.add(cosmetic);
			session.setAttribute("shoppingCartList", shoppingCartList);
		} else {
			List<CosmeticVo> shoppingCartList = (List<CosmeticVo>) session.getAttribute("shoppingCartList");
			shoppingCartList.add(cosmetic);
			session.setAttribute("shoppingCartList", shoppingCartList);
		}
	}

	// 조회수 업데이터
	@Override
	public void updateCosmeticHitsByCno(Integer cno) {
		cosmeticDao.updateCosmeticHitsByCno(cno);
	}

	@Override

	public int selectCountByCategory(CosmeticCriteria c) {
		return cosmeticDao.selectCountByCategory(c);
	}

	@Override
	public void updateHits(Integer cno) {
		cosmeticDao.updateHits(cno);
	}

	public List<CosmeticVo> productManage(Model model) {
		
		return cosmeticDao.getProductlist();
	}

	@Override
	public void updateLikey(Integer cno) {
		cosmeticDao.updateLikey(cno);
	}

	@Override
	public void updateCosmeticStock(CosmeticVo cosmetic) {
		cosmeticDao.updateCosmeticStock(cosmetic);
	}

	@Override
	public List<CosmeticVo> selectListCosmetic() {
		
		return cosmeticDao.selectListCosmetic();
	}

	@Override
	public List<CosmeticVo> selectListCosmeticByBrand(String brand) {

		return cosmeticDao.selectListCosmeticByBrand(brand);
	}

	@Override
	public void updateCosmeticByCno(CosmeticVo cosmetic) {
		cosmeticDao.updateCosmeticByCno(cosmetic);
	}
}
