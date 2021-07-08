package com.flowerPot.vo;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PointVo {
	private Integer pno;
	private Integer mno;
	private Integer ono;
	private Integer add_point;
	private String order_num;
	private LocalDateTime regdate;
}


