package com.flowerPot.description.repository;

import com.flowerPot.vo.DescriptionVo;

public interface DescriptionDao {

	void insertDescription(DescriptionVo description);

	void deleteAll();

	int selectCount();

	DescriptionVo selectOneDescriptionByCno(Integer cno);

}
