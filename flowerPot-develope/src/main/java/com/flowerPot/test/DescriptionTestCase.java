package com.flowerPot.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.flowerPot.description.repository.DescriptionDao;
import com.flowerPot.vo.CosmeticVo;
import com.flowerPot.vo.DescriptionVo;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class DescriptionTestCase {

	@Autowired
	private DescriptionDao descriptionDao;
	@Autowired
	private CosmeticTestCase cosmeticTestCase;
	
	private List<CosmeticVo> cList;
	
	public DescriptionVo insertDescriptionTestCase(){

		this.cList=cosmeticTestCase.insertCosmeticTestCase();
		
		log.info("cList:"+cList.toString());
		DescriptionVo description=null;
		if(cList.size()!=0) {
			CosmeticVo c1 = cList.get(0);
			description = new DescriptionVo(c1.getCno(),1,1,"나라","상세정보");
			descriptionDao.insertDescription(description);
		}
		return description;
	}
}
