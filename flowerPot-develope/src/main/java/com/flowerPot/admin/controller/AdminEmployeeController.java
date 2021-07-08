package com.flowerPot.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flowerPot.admin.commons.PageCreator;
import com.flowerPot.admin.commons.SearchVO;
import com.flowerPot.admin.service.EmpService;
import com.flowerPot.admin.vo.EmpVo;
import com.flowerPot.dao.AuthorityDao;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.vo.AuthorityVo;
import com.flowerPot.vo.MemberAddressVo;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminEmployeeController {
	
	//직원등록
	@Autowired
	private EmpService service;
	
	@Autowired
	private AuthorityDao authDao;
	
	/*
	 * //회원가입
	 * 
	 * @Autowired private MemberSerivce memberService;
	 */
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//직원 관리(목록) 
	@RequestMapping("/employee")
	public void employee(Model model, SearchVO search) {
		PageCreator pc = new PageCreator();
		pc.setPaging(search);		
		List<EmpVo>	eList = service.selectEmpList(search);
		for(EmpVo empId :eList) {
			String id = empId.getEmpId();
			System.out.println(id);
			List<AuthorityVo> alist = authDao.selectAuthList(id);
			empId.setAuthList(alist);
			
		}
		
		pc.setArticleTotalCount(service.countArticles(search));
		model.addAttribute("eList",eList);
		model.addAttribute("pc",pc);
	}
	
	//직원 추가
	@RequestMapping("/empAdd")
	public String empAdd(EmpVo emp) {
		service.insertEmpOne(emp);
		return "redirect:/admin/employee";
	}
	
	//직원 삭제
	@RequestMapping("/empDel")
	public String empDel(EmpVo emp) {
		System.out.println(emp.getEmpNo());
		service.deleteEmpOne(emp);
		System.out.println(emp.getEmpEnabled());
		return "redirect:/admin/employee";
	}
	
	//직원 복구
	@RequestMapping("/empRestore")
	public String empRestore(EmpVo emp) {
		System.out.println(emp);
		service.restoreEmpOne(emp);
		return "redirect:/admin/employee";
	}
	
	//회원가입
	
	// 회원가입 페이지로 이동
		@RequestMapping("/employee/signUp")
		public String signUp(Integer empNo, String empName, Model m) {
			System.out.println(empNo);
			System.out.println(empName);
			m.addAttribute("empNo",empNo);
			m.addAttribute("empName",empName);
			return "/admin/signUp";
		}
		
	// 회원가입 처리
	@RequestMapping("/employee/signUp_ok")
	public String signUp_ok(MemberVo member, MemberAddressVo memberAddress, EmpVo emp) {
		System.out.println("member"+member);
		System.out.println("emp"+emp);
		member.setPassword(passwordEncoder.encode(member.getPassword()));// 비밀번호 인코딩
		System.out.println("member"+member);
		emp.setEmpId(member.getId());//회원가입폼으로부터 받은 가입할 아이디를 emp에도 함께 저장후 작업처리
		service.insertMember(member,memberAddress, emp);
		return "redirect:/admin/employee";
	}
	
	//회원 아이디가 있는 사람에게 관리자 권한 부여
	@RequestMapping("/adminAuth")
	public String adminAuth(String empId) {

		service.updateAuthorityById(empId);
		return "redirect:/admin/employee";
	}
	

}
