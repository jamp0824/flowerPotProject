package com.flowerPot.member.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flowerPot.admin.vo.CoupVo;
import com.flowerPot.cosmeticReview.service.CosmeticReviewService;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.memberAddress.service.MemberAddressService;
import com.flowerPot.order.service.OrderService;
import com.flowerPot.orderProduct.service.OrderProductService;
import com.flowerPot.service.AuthorityService;
import com.flowerPot.vo.CosmeticReviewVo;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;
import com.flowerPot.vo.OrderProductVo;
import com.flowerPot.vo.OrderVo;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@Autowired
	private CosmeticReviewService cosmeticReviewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberAddressService memberAddressService;
	@Autowired
	private OrderProductService orderProductService;
	@Autowired
	private OrderService orderService;
	@Inject // 서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함

	@Autowired
	private AuthorityService authorityService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	/*
	 * @RequestMapping(value="/kakaologin", produces = "application/json", method=
	 * {RequestMethod.GET, RequestMethod.POST}) public String
	 * kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
	 * HttpServletResponse httpServlet) { //로그인 후 code get
	 * System.out.println("code :"+code); }
	 */
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult1 = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 회원 정보 시큐리티에서 가져오기
	public MemberVo getMemberBysecurity(Principal principal) {
		MemberVo memberVo = new MemberVo();
		if(principal!=null) {
			String id = principal.getName();
			memberVo = memberService.selectOneMemberById(id);   // 회원정보 가져오기
		}
		return memberVo;
	}

	// 마이 페이지로 이동
	@RequestMapping("/myPage")
	public String MyPage(Principal principal, Model model) {

		MemberVo memberVo = new MemberVo();
		MemberAddressVo memberAddress  = new MemberAddressVo();
		List<OrderProductVo> oList = new ArrayList<OrderProductVo>();
		if(principal!=null) {
			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();
			memberVo = memberService.selectOneMemberById(id);   // 회원정보 가져오기

			oList = orderProductService.selectListOrderProductByMno(memberVo.getMno());
			log.info("주문리스트 : "+oList);
		}

		model.addAttribute("oList", oList);
		return "/member/myPage";
	}

	// 쿠폰 페이지로 이동
	@RequestMapping("/coupon")
	public String coupon(Principal principal, Model model) {
		System.out.println("쿠폰 페이지 호출됨");
		MemberVo member = getMemberBysecurity(principal);
		
		//주문정보 가져오기
		List<OrderVo> oList = new ArrayList<OrderVo>();
		if(member != null) {
			oList = orderService.selectListOrderByMno(member.getMno());
		}
		
		//쿠폰 리스트 가져오기
		List<CoupVo> coupList =  memberService.getCoupList(member);
		
		model.addAttribute("member", member);
		model.addAttribute("coupList", coupList);
		model.addAttribute("oList", oList);
		return "member/coupon";
	}

	// 포인트 페이지로 이동
	@RequestMapping("/point")
	public String point(Principal principal, Model model) {
		System.out.println("나의 포인트 페이지 호출됨");
		MemberVo member = getMemberBysecurity(principal);
		
		// 주문 정보 가져오기
		List<OrderVo> oList = new ArrayList<OrderVo>();
		if(member != null) {
			oList = orderService.selectListOrderByMno(member.getMno());
		}
		
		model.addAttribute("member", member);
		model.addAttribute("oList", oList);
		return "/member/point";
	}
	
	// 주문관리 페이지로 이동
	@RequestMapping("/order")
	public String order(Principal principal, Model model) {
		System.out.println("나의 주문페이지 호출됨");

		MemberVo memberVo = new MemberVo();
		MemberAddressVo memberAddress  = new MemberAddressVo();
		List<OrderVo> oList = new ArrayList<OrderVo>();
		if(principal!=null) {
			log.info("아이디:"+principal.getName());  // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();
			memberVo = memberService.selectOneMemberById(id);   // 회원정보 가져오기

			oList = orderService.selectListOrderByMno(memberVo.getMno());
			log.info("주문리스트 : "+oList);
		}

		model.addAttribute("member", memberVo);
		model.addAttribute("oList", oList);
		return "/member/order";
	}

	//나의 활동으로 이동 
	@RequestMapping("/myActivity") 
	public String myActivity() {
		System.out.println("나의 활동으로 호출됨");
		return "/member/myActivity";
	}

	//나의 리뷰로 이동
	@RequestMapping("/review") 
	public String costmeticReviewList(Principal principal, Model model) {
		
		MemberVo member = getMemberBysecurity(principal);
		
		List<CosmeticReviewVo> cmrList =cosmeticReviewService.selectListCosmeticReviewListByMno(member);
		model.addAttribute("cmrList",cmrList);
		System.out.println("나의 활동으로 호출됨");
		return "/member/review";
	}



	//나의 비밀번호 변경으로 이동
	@RequestMapping("/password") 
	public String password(Principal principal, Model model) {
		System.out.println("나의 비밀번호변경으로 호출됨");
		MemberVo member =getMemberBysecurity(principal);
		model.addAttribute("member", member);
		return "/member/password";
	}
	

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/login/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		apiResult1 = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(apiResult1);
		model.addAttribute("result", apiResult1);

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "/";
	}

	// 나의 회원정보 이동
	@RequestMapping("/myInfo")
	public String myInfo(Principal principal, Model model) {
		MemberVo memberVo = new MemberVo();
		MemberAddressVo memberAddress = new MemberAddressVo();
		System.out.println("나의 회원정보 호출됨");
		if (principal != null) {
			log.info("아이디:" + principal.getName()); // 일단 이걸로 member 정보를 가져오자..
			String id = principal.getName();
			memberVo = memberService.selectOneMemberById(id); // 회원정보 가져오기
			memberAddress = memberAddressService.selectOneMemberAddressByMno(memberVo.getMno()); // 회원주소록 가져오기
			model.addAttribute("pid", memberVo);
			model.addAttribute("paddr", memberAddress);
		}
		return "/member/myInfo";
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("naverLogin", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "member/login";
	}

	// 회원가입 처리
	@RequestMapping("/signUp_ok")
	public String signUp_ok(MemberVo member, MemberAddressVo memberAddress) {
		// 비밀번호 인코딩
		log.info("회원정보 : " + member.toString());
		member.setMember_rank("씨앗");
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		log.info("회원정보 : " + member.toString());
		memberService.insertMember(member, memberAddress);

		return "redirect:/";
	}

	// 회원 정보 수정 처리
	@RequestMapping("/update_do")
	public String memberUpdate(MemberVo vo, MemberAddressVo memberAddress) throws Exception {
		log.info("회원정보:" + vo.toString());
		log.info("회원정보:" + memberAddress.getMno());
		memberService.updateMember(vo, memberAddress);
		return "redirect:/member/myInfo";
	}
	// 회원가입 페이지로 이동

	
	// 나의 비밀번호 변경
	@RequestMapping("/password_ok")
	public void passwordUpdate(@ModelAttribute MemberVo vo, Principal principal, Model model,
			HttpServletResponse response,HttpServletRequest request) throws Exception {
		// 입력한 비밀번호 db와 같은지 체크
		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (principal.getName() != null) {
			log.info("아이디:" + principal.getName());
			String id = principal.getName();
			vo.setId(id);
			MemberVo dbData = memberService.selectOneMemberById(id);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			if (encoder.matches(vo.getPassword(), dbData.getPassword())) {
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			} else {
				vo.setPassword(passwordEncoder.encode(vo.getPassword()));
				memberService.passwordUpdate(vo);
				out.println("<script>");
				out.println("alert('비밀번호를 변경하였습니다..');");
				out.println("location.href='"+request.getContextPath()+"'/member/order");
				out.println("</script>");
				out.close();
			} // else

		}
	}// passwordUpdate

	// 로깅을 위한 ㅏ변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String String = null;
	private String apiResult = null;

	// MailSending 모드
	@RequestMapping(value = "membership/email_send")
	@ResponseBody
	public ResponseEntity<String> mailSending(HttpServletRequest request, String email,
			HttpServletResponse response_email) throws IOException {
		ResponseEntity<String> res = null;

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "flowerpot0824@gmail.com";
		String tomail = request.getParameter("email");
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content = System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

				System.getProperty("line.separator") +

				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

				+ System.getProperty("line.separator") +

				System.getProperty("line.separator") +

				" 인증번호는 " + dice + " 입니다. "

				+ System.getProperty("line.separator") +

				System.getProperty("line.separator") +

				"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고 보낼 값을 지정한다.
		mv.setViewName("/member/email_injeung"); // 뷰의이름
		mv.addObject("dice", dice);

		System.out.println("mv : " + mv);

		res = new ResponseEntity<String>(Integer.toString(dice), HttpStatus.OK);
		return res;
	}

	// 이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/membership/email.do")
	public String email() {
		return "member/email";
	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드

	@RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung(String email_injeung, @PathVariable String dice,
			HttpServletResponse response_equals) throws IOException {

		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/member/join.do");

		mv.addObject("e_mail", email_injeung);

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("member/join");

			mv.addObject("e_mail", email_injeung);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("member/email_injeung");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;

	}

	@RequestMapping("/login")
	public void login() {

	}

	// 회원가입 페이지로 이동
	@RequestMapping("/signUp")
	public void signUp() {

	}

	// 아이디 중복인 요청 처리
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestBody String member) {
		System.out.println("/controller/member/checkId: POST요청 발생!");
		System.out.println("parameter:" + member);
		String result = null;
		Integer checkNum = memberService.checkId(member);
		
		
		System.out.println(checkNum);
		if (checkNum == 1) {
			System.out.println("아이디가 중복됨!");
			result = "NO";

		} else {
			System.out.println("아이디 사용가능!");
			result = "OK";
		}
		
		System.out.println("결과:"+result);
		return result;
	}		


	// 이메일 중복인 요청 처리
	@PostMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestBody String member) {
		System.out.println("/controller/member/checkEmail: POST요청 발생!");
		System.out.println("parameter:" + member);
		String result = null;
		Integer checkNum = memberService.checkEmail(member);
		System.out.println(checkNum);
		if (checkNum == 1) {
			System.out.println("이메일이 중복됨!");
			result = "NO";

		} else {
			System.out.println("이메일 인증메시지 전송 성공!");
			result = "OK";
		}
		return result;
	}

	// 전화번호 중복인 요청 처리
	@PostMapping("/checkPhone")
	@ResponseBody
	public String checkPhone(@RequestBody String member) {
		System.out.println("/controller/member/checkPhone: POST요청 발생!");
		System.out.println("parameter:" + member);
		String result = null;
		Integer checkNum = memberService.checkPhone(member);
		System.out.println(checkNum);
		if (checkNum == 1) {
			System.out.println("전화번호가 중복됨!");
			result = "NO";

		} else {
			System.out.println("전화번호 사용가능!");
			result = "OK";
		}
		return result;
	}


	//회원정보 상세정보 조회

	/*
	 * @RequestMapping("/view_do") public String memberView(String id, Model model)
	 * { //회원 정보를 model에 저장 model.addAttribute("dto",memberService.viewMember(id));
	 * System.out.println("아이디 확인"); logger.info("클릭한 아이디:"+id); //myInfo.jsp로 포워드
	 * return "member/myInfo"; }
	 */
	/*
	 * @PostMapping("/") public String register(@RequestBody MemberVo member) {
	 * System.out.println("/user/ POST 요청 발생!"); System.out.println("param: " +
	 * member);
	 * 
	 * memberService.register(member); return "joinSuccess"; }
	 * 
	 * // 아이디 중보곽인 요청 처리
	 * 
	 * @PostMapping("/checkId") public String checkId(@RequestBody String member) {
	 * System.out.println("/mvc/user/checkId: POST요청 발생!");
	 * System.out.println("parameter:" + member); String result = null; Integer
	 * checkNum = memberService.checkId(member); if (checkNum == 1) {
	 * System.out.println("아이디가 중복됨!"); result = "NO";
	 * 
	 * } else { System.out.println("아이디 사용가능!"); result = "OK"; } return result; }
	 * 
	 * // 로그인 요청 처리
	 * 
	 * @PostMapping("/loginCheck") public String loginCheck(@RequestBody MemberVo
	 * inputData) { String result = null;
	 * 
	 * 
	 * // 클라이언트 전송한 id값과 pw값을 가지고 DB에서 회원의 정보를 조회해서 불러온다음 값 비교를 통해 1. 아이디가 없을 경우
	 * //클라이언트측으로 문자열 "idFail"전송 2. 비밀번호가 틀렸을 경우 문자열 "pwFail"전송 3. 로그인 성공시 문자열
	 * //"loginSuccess" 전송
	 * 
	 * System.out.println("/user/loginCheck 요청!:POST");
	 * System.out.println("Parameter:" + inputData);
	 * 
	 * MemberVo dbData = memberService.selectOne(inputData.getId());
	 * 
	 * if (dbData != null) { if
	 * (inputData.getPassword().equals(dbData.getPassword())) { result =
	 * "loginSuccess";
	 * 
	 * } else { result = "pwFail"; } } else { result = "idFail"; } return result; }
	 * 
	 * // 회원탈퇴 요청 처리 // @RequestMapping(value="/", method=RequestMethod.DELETE)
	 * 
	 * @DeleteMapping("/{account}") public String delete(@PathVariable String
	 * account) { System.out.println("/user/" + account + ": DELETE 요청 발생!");
	 * 
	 * memberService.delete(account); return "delSuccess"; }
	 * 
	 * // 회원정보 조회 요청 처리
	 * 
	 * @GetMapping("/{account}") public MemberVo selectOne(@PathVariable String
	 * account) { System.out.println("/user/" + account + ": GET 요청 발생!");
	 * 
	 * return memberService.selectOne(account); }
	 * 
	 * // 회원정보 전체조회 요청 처리
	 * 
	 * @GetMapping("/") public List<MemberVo> selectOne() {
	 * System.out.println("/user/ : GET 요청 발생!");
	 * 
	 * return memberService.selectAll();
	 */

	@PostMapping("searchMemberById")
	@ResponseBody
	public ResponseEntity<String> searchMemberById(String id) {
		ResponseEntity<String> r = null;
		MemberVo member = new MemberVo();
		member = memberService.selectOneMemberById(id);
		if (member != null) {
			r = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			r = new ResponseEntity<String>("noID", HttpStatus.OK);
		}

		return r;
	}

	@PostMapping("insertAuthority")
	@ResponseBody
	public ResponseEntity<String> insertAuthority(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> r = null;
		String authority = (String) map.get("authority");
		String brand = (String) map.get("brand");
		List<String> id_list = (List<String>) map.get("id_list");
		try {
			authorityService.insertAuthorityById(authority, brand, id_list);
			r = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			r = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return r;
	}

}
