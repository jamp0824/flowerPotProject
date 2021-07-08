package com.flowerPot.event.repository;

import java.util.List;

import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.EventVo;

public interface EventDao {

	void insertEvent(EventVo event);

	List<EventVo> selectListEvent(Criteria c);

	EventVo selectOneEventByEno(Integer eno);

	Object deleteOneEventByEno(Integer eno);

}
