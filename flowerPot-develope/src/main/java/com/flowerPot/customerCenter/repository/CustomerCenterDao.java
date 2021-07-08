package com.flowerPot.customerCenter.repository;

import java.util.List;

import com.flowerPot.domain.Criteria;
import com.flowerPot.vo.CustomerCenterVo;

public interface CustomerCenterDao {

	List<CustomerCenterVo> getFaq();

	List<CustomerCenterVo> getEnqList();

	List<CustomerCenterVo> getNotice();

	List<CustomerCenterVo> searchKeyword(String keyword);

	void wirteEnq(CustomerCenterVo customer);

	void NoImgWirteEnq(CustomerCenterVo customer);

	CustomerCenterVo getContent(int ccno);

	void editEnq(CustomerCenterVo custome);

	void deleteEnq(CustomerCenterVo customer);

	CustomerCenterVo getNotice(int ccno);

	CustomerCenterVo getResCont(int ccno);

	List<CustomerCenterVo> SelectListByCategory(Criteria c);

	int selectCountByCategory(Criteria c);


}
