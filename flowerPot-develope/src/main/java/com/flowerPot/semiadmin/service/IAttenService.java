package com.flowerPot.semiadmin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.flowerPot.semiadmin.model.AttenVO;

public interface IAttenService {

	List<AttenVO> getAttendance();

}
