package com.flowerPot.attendance.repository;

import java.util.List;

import com.flowerPot.vo.AttendanceVo;

public interface AttendanceDao {

	List<AttendanceVo> selectListByMno(Integer mno);

	void insertAttendance(Integer mno);


}
