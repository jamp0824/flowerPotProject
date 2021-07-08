package com.flowerPot.magazine.repository;

import java.util.List;

import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.MagazineVo;

public interface MagazineDao {

	void insertMagazine(MagazineVo magazine);

	List<MagazineVo> selectMagazineList(Criteria c);

	MagazineVo selectMagzineCont(MagazineVo mgno);

	void deleteMagazine(int mgno);

	void updateMagazine(MagazineVo magazineVo);

	int getTotalCount(Criteria c);

}
