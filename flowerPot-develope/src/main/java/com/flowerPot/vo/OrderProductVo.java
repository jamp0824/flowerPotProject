package com.flowerPot.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderProductVo {

	private Integer ono;
	private Integer mno;
	private Integer cno;
	private Integer dno;
	private String order_num;
	private Integer amount;
	private String state;  // 주문상태,, 주문완료인지, 취소인지., 교환.. 환불?   디폴트값이 필요할까?
	private String deliver_state;
	private String member_rank;
	private Integer point;
	private String couponName;
	private LocalDateTime regdate;
	private String name;
	private String tel;
	private String email;
	private Integer final_price;
	private String brand;
	
	private CosmeticVo cosmeticVo;
	private MemberVo memberVo;
	
	public OrderProductVo(Integer ono, Integer cno, Integer dno, String order_num, Integer amount, String state,
			String deliver_state, String member_rank, Integer point, String couponName, LocalDateTime regdate,
			String tel, String email, Integer price, Integer final_price) {
		super();
		this.ono = ono;
		this.cno = cno;
		this.dno = dno;
		this.order_num = order_num;
		this.amount = amount;
		this.state = state;
		this.deliver_state = deliver_state;
		this.member_rank = member_rank;
		this.point = point;
		this.couponName = couponName;
		this.regdate = regdate;
		this.tel = tel;
		this.email = email;
		this.final_price = final_price;
	}
	
	
}

