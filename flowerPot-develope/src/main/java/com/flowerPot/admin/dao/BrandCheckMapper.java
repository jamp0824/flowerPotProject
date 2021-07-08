package com.flowerPot.admin.dao;

public interface BrandCheckMapper {

	int compCheck(String company);

	int brandCheck(String bName);

	int busNoCheck(String busNo);

	int telCheck(String tel);

	int emailCheck(String email);


}
