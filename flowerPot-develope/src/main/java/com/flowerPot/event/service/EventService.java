package com.flowerPot.event.service;

import java.util.List;

import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.EventVo;

public interface EventService {

	void insertEvent(EventVo event);

	List<EventVo> selectListEvent(Criteria c);

	EventVo selectOneEventByEno(Integer eno);

	void deleteOneEventByEno(Integer eno);

}
