package com.flowerPot.semiadmin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.flowerPot.semiadmin.model.AttenVO;
import com.flowerPot.semiadmin.repository.IAttenMapper;

@Service
public class AttenServiceImpl implements  IAttenService{

	@Autowired
	private IAttenMapper attenmapper;
	
	@Override
	public List<AttenVO> getAttendance() {
		return attenmapper.getAttendance();
	}
	
	

}
