package com.flowerPot.customerCenter.controller;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flowerPot.admin.dao.CReplyMapper;
import com.flowerPot.admin.vo.ReplyVo;
import com.flowerPot.customerCenter.service.CustomerCenterService;
import com.flowerPot.domain.Criteria;
import com.flowerPot.domain.CustomerEnum;
import com.flowerPot.domain.PageDTO;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.vo.CustomerCenterVo;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("customerCenter")
@Slf4j
public class CustomerCenterController {

	@Autowired
	private CustomerCenterService service;
	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private CReplyMapper ReplyDao;


	// 고객센터 페이지,,,  
	@RequestMapping("customerCenter")
	public void customerCenter(Criteria c, Model model) throws Exception {
		c.setAmount(10);
		CustomerEnum.categoryChangeToNum(c);
		
		log.info("카테고리:"+c);
		List<CustomerCenterVo> cList = service.SelectListByCategory(c);
		int total = service.selectCountByCategory(c);
		PageDTO page = new PageDTO(c, total);
		model.addAttribute("page", page);
		model.addAttribute("category", c.getCategory());
		model.addAttribute("cList", cList);
	}

	// 게시판 내용페이지
	@RequestMapping("content")
	public String EnqCont(int ccno, Model model) {
		System.out.println(ccno);
		CustomerCenterVo content = service.getContent(ccno);
		model.addAttribute("content", content);
		return "/customerCenter/content";
	}

	// 게시판 쓰기 페이지
	@RequestMapping("write")
	public String write(Principal principal, Model model) {
		MemberVo memberVo = new MemberVo();
		// 현재 로그인되어있는 아이디를 가져옴
 		if(principal!=null) {
			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();
			memberVo = memberSerivce.selectOneMemberById(id);   // 회원정보 가져오기
		}
 		model.addAttribute("memberVo",memberVo);
		return "customerCenter/write";
	}

	// 게시판 작성 처리
	@RequestMapping("write_ok")
	@ResponseBody
	public String write_ok(@RequestBody CustomerCenterVo customer) {
		this.service.wirteEnq(customer);
		return "success";
	}

	// 수정
	@RequestMapping("edit")
	public String edit(CustomerCenterVo customer, Model model) {
		ModelAndView mv = new ModelAndView("edit");
		CustomerCenterVo customerCenter = service.getContent(customer.getCcno());
		model.addAttribute("customerCenter", customerCenter);
		return "/customerCenter/edit";
	}
	
	// 수정처리
	@RequestMapping("edit_ok")
	@ResponseBody
	public String edit_ok(Model model, CustomerCenterVo customer) {
		log.info("customer1:" + customer);
		service.editEnq(customer);
		return "redirect:/customerCenter/content?ccno=" + customer.getCcno();
	}
	
	@RequestMapping("rcontent")
	public String rcontent(int rno, Model model) {
		ReplyVo reply = ReplyDao.getReplyCont(rno);
		model.addAttribute("reply", reply);
		return "customerCenter/rcontent";
	}

	@RequestMapping("noticeContent")
	public String noticeContent(int ccno, Model model) {
		System.out.println(ccno);
		CustomerCenterVo content = service.getNotice(ccno);
		model.addAttribute("notice", content);
		return "customerCenter/noticeContent";
	}

	@RequestMapping("FAQ")
	public void FAQ(Model model) {
		// 게시판 리스트 where category = 'FAQ'
		CustomerCenterVo c = new CustomerCenterVo();
		// model 를 이용해서 뷰페이지에 넘거야한다
		List<CustomerCenterVo> question = service.getFaq();

		model.addAttribute("fq_list", question);
	}

	@RequestMapping("enquiry")
	public void Enquiry(Model model) {
		// 게시판 리스트 where category = '1대1문의'
		List<CustomerCenterVo> list = service.getEnqList();
		model.addAttribute("EnqList", list);
		// model 를 이용해서 뷰페이지에 넘거야한다
	}

	// 이미지 업로드
	@ResponseBody
	@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
	public Map<String, String> upload(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		Map<String, String> file = new HashMap<String, String>();
		// map은 인터페이스라 생성자 생성 불가능함 ㅇㅅㅇ
		String fileRoot = "C:\\summernote_image\\"; // 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			file.put("url", request.getContextPath()+"summernoteImage/" + savedFileName);// savedFileName : 변경된 파일 이름
			System.out.println(targetFile.getName());
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제

			e.printStackTrace();
		}

		return file;
	}

	// 검색어로 찾기
	@RequestMapping("/search")
	public String keyword(Model model, @ModelAttribute CustomerCenterVo vo) {
		// System.out.println(vo.getKeyword());
		List<CustomerCenterVo> result = service.searchKeyword(vo.getKeyword());
		for (CustomerCenterVo c : result) {
			/*
			 * System.out.println("####################검색결과 : " + c.getCcno());
			 * System.out.println(c.getTitle() + ", " + c.getContent());
			 */
			System.out.println(c.getTitle());
		}
		String keyword = vo.getKeyword();
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchKeyword", result);
		return "customerCenter/searchResult";

	}

	/*
	 * 
	 * @RequestMapping("enquiry/write") public String write() { return
	 * "customerCenter/enquiry/write"; }
	 * 
	 * @RequestMapping("enquiry/write_ok") public String write_ok(@RequestBody
	 * CustomerCenterVo customer) { this.service.wirteEnq(customer); return
	 * "redirect:/customerCenter/enquiry"; }
	 * 
	 * 
	 */
	/*
	 * @RequestMapping("enquiry/edit") public String edit(CustomerCenterVo customer,
	 * Model model) { ModelAndView mv = new ModelAndView("edit"); CustomerCenterVo
	 * customerCenter = service.getContent(customer.getCcno());
	 * model.addAttribute("customerCenter", customerCenter); return
	 * "customerCenter/enquiry/edit"; }
	 * 
	 * @RequestMapping("enquiry/edit_ok") public String edit_ok(int ccno) {
	 * 
	 * // this.service.wirteEnq(customer); service.editEnq(ccno); return
	 * "redirect:/customerCenter/enquiry/content?ccno=" + ccno; }
	 */


	@RequestMapping("enquiry/delete")
	public String delete(CustomerCenterVo customer) {
		service.deleteEnq(customer);
		return "redirect:/customerCenter/enquiry";

	}

	@RequestMapping("resultContent")
	public String resCont(int ccno, Model model) {
		//	System.out.println(ccno);
		CustomerCenterVo content = service.getResCont(ccno);
		model.addAttribute("content", content);
		return "customerCenter/searchResultContent";
	}

}
