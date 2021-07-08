package com.flowerPot.cosmetic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flowerPot.admin.service.CoupService;
import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.attachFile.service.AttachFileService;
import com.flowerPot.brand.service.BrandService;
import com.flowerPot.cosmetic.repository.CosmeticDao;
import com.flowerPot.cosmetic.service.CosmeticService;
import com.flowerPot.cosmetic.service.TypeService;
import com.flowerPot.cosmeticReview.service.CosmeticReviewService;
import com.flowerPot.description.service.DescriptionService;
import com.flowerPot.domain.CosmeticCriteria;
import com.flowerPot.domain.CosmeticPageDTO;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.memberAddress.service.MemberAddressService;
import com.flowerPot.orderProduct.repository.OrderProductDao;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.BrandVo;
import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.CosmeticVo;
import com.flowerPot.vo.DescriptionVo;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;
import com.flowerPot.vo.OrderProductVo;
import com.flowerPot.vo.TypeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("cosmetic")
@Slf4j
public class CosmeticController {

	@Autowired
	private CosmeticService cosmeticService;
	@Autowired
	private AttachFileService attachFileService;
	@Autowired
	private DescriptionService descriptionService;
	@Autowired 
	private CosmeticReviewService cosmeticReviewService;
	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private MemberAddressService memberAddressService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private BrandService brandService;
	@Autowired 
	private CoupService CoupService;
	@Autowired 
	private CosmeticDao cosmeticDao;
	@Autowired
	private OrderProductDao orderProductDao;

