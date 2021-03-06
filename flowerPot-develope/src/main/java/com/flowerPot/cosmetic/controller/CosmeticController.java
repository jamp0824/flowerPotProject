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

	// ?????? ?????? ?????????????????? ????????????
	public MemberVo getMemberBysecurity(Principal principal) {
		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			String id = principal.getName();
			memberVo = memberSerivce.selectOneMemberById(id);   // ???????????? ????????????
		}
		return memberVo;
	}

	// ????????? ?????? ????????? ??????
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

	// ?????? ???????????? ??????
	@RequestMapping("payment")
	public void payment(Principal principal ,Model model,Integer root,CosmeticVo cosmetic,HttpSession session) { // root??? ?????????????????? ???????????????, ?????????????????? ???????????? ??????
		// ???????????? ???????????? ????????????
		MemberVo memberVo = new MemberVo();
		MemberAddressVo memberAddress  = new MemberAddressVo();

		List<CoupVo> coupList = new ArrayList<CoupVo>();
		log.info("cosmetic:"+cosmetic);
		if(principal!=null) {
			log.info("?????????:"+principal.getName());  // ?????? ????????? member ????????? ????????????..
			String id = principal.getName();
			memberVo = memberSerivce.selectOneMemberById(id);   // ???????????? ????????????
			memberAddress  = memberAddressService.selectOneMemberAddressByMno(memberVo.getMno());   // ??????????????? ????????????

			//?????? ?????? ????????????
			coupList = CoupService.selectCoupList(memberVo.getMno());
			log.info("????????????:"+coupList);
		}

		// ????????? ?????? ????????? ???????????? 
		if(root==1) {
			CosmeticVo c = cosmeticService.selectOneCosmeticByCno(cosmetic.getCno());
			c.setNumProduct(cosmetic.getNumProduct());
			model.addAttribute("cosmetic", c);
		}

		model.addAttribute("coupList", coupList);
		model.addAttribute("memberAddress", memberAddress);  // ?????? ????????????
		model.addAttribute("member", memberVo);  // ??????????????????
		model.addAttribute("root", root);

	}

	// ajax, ??????????????? ?????? ????????? ?????? ????????????
	@RequestMapping("shopping_list_update")
	@ResponseBody
	public ResponseEntity<String> shopping_list_update(Integer cno,Integer numProduct,HttpSession session) {
		log.info("??????????????? ?????? ????????? ?????? ????????????");
		log.info("cno:"+cno);
		List<CosmeticVo> cList = (List<CosmeticVo>) session.getAttribute("shoppingCartList");

		for(int i=0; i<cList.size(); i++) {
			if(cList.get(i).getCno().equals(cno)) {
				cList.get(i).setNumProduct(numProduct);
				break;
			}
		}
		log.info("????????????:"+cList);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}

	// ajax, ??????????????? ?????? ????????? ??????
	@RequestMapping("shopping_list_del")
	@ResponseBody
	public ResponseEntity<String> shopping_list_del(Integer cno,HttpSession session) {
		log.info("cno:"+cno);
		List<CosmeticVo> cList = (List<CosmeticVo>) session.getAttribute("shoppingCartList");
		log.info("??????????????? ?????? ????????? ??????:"+cno);
		for(int i=0; i<cList.size(); i++) {
			if(cList.get(i).getCno().equals(cno)) {
				cList.remove(i);
				session.setAttribute("shoppingCartList", cList);
				break;
			}
		}
		log.info("????????????:"+cList);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}

	// ???????????? ??????
	@RequestMapping("shoppingCart_register")
	public String shoppingCart_register(Integer cno,Integer isNextpage,Integer numProduct,HttpServletRequest request, HttpServletResponse response , HttpSession session) {
		log.info("cno:"+cno+" isNextpage:"+isNextpage+" numProduct: "+numProduct);
		cosmeticService.shoppingCart_register(cno,isNextpage,numProduct,session,request,response);
		if(isNextpage==1) {
			// ???????????? ???????????? ??????
			return "redirect:/shoppingList/shoppingList";
		}else {
			// ?????? ????????????
			return "redirect:/";
		}
	}

	// ????????? - ????????? ????????? ?????? ?????????
	@RequestMapping("cosmetic_ok")
	public void cosmetic_ok(Integer cno,HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		if(cno==null) {
			out.print("<script>");
			out.print("alert('????????? ???????????????');");
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

	// ????????? - ????????? ?????? ?????????
	@RequestMapping("cosmetic")
	public void cosmetic(Principal principal, Integer cno,Model model, HttpSession session) throws IOException {
		cosmeticService.updateCosmeticHitsByCno(cno);
		CosmeticVo cosmetic = cosmeticService.selectOneCosmeticByCno(cno);  // ???????????????,, ????????? ?????? ????????????

		if(session.getAttribute("Cosmetic"+cno)!=null) {
			// ???????????? ?????? ?????????????????? ?????????
			log.info("????????????");
		}else {
			// ???????????? ????????? ????????? ?????????
			cosmeticService.updateHits(cno);  // ????????? ????????? ????????????
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

	// ????????? - ????????? ????????? ????????? ??????
	@RequestMapping("cosmetic_list")
	public void cosmetic_list(Model model,CosmeticCriteria c) {
		log.info("????????? ????????? ????????? ??????"+c);
		log.info("?????? ????????????"+c);

		List<CosmeticVo> cList = null;
		// type??? null??? ?????????, ????????? ???????????? ???????????? ??????.
		if(c.getType()!=null) {
			List<TypeVo> tList = typeService.selectListSubType(c.getType()); // ????????? ???????????? ?????? ?????? ????????????
			cList = cosmeticService.selectListCosmeticByCategory(c);  // ????????? ????????? ????????????
			log.info("??????:"+tList);

			model.addAttribute("tList", tList);
		}
		int total =  cosmeticService.selectCountByCategory(c);
		CosmeticPageDTO cosmeticPageDTO = new CosmeticPageDTO(c, total);
		// ???????????????
		List<BrandVo> bList = brandService.selectListAllBrand();

		log.info("????????? ?????? : "+cosmeticPageDTO);
		model.addAttribute("cosmeticPageDTO",cosmeticPageDTO);
		model.addAttribute("cList", cList);
		model.addAttribute("bList", bList);
		// ???????????? ??????
		model.addAttribute("CosmeticCriteria", c);
		model.addAttribute("type", c.getType());

	}

	// ????????? - ????????? ?????? ????????? ??????
	@RequestMapping("cosmetic_register")
	public void cosmetic_register(Model model) {
		List<TypeVo> tList = typeService.selectListType();
		List<BrandVo> bList = brandService.selectListAllBrand();
		log.info("???????????????????????????, List: "+tList+bList);
		model.addAttribute("tList", tList);
		model.addAttribute("bList", bList);
	}

	// ????????? - ?????? ?????? ????????????
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

	// ????????? - ????????? ?????? (?????????)
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

	// ????????? - ?????????????????? ?????? (?????????)
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
