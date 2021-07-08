package com.flowerPot.magazine.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.MagazineVo;

public interface MagazineService {

	MagazineVo insertMagazine(MagazineVo magazine, MultipartHttpServletRequest mrequset);

	List<MagazineVo> selectMagazineList(Criteria c);

	MagazineVo selectMagzineCont(MagazineVo mg);

	void deleteMagazine(int mgno);

	void updateMagazine(MagazineVo magazineVo);

	int getTotalCount(Criteria c);

}
