package com.flowerPot.semiadmin.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flowerPot.semiadmin.model.AttenVO;

@Repository
public interface IAttenMapper {

	List<AttenVO> getAttendance();

	
	
}
