package com.flowerPot.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DescriptionVo {

	private Integer cno;
	private Integer capacity;
	private Integer period;
	private String useMethod;
	private String nation;
	
	public DescriptionVo(int cno, int capacity, int period, String nation) {
		super();
		this.cno = cno;
		this.capacity = capacity;
		this.period = period;
		this.nation = nation;
	}
	
	
}
