package com.flowerPot.vo;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class OrderVo {

	private Integer orderno;
	private Integer mno;
	private Integer dno;
	private String order_num;
	private Integer final_price;
	private LocalDateTime regdate;
	
	private List<OrderProductVo> orderProductList;
	
}
