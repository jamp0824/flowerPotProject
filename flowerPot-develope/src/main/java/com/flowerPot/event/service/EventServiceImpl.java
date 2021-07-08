package com.flowerPot.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowerPot.domain.Criteria;
import com.flowerPot.event.repository.EventDao;
import com.flowerPot.vo.EventVo;

@Service
public class EventServiceImpl implements EventService {

	@Autowired EventDao eventDao;
	
	@Override
	public void insertEvent(EventVo event) {
		eventDao.insertEvent(event);
	}

	@Override
	public List<EventVo> selectListEvent(Criteria c) {
		return eventDao.selectListEvent(c);
	}

	@Override
	public EventVo selectOneEventByEno(Integer eno) {
		return eventDao.selectOneEventByEno(eno);
	}

	@Override
	public void deleteOneEventByEno(Integer eno) {
		eventDao.deleteOneEventByEno(eno);
	}

}
