package com.flowerPot.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.flowerPot.admin.dao.CoupMapper;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.member.repository.MemberDao;
import com.flowerPot.order.repository.OrderDao;
import com.flowerPot.orderProduct.repository.OrderProductDao;
import com.flowerPot.point.repository.PointDao;
import com.flowerPot.vo.CosmeticVo;
import com.flowerPot.vo.HasCouponVo;
import com.flowerPot.vo.KakaoPayApprovalVO;
import com.flowerPot.vo.KakaoPayReadyVO;
import com.flowerPot.vo.OrderProductVo;
import com.flowerPot.vo.OrderVo;
import com.flowerPot.vo.PointVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoPay {

	 private static final String HOST = "https://kapi.kakao.com";
	    
	 private KakaoPayReadyVO kakaoPayReadyVO;
	 private KakaoPayApprovalVO kakaoPayApprovalVO;
	 
	 @Autowired
	 private OrderProductDao orderProductDao;
	 @Autowired
	 private CosmeticDao cosmeticDao;
	 @Autowired
	 private OrderDao orderDao;
	 @Autowired
	 private PointDao pointDao;
	 @Autowired
	 private MemberDao memberDao;
	 @Autowired
	 private CoupMapper coupMapper;
	    
	 @Transactional
	 public String kakaoPayReady(List<OrderProductVo> olist) {
		 	HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		 	HttpSession session = req.getSession();
		 	
		 	// ???????????? ??????
		    String order_num= UUID.randomUUID().toString();  // ????????????
		    log.info("????????????:"+order_num);
		    log.info("????????????:"+olist);
		    //?????????
		    String item_name="";
		    Integer dno = null;   // ????????????
		    Integer mno = null;  // ????????????
		    int addpoint=0;  //  ????????? ?????????
		    int subtractPoint=0;  //  ??? ?????????
		    String couponName="";
		    Boolean flag=false;  // ?????? ?????? ????????? ??????
		    
		 	// ??????????????? ?????????????????? ??????
		 	// mno ??? ?????? ????????? ????????? ?????????????????? db??? ??????
		 	for(OrderProductVo orderProduct : olist) {
		 		CosmeticVo cosmetic = cosmeticDao.selectOneCosmeticByCno(orderProduct.getCno());
		 		
		 		dno = orderProduct.getDno();
		 		mno = orderProduct.getMno();
		 		couponName =orderProduct.getCouponName();
		 		subtractPoint = orderProduct.getPoint();
		 		
		 		// ?????? ????????? no ?????????, ????????? ???????????? ?????????
		 		if(orderProduct.getCouponName().equals("no")) {
		 			orderProduct.setCouponName(null);
		 			flag=false;
		 		}else {
		 			flag=true;
		 		}
		 		
		 		log.info("????????????:"+orderProduct.getMno());
		 		// ????????? ??????
		 		if(orderProduct.getMno()!=null) {
		 			orderProduct.setOrder_num(order_num);   //  ???????????? ??????
		 			orderProduct.setBrand(cosmetic.getBrand()); // ???????????? ??????
		 			orderProductDao.insertOrderProduct(orderProduct);
		 			
		 			log.info("?????????:"+cosmetic);
		 			
		 			// ???????????? ????????? ?????????, ?????? ???????????? ?????? ????????????
		 			int original_price = cosmetic.getPrice();
		 			int discountPercent = cosmetic.getDiscountPersent();
		 			int amount = orderProduct.getAmount();
		 			int price = amount * original_price * (100-discountPercent)/100;  // ????????? ????????? ????????? ??? ??????(??????????????? ??????)
		 			
		 			if(orderProduct.getMember_rank().equals("??????")) {
		 				addpoint = addpoint + price*1/100;
		 			}else if(orderProduct.getMember_rank().equals("??????")) {
		 				addpoint = addpoint + price*2/100;
		 			}else if(orderProduct.getMember_rank().equals("???")) {
		 				addpoint = addpoint + price*3/100;
		 			}else if(orderProduct.getMember_rank().equals("??????")) {
		 				addpoint = addpoint + price*5/100;
		 			}
		 			
		 			log.info("original_price:"+original_price);
		 			log.info("price:"+price);
		 			log.info("discountPercent:"+discountPercent);
		 			log.info("amount:"+amount);
		 			log.info("addpoint:"+addpoint);
		 		}else {
		 			// ???????????? ??????
		 			orderProduct.setOrder_num(order_num);   //  ???????????? ??????
		 			orderProduct.setBrand(cosmetic.getBrand());  // ???????????? ??????
		 			orderProductDao.insertOrderProductNoMember(orderProduct);
		 		}
		 		item_name=item_name.concat("/"+cosmeticDao.selectOneCosmeticByCno(orderProduct.getCno()).getName()); //  ?????? ??? ???????????????????????????, ?????? ????????? ??????
		 	}// end for???
		 	
		 	// ????????? ???????????? ??????, ???????????? ??????, ???????????? ??????
		 	if(mno!=null) {
		 		PointVo p = new PointVo();
			 	p.setAdd_point(addpoint);
	 			p.setMno(mno);
	 			p.setOrder_num(order_num);
	 			// p.setOno(orderProduct.getOno());
	 			pointDao.insertPoint(p);  
	 			Map<String, Object> map = new HashMap<String, Object>();
	 			
	 			map.put("addpoint", addpoint);
	 			map.put("subtractPoint", subtractPoint);
	 			map.put("mno", mno);
	 			memberDao.updatePoint(map);  // ?????? ????????? ?????????
		 	}
		 	
		 	// ?????? ?????? ??????
		 	if(flag) {
		 		CoupVo coupon = coupMapper.selectOneCouponByName(couponName);
		 		HasCouponVo hc = new HasCouponVo();
		 		hc.setCouNo(coupon.getCouNo());
		 		hc.setMno(mno);
		 		coupMapper.deleteCoupon(hc);
		 	}
		 	
		 	
		 	// order ???????????? insert
		 	OrderVo orderVo = new OrderVo();
		 	orderVo.setDno(dno);
		 	orderVo.setMno(mno);
		 	orderVo.setOrder_num(order_num);
		 	orderVo.setFinal_price(olist.get(0).getFinal_price());
		 	orderDao.insertOrder(orderVo);
		 	
		 	// ?????? ?????? ??????
		 	Integer final_price = olist.get(0).getFinal_price();
		 	// ???????????? ?????? ??????
		 	session.removeAttribute("shoppingCartList");
		 
	        RestTemplate restTemplate = new RestTemplate();
	        
	        // ????????? ????????? Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "e75023d0f7ce24f934994ce0d336da5e");  // app admin ???
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        // ????????? ????????? Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", "1001");     			// ????????? ????????????
	        params.add("partner_user_id", "flowerpot");				 // ????????? ???????????????
	        params.add("item_name", item_name); 	//??????				 // ?????????
	        params.add("item_code", order_num); //?????? 				 // ???????????? 
	        params.add("quantity", "1");  	//??????						 // ????????????
	        params.add("total_amount", final_price.toString());	//??????	   // ?????? ??????
	        params.add("tax_free_amount", "100");							 // ?????? ????????? ??????
	        params.add("approval_url", "http://localhost:8282/flowerPot/kakaoPaySuccess?order_num="+order_num);
	        params.add("cancel_url", "http://localhost:8282/flowerPot/kakaoPayCancel");
	        params.add("fail_url", "http://localhost:8282/flowerPot/kakaoPaySuccessFail");
	 
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);  // ?????? ?????????  ???????
	 
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	            
	            log.info("kakaoPayReadyVO : " + kakaoPayReadyVO);
	            
	            return kakaoPayReadyVO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return "/pay";
	        
	    }
	 
	 public KakaoPayApprovalVO kakaoPayInfo(String pg_token,String order_num) {
		 
	        log.info("KakaoPayInfoVO............................................");
	        log.info("-----------------------------");
	        log.info("order_num : " + order_num);
	        
	        // order_num ???????????????.. ???????????? ????????????!
	        List<OrderProductVo> oList = orderProductDao.selectListOrderProductByOrderNum(order_num);
	        
	        // ????????? ?????? ???????????? ??????;
	        int total_amount = oList.get(0).getFinal_price();
	        log.info("total_amount : " + total_amount);
	        
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // ????????? ????????? Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "e75023d0f7ce24f934994ce0d336da5e");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // ????????? ????????? Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "flowerpot");
	        params.add("pg_token", pg_token);
	        params.add("total_amount", Integer.toString(total_amount));
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	            log.info("" + kakaoPayApprovalVO);
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
}
