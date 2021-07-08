package com.flowerPot.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AttendanceVo {
	private Integer mno;
	private LocalDateTime attendance_date;
}
