package com.flowerPot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flowerPot.delivery.service.DeliveryService;
import com.flowerPot.service.KakaoPay;
import com.flowerPot.vo.DeliveryVo;
import com.flowerPot.vo.OrderProductVo;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PayController {

	
	@Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    @Autowired
    private DeliveryService deliveryService;
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
  
    // 결제시 배송정보 저장
    @PostMapping("delivery_register")
    @ResponseBody
    public ResponseEntity<String> delivery_register(DeliveryVo delivery) {
    	log.info("배송:"+delivery);
    	//delevery.setT_code("택배회사 번호") //to.팀장님께 / insert 매퍼에 t_code컬럼 따로 추가해 주셔야합니다. VO랑 sql파일 테이블에서 컬럼은 추가했습니다(재혁)
    	delivery.setT_code("운송장 번호");  //  
    	delivery.setT_invoice("택배회사 번호");   //  랜덤으로 생성?
    	deliveryService.insertDelivery(delivery);
    	return new ResponseEntity<String>(Integer.toString(delivery.getDno()),HttpStatus.OK); 
    }
    
    // 카카오페이
	@PostMapping("/kakaoPay")
	@ResponseBody
    public ResponseEntity<String> kakaoPay(@RequestBody List<OrderProductVo> olist /*Map<String,Object> map*/) {
		ResponseEntity<String> r = null;
		log.info("리스트:"+olist);
		String url = kakaopay.kakaoPayReady(olist);
        return new ResponseEntity<String>(url,HttpStatus.OK); 
 
    }
    
	// 결제성공시 이동테이블
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, @RequestParam("order_num") String order_num, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token,order_num));
    }
}
