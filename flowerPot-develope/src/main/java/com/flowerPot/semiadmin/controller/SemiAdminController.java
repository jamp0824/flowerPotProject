package com.flowerPot.semiadmin.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.flowerPot.cosmetic.service.CosmeticService;
import com.flowerPot.cosmeticReview.service.CosmeticReviewService;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.orderProduct.service.OrderProductService;
import com.flowerPot.semiadmin.model.SemiCalendarVO;
import com.flowerPot.semiadmin.model.SemiInventoryVO;
import com.flowerPot.semiadmin.model.SemiNoticeVO;
import com.flowerPot.semiadmin.model.SemiReviewVO;
import com.flowerPot.semiadmin.service.ISemiNoticeService;
import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.CosmeticVo;
import com.flowerPot.vo.MemberVo;
import com.flowerPot.vo.OrderProductVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/semiadmin")
@Slf4j
public class SemiAdminController {

	@Autowired
	private ISemiNoticeService service;
	@Autowired
	private CosmeticService cosmeticService;
	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private CosmeticReviewService cosmeticReviewService;
	@Autowired
	private OrderProductService orderProductService;

	// 회원 정보 시큐리티에서 가져오기
	public MemberVo getMemberBysecurity(Principal principal) {
		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			String id = principal.getName();
			memberVo = memberSerivce.selectOneMemberById(id);   // 회원정보 가져오기
		}
		return memberVo;
	}

	// 공지사항
	@RequestMapping("/semi_notice")
	public void table_datatable(Model model) {
		System.out.println("semi_notice 실행 !! ");

		List<SemiNoticeVO> blist = service.getArticles();
		model.addAttribute("blist",blist);

	}


	//  공지사항 게시글 번호로 지우기  } 
	@RequestMapping("/semi_notice_del_ok")
	public String table_datatable_ok(Model model, Integer sBno ) {
		System.out.println("semi_notice_del_ok : " + sBno);
		service.delTable(sBno);

		return "redirect:/semiadmin/semi_notice" ; 
	}

	//{ Review 후기  } 
	@RequestMapping("/review")
	public void review(Principal principal, Model model, Integer cno) {
		System.out.println("review 후기 페이지 실행");
		log.info("cno:"+cno);

		MemberVo memberVo = new MemberVo();
		List<CosmeticReviewVo> relist = new ArrayList<CosmeticReviewVo>();
		List<CosmeticVo> cList = new ArrayList<CosmeticVo>();

		if(principal!=null) {

			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();

			memberVo = memberSerivce.selectOneMemberById(id);
			// 회원정보로부터 브랜드명 가져오기
			String brand = memberVo.getBrand();
			// 본사의 화장품 목록
			cList = cosmeticService.selectListCosmeticByBrand(brand);

			if(cno==null) {
				relist = cosmeticReviewService.selectListCosmeticReviewListByBrand(brand);
			}else {
				// 화장품 리뷰 가져오기
				log.info("화장품 리뷰 가져오기");
				relist = cosmeticReviewService.selectListCosmeticReviewListByCno(cno);
				CosmeticVo cosmetic = cosmeticService.selectOneCosmeticByCno(cno);
				model.addAttribute("cosmetic",cosmetic);
			}
		}

		//List<SemiReviewVO> relist = service.getReviewArticles();
		model.addAttribute("cList",cList);
		model.addAttribute("relist",relist);

	}

	//{ inventory 재고 목록 
	@GetMapping("/inventory")
	public void inventory(Principal principal, Model model) {
		System.out.println("inventory 후기 페이지 실행 ");

		List<CosmeticVo> ilist = new ArrayList<CosmeticVo>();
		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();

			memberVo = memberSerivce.selectOneMemberById(id);
			String brand = memberVo.getBrand();
			ilist = cosmeticService.selectListCosmeticByBrand(brand);
		}
		model.addAttribute("ilist",ilist);
	}

	// 제품 관리 기능
	@RequestMapping("/productManage")
	public void productManage(Model model) {
		System.out.println("productManage 실행중..");

		List<CosmeticVo> colist = cosmeticService.productManage(model);
		model.addAttribute("colist",colist);

	}

	// inventory  재고 목록  추가 }
	@PostMapping("/inventory")
	public String inventory( Model model,CosmeticVo cosmetic) {

		cosmeticService.updateCosmeticStock(cosmetic);
		return "redirect:/semiadmin/inventory";
	}

	// calendar 기능 
	@RequestMapping("/calendar")
	public void calendar(Model model, SemiCalendarVO scalendar) {
		System.out.println("Calendar 실행중..");

		List<SemiCalendarVO> clist = service.getCalendar(scalendar);
		model.addAttribute("clist", clist);

	}

	// Calendar 등록 기능
	@RequestMapping("/calendarRegister")
	public String calendarRegist(SemiCalendarVO sclendar,
			@RequestParam("dateChoice") String dateChoice) {

		//String 날짜데이터 형태를 "yyyy-MM-dd"로 포맷하기위해 지정
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		//String StartPDate의 날짜를 formatter객체인 yyyy-MM-dd 형태로포맷 후 시 분 초 인스턴스를 생성 
		//.atTime() : localDateTime 시 분 초 인스턴스 생성
		sclendar.setDateChoice(LocalDate.parse(dateChoice,formatter).atTime(0,0,0));

		//service.calendarRegist(sclendar);

		return "redirect:/semiadmin/coupon";
	}


	// modal 기능 
	@RequestMapping("/modal")
	public void modal() {
		System.out.println("modal실행중..");


	}
	// todoList
	@RequestMapping("/todolist")
	public void todolist() {
		System.out.println("todolist 실행중..");
	}

	//form_editor 기능
	@RequestMapping("/form_editor")
	public void form_editor() {
		System.out.println("todolist 실행중..");
	}

	//배송 관리
	@RequestMapping("/delivery")
	public String delivery(Principal principal, Model model, Integer cno) {
		System.out.println("delivery 실행중..");

		List<OrderProductVo> opList = new ArrayList<OrderProductVo>();
		List<CosmeticVo> cList = new ArrayList<CosmeticVo>();

		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();

			memberVo = memberSerivce.selectOneMemberById(id);
			String brand = memberVo.getBrand();
			// 본사의 화장품 목록
			cList = cosmeticService.selectListCosmeticByBrand(brand);

			if(cno == null) {
				opList = orderProductService.selectListOrderProductByBrand(brand);
			}else {
				opList = orderProductService.selectListOrderProductByBrandCno(brand,cno);
			}
		}

		model.addAttribute("cList",cList);
		model.addAttribute("opList", opList);
		return "/semiadmin/delivery";
	}

	// 배송완료처리
	@RequestMapping("delivery_complete")
	public String delivery_complete(Integer ono, Integer cno) {
		orderProductService.updateOrderProductTOComplete(ono);
		return "redirect:/semiadmin/delivery?cno="+cno;
	}

	//form_editor 기능
	@RequestMapping("/chart_count")
	public void chartCount() {
		System.out.println("chart_count 실행중..");
	}
	//chart_product 기능
	@RequestMapping("/chart_product")
	public void chartProduct() {
		System.out.println("chart_product 실행중..");
	}
}
