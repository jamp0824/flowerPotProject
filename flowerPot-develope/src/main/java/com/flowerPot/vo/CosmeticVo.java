package com.flowerPot.vo;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CosmeticVo {
	//  DB필드
	private Integer cno;
	private String name;
	private String code;
	private String type;
	private String sub_type;
	private String brand;
	private String content;
	private String skinType;
	private Integer price;
	private String tag;
	private Integer discountPersent;  // 할인률
	private Integer stockNumber;  // 재고수
	private Integer hits;
	private Integer likey;
	private Boolean enable;
	private LocalDateTime regdate;
	private Integer rating;
	private String proOption; //상품 색상, 사이즈
	//  /DB필드
	
	private Double Drating;
	private Integer numProduct;  // 장바구니 갈때 숫자
	private String mappingURL;   // 하나의 매핑주소
	private List<String> mappingList;  // 여러개의 매핑주소
	
	private Integer plusStock;   //수량 추가 
	private List<CosmeticVo> list;
	
	
	public CosmeticVo(Integer cno, String name, String code, String type, String sub_type, String brand, String content,
			String skinType, Integer price, Integer discountPersent) {
		super();
		this.cno = cno;
		this.name = name;
		this.code = code;
		this.type = type;
		this.sub_type = sub_type;
		this.brand = brand;
		this.content = content;
		this.skinType = skinType;
		this.price = price;
		this.discountPersent = discountPersent;
	}
	
	public CosmeticVo(int cno, String name, String type, String brand, String skinType,String sub_type, int price, int discountPersent,
			int stockNumber) {
		super();
		this.cno = cno;
		this.name = name;
		this.type = type;
		this.brand = brand;
		this.sub_type = sub_type;
		this.skinType = skinType;
		this.price = price;
		this.discountPersent = discountPersent;
		this.stockNumber = stockNumber;
	}

	public CosmeticVo(int cno, String name, String type, String brand, String skinType, int price, int discountPersent,
			int stockNumber, LocalDateTime regdate) {
		super();
		this.cno = cno;
		this.name = name;
		this.type = type;
		this.brand = brand;
		this.skinType = skinType;
		this.price = price;
		this.discountPersent = discountPersent;
		this.stockNumber = stockNumber;
		this.regdate = regdate;
	}

	public CosmeticVo(Integer cno, String name, String code, String type, String sub_type, String brand, String content,
			String skinType, Integer price, String tag, Integer discountPersent, Integer stockNumber, Integer hits,
			Integer likey, Boolean enable, LocalDateTime regdate, Integer rating) {
		super();
		this.cno = cno;
		this.name = name;
		this.code = code;
		this.type = type;
		this.sub_type = sub_type;
		this.brand = brand;
		this.content = content;
		this.skinType = skinType;
		this.price = price;
		this.tag = tag;
		this.discountPersent = discountPersent;
		this.stockNumber = stockNumber;
		this.hits = hits;
		this.likey = likey;
		this.enable = enable;
		this.regdate = regdate;
		this.rating = rating;
	}


}
