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
		 	
		 	// 주문번호 생성
		    String order_num= UUID.randomUUID().toString();  // 주문번호
		    log.info("주문번호:"+order_num);
		    log.info("주문정보:"+olist);
		    //상품명
		    String item_name="";
		    Integer dno = null;   // 배송번호
		    Integer mno = null;  // 회원번호
		    int addpoint=0;  //  추가할 포인트
		    int subtractPoint=0;  //  뺄 포인트
		    String couponName="";
		    Boolean flag=false;  // 쿠폰 사용 여부를 저장
		    
		 	// 반복문으로 주문테이블에 저장
		 	// mno 가 있냐 없냐에 따라서 다른방법으로 db에 저장
		 	for(OrderProductVo orderProduct : olist) {
		 		CosmeticVo cosmetic = cosmeticDao.selectOneCosmeticByCno(orderProduct.getCno());
		 		
		 		dno = orderProduct.getDno();
		 		mno = orderProduct.getMno();
		 		couponName =orderProduct.getCouponName();
		 		subtractPoint = orderProduct.getPoint();
		 		
		 		// 쿠폰 이름이 no 일경우, 쿠폰을 사용하지 않은것
		 		if(orderProduct.getCouponName().equals("no")) {
		 			orderProduct.setCouponName(null);
		 			flag=false;
		 		}else {
		 			flag=true;
		 		}
		 		
		 		log.info("회원번호:"+orderProduct.getMno());
		 		// 회원인 경우
		 		if(orderProduct.getMno()!=null) {
		 			orderProduct.setOrder_num(order_num);   //  주문번호 저장
		 			orderProduct.setBrand(cosmetic.getBrand()); // 브랜드명 저장
		 			orderProductDao.insertOrderProduct(orderProduct);
		 			
		 			log.info("화장품:"+cosmetic);
		 			
		 			// 회원에게 추가할 포인트, 회원 등급별로 다른 퍼센트지
		 			int original_price = cosmetic.getPrice();
		 			int discountPercent = cosmetic.getDiscountPersent();
		 			int amount = orderProduct.getAmount();
		 			int price = amount * original_price * (100-discountPercent)/100;  // 하나의 종류의 화장품 총 가격(할인율까지 적용)
		 			
		 			if(orderProduct.getMember_rank().equals("씨앗")) {
		 				addpoint = addpoint + price*1/100;
		 			}else if(orderProduct.getMember_rank().equals("새싹")) {
		 				addpoint = addpoint + price*2/100;
		 			}else if(orderProduct.getMember_rank().equals("꽃")) {
		 				addpoint = addpoint + price*3/100;
		 			}else if(orderProduct.getMember_rank().equals("나무")) {
		 				addpoint = addpoint + price*5/100;
		 			}
		 			
		 			log.info("original_price:"+original_price);
		 			log.info("price:"+price);
		 			log.info("discountPercent:"+discountPercent);
		 			log.info("amount:"+amount);
		 			log.info("addpoint:"+addpoint);
		 		}else {
		 			// 비회원인 경우
		 			orderProduct.setOrder_num(order_num);   //  주문번호 저장
		 			orderProduct.setBrand(cosmetic.getBrand());  // 브랜드명 저장
		 			orderProductDao.insertOrderProductNoMember(orderProduct);
		 		}
		 		item_name=item_name.concat("/"+cosmeticDao.selectOneCosmeticByCno(orderProduct.getCno()).getName()); //  이거 좀 비효율적인거같은데, 하튼 아이템 이름
		 	}// end for문
		 	
		 	// 회원이 구입했을 경우, 포인트를 등록, 포인트를 추가
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
	 			memberDao.updatePoint(map);  // 회원 포인트 올리기
		 	}
		 	
		 	// 쿠폰 제거 작업
		 	if(flag) {
		 		CoupVo coupon = coupMapper.selectOneCouponByName(couponName);
		 		HasCouponVo hc = new HasCouponVo();
		 		hc.setCouNo(coupon.getCouNo());
		 		hc.setMno(mno);
		 		coupMapper.deleteCoupon(hc);
		 	}
		 	
		 	
		 	// order 테이블에 insert
		 	OrderVo orderVo = new OrderVo();
		 	orderVo.setDno(dno);
		 	orderVo.setMno(mno);
		 	orderVo.setOrder_num(order_num);
		 	orderVo.setFinal_price(olist.get(0).getFinal_price());
		 	orderDao.insertOrder(orderVo);
		 	
		 	// 최종 결제 가격
		 	Integer final_price = olist.get(0).getFinal_price();
		 	// 장바구니 세션 종료
		 	session.removeAttribute("shoppingCartList");
		 
	        RestTemplate restTemplate = new RestTemplate();
	        
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "e75023d0f7ce24f934994ce0d336da5e");  // app admin 키
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", "1001");     			// 가맹점 주문번호
	        params.add("partner_user_id", "flowerpot");				 // 가명점 회원아이디
	        params.add("item_name", item_name); 	//변경				 // 상품명
	        params.add("item_code", order_num); //변경 				 // 상품코드 
	        params.add("quantity", "1");  	//변경						 // 상품수량
	        params.add("total_amount", final_price.toString());	//변경	   // 상품 총액
	        params.add("tax_free_amount", "100");							 // 상품 비과세 금액
	        params.add("approval_url", "http://localhost:8282/flowerPot/kakaoPaySuccess?order_num="+order_num);
	        params.add("cancel_url", "http://localhost:8282/flowerPot/kakaoPayCancel");
	        params.add("fail_url", "http://localhost:8282/flowerPot/kakaoPaySuccessFail");
	 
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);  // 너는 뭐하는  애니?
	 
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
	        
	        // order_num 주문번호로.. 상품정보 가져오자!
	        List<OrderProductVo> oList = orderProductDao.selectListOrderProductByOrderNum(order_num);
	        
	        // 가격만 일단 맞춰주면 된다;
	        int total_amount = oList.get(0).getFinal_price();
	        log.info("total_amount : " + total_amount);
	        
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "e75023d0f7ce24f934994ce0d336da5e");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
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