	// 회원 정보 시큐리티에서 가져오기
	public MemberVo getMemberBysecurity(Principal principal) {
		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			String id = principal.getName();
			memberVo = memberSerivce.selectOneMemberById(id);   // 회원정보 가져오기
		}
		return memberVo;
	}

	// 화장품 이름 유효성 검증
	@RequestMapping("isexistName")
	@ResponseBody
	public ResponseEntity<String> isexistName(String name){
		ResponseEntity<String> r = null;
		CosmeticVo cosmetic = cosmeticDao.selectCosmeticByName(name);
		if(cosmetic==null) {
			r = new ResponseEntity<String>("no", HttpStatus.OK);
		}else {
			r = new ResponseEntity<String>("yes", HttpStatus.OK);
		}
		return r;
	}

	@RequestMapping("addlikey")
	@ResponseBody
	public ResponseEntity<String> addlikey(Integer cno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("cosmeticlikey"+cno)==null) {
			session.setAttribute("cosmeticlikey"+cno, cno);
			session.setMaxInactiveInterval(3600);
			cosmeticService.updateLikey(cno);
			return  new ResponseEntity<String>("plus", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("not", HttpStatus.OK);
		}
	}

	// 결제 페이지로 이동
	@RequestMapping("payment")
	public void payment(Principal principal ,Model model,Integer root,CosmeticVo cosmetic,HttpSession session) { // root는 장바구니에서 접근하는지, 바로구매인지 구분하는 변수
		// 로그인된 회원정보 가져오기
		MemberVo memberVo = new MemberVo();
		MemberAddressVo memberAddress  = new MemberAddressVo();

		List<CoupVo> coupList = new ArrayList<CoupVo>();
		log.info("cosmetic:"+cosmetic);
		if(principal!=null) {
			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();
			memberVo = memberSerivce.selectOneMemberById(id);   // 회원정보 가져오기
			memberAddress  = memberAddressService.selectOneMemberAddressByMno(memberVo.getMno());   // 회원주소록 가져오기

			//쿠폰 목록 가져오기
			coupList = CoupService.selectCoupList(memberVo.getMno());
			log.info("쿠폰목록:"+coupList);
		}

		// 이거는 바로 구매를 했을경우 
		if(root==1) {
			CosmeticVo c = cosmeticService.selectOneCosmeticByCno(cosmetic.getCno());
			c.setNumProduct(cosmetic.getNumProduct());
			model.addAttribute("cosmetic", c);
		}

		model.addAttribute("coupList", coupList);
		model.addAttribute("memberAddress", memberAddress);  // 회원 주소정보
		model.addAttribute("member", memberVo);  // 어떤멤버인지
		model.addAttribute("root", root);

	}

	// ajax, 장바구니에 담긴 화장품 개수 업데이트
	@RequestMapping("shopping_list_update")
	@ResponseBody
	public ResponseEntity<String> shopping_list_update(Integer cno,Integer numProduct,HttpSession session) {
		log.info("장바구니에 담긴 화장품 개수 업데이트");
		log.info("cno:"+cno);
		List<CosmeticVo> cList = (List<CosmeticVo>) session.getAttribute("shoppingCartList");

		for(int i=0; i<cList.size(); i++) {
			if(cList.get(i).getCno().equals(cno)) {
				cList.get(i).setNumProduct(numProduct);
				break;
			}
		}
		log.info("장바구니:"+cList);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}

	// ajax, 장바구니에 담긴 화장품 삭제
	@RequestMapping("shopping_list_del")
	@ResponseBody
	public ResponseEntity<String> shopping_list_del(Integer cno,HttpSession session) {
		log.info("cno:"+cno);
		List<CosmeticVo> cList = (List<CosmeticVo>) session.getAttribute("shoppingCartList");
		log.info("장바구니에 담긴 화장품 삭제:"+cno);
		for(int i=0; i<cList.size(); i++) {
			if(cList.get(i).getCno().equals(cno)) {
				cList.remove(i);
				session.setAttribute("shoppingCartList", cList);
				break;
			}
		}
		log.info("장바구니:"+cList);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}

	// 장바구니 담기
	@RequestMapping("shoppingCart_register")
	public String shoppingCart_register(Integer cno,Integer isNextpage,Integer numProduct,HttpServletRequest request, HttpServletResponse response , HttpSession session) {
		log.info("cno:"+cno+" isNextpage:"+isNextpage+" numProduct: "+numProduct);
		cosmeticService.shoppingCart_register(cno,isNextpage,numProduct,session,request,response);
		if(isNextpage==1) {
			// 장바구니 리스트로 이동
			return "redirect:/shoppingList/shoppingList";
		}else {
			// 계속 쇼핑하기
			return "redirect:/";
		}
	}

	// 윤신영 - 화장품 페이지 이동 브랜치
	@RequestMapping("cosmetic_ok")
	public void cosmetic_ok(Integer cno,HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		if(cno==null) {
			out.print("<script>");
			out.print("alert('잘못된 접근입니다');");
			out.print("location.href='"+request.getContextPath()+"/cosmetic/cosmetic_list';");
			out.print("</script>");
			out.close();
		}else {
			out.print("<script>");
			out.print("location.href='"+request.getContextPath()+"/cosmetic/cosmetic?cno="+cno+"';");
			out.print("</script>");
			out.close();
		}


	}

	// 윤신영 - 화장품 구입 페이지
	@RequestMapping("cosmetic")
	public void cosmetic(Principal principal, Integer cno,Model model, HttpSession session) throws IOException {
		cosmeticService.updateCosmeticHitsByCno(cno);
		CosmeticVo cosmetic = cosmeticService.selectOneCosmeticByCno(cno);  // 상품번호로,, 화장품 정보 가져오기

		if(session.getAttribute("Cosmetic"+cno)!=null) {
			// 화장품에 한번 들어와본적이 있을떄
			log.info("중복조회");
		}else {
			// 화장품에 한번도 안들어 왔을떄
			cosmeticService.updateHits(cno);  // 화장품 조회수 업데이트
			session.setAttribute("Cosmetic"+cno, true);
			session.setMaxInactiveInterval(3600);
		}
		
		
		MemberVo member = getMemberBysecurity(principal);

		DescriptionVo description = descriptionService.selectOneDescriptionByCno(cno);
		List<CosmeticReviewVo> crList = cosmeticReviewService.selectListCosmeticReviewListByCno(cno);
		
		
		boolean flag = false;
		if(member.getMno()!=null) {
			List<OrderProductVo> oList = orderProductDao.selectListByMno(member.getMno());
			if(oList != null) {
				flag = true;
			}
		}
		
		model.addAttribute("member", member);
		model.addAttribute("cosmetic", cosmetic);
		model.addAttribute("description", description);
		model.addAttribute("crList", crList);
		model.addAttribute("flag", flag);
	}

	// 윤신영 - 화장품 리스트 페이지 이동
	@RequestMapping("cosmetic_list")
	public void cosmetic_list(Model model,CosmeticCriteria c) {
		log.info("화장품 리스트 페이지 이동"+c);
		log.info("받은 파라미터"+c);

		List<CosmeticVo> cList = null;
		// type이 null이 아닐떄, 화장품 리스트를 가져올수 있다.
		if(c.getType()!=null) {
			List<TypeVo> tList = typeService.selectListSubType(c.getType()); // 타입에 해당하는 서브 타입 가져오기
			cList = cosmeticService.selectListCosmeticByCategory(c);  // 화장품 리스트 가져오기
			log.info("타입:"+tList);

			model.addAttribute("tList", tList);
		}
		int total =  cosmeticService.selectCountByCategory(c);
		CosmeticPageDTO cosmeticPageDTO = new CosmeticPageDTO(c, total);
		// 브랜드정보
		List<BrandVo> bList = brandService.selectListAllBrand();

		log.info("페이징 정보 : "+cosmeticPageDTO);
		model.addAttribute("cosmeticPageDTO",cosmeticPageDTO);
		model.addAttribute("cList", cList);
		model.addAttribute("bList", bList);
		// 카테고리 정보
		model.addAttribute("CosmeticCriteria", c);
		model.addAttribute("type", c.getType());

	}

	// 윤신영 - 화장품 등록 페이지 이동
	@RequestMapping("cosmetic_register")
	public void cosmetic_register(Model model) {
		List<TypeVo> tList = typeService.selectListType();
		List<BrandVo> bList = brandService.selectListAllBrand();
		log.info("화장품등록페이지로, List: "+tList+bList);
		model.addAttribute("tList", tList);
		model.addAttribute("bList", bList);
	}

	// 아작스 - 서브 타입 가져오기
	@RequestMapping("subTypeList")
	@ResponseBody
	public ResponseEntity<List<TypeVo>> sub_typeList(String type) {
		ResponseEntity<List<TypeVo>> responseEntity = null;
		List<TypeVo> tList =typeService.selectListSubType(type);
		return new ResponseEntity<List<TypeVo>>(tList,HttpStatus.OK);
	}

	/*
	@RequestMapping(value = "cosmetic_register_ok", method = RequestMethod.POST)
	@ResponseBody
	public String cosmetic_register_ok(CosmeticVo cosmetic,  DescriptionVo description) {
		log.info("cosmetic : " + cosmetic.toString());
		log.info("description : " + description.toString());
		cosmeticService.cosmetic_register_ok(cosmetic,description);

		return "cosmetic/cosmetic";
	}
	 */

	// 윤신영 - 화장품 등록 (아작스)
	@RequestMapping(value = "cosmeticRegister", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> cosmeticRegister(CosmeticVo cosmetic,  DescriptionVo description){
		ResponseEntity<String> r = null;

		log.info("cosmetic : "+cosmetic.toString());
		log.info("description : "+description.toString());

		try {
			cosmeticService.insertCosmeticAndDescription(cosmetic,description);
			r= new ResponseEntity<String>(Integer.toString(cosmetic.getCno()),HttpStatus.OK);
		} catch (Exception e) {
			r= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		log.info("cosmetic cno : "+cosmetic.toString());
		return r;
	}

	// 윤신영 - 첨부파일사진 등록 (아작스)
	@RequestMapping(value = "AttachRegister", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> AttachRegister(@RequestBody List<AttachFileVo> attachList ){ //Map<String, Object> params
		ResponseEntity<String> r = null;
		log.info("attach : "+attachList.toString());
		try {
			for(AttachFileVo attach : attachList) {
				attachFileService.insertAttachFile(attach);
			}
			r= new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			r= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return r;
	}
}
