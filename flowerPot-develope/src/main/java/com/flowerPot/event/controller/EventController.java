package com.flowerPot.event.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flowerPot.attachFile.service.AttachFileService;
import com.flowerPot.attendance.repository.AttendanceDao;
import com.flowerPot.domain.Criteria;
import com.flowerPot.event.service.EventService;
import com.flowerPot.member.service.MemberService;
import com.flowerPot.vo.AttachFileVo;
import com.flowerPot.vo.AttendanceVo;
import com.flowerPot.vo.EventVo;
import com.flowerPot.vo.MemberVo;

@Controller
@RequestMapping("event")
public class EventController {

	@Autowired private EventService eventService;
	@Autowired private AttachFileService AttachFileService;
	@Autowired private MemberService memberService;
	@Autowired private AttendanceDao attendanceDao;
	
	// 회원 정보 시큐리티에서 가져오기
		public MemberVo getMemberBysecurity(Principal principal) {
			MemberVo memberVo = new MemberVo();
			if(principal!=null) {
				String id = principal.getName();
				memberVo = memberService.selectOneMemberById(id);   // 회원정보 가져오기
			}
			return memberVo;
		}
	
	@RequestMapping("event")
	public void event(Criteria c, Model model) {
		List<EventVo> eList = eventService.selectListEvent(c);
		Log.info("eList:"+eList);
		model.addAttribute("eList", eList);
	}
	
	@RequestMapping("event_write")
	public void event_write() {
		// 회원정보를 불러와야함
	}
	
	// 이벤트 등록, 아작스
	@RequestMapping("event_write_ok")
	@ResponseBody
	public ResponseEntity<String> event_write_ok(EventVo event) {
		Log.info("event:"+event);
		
		ResponseEntity<String> r =null;
		try {
			eventService.insertEvent(event);
			r = new ResponseEntity<String>(Integer.toString(event.getEno()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			r = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return r;
	}
	
	@RequestMapping("eventAttachInsert")
	@ResponseBody
	public ResponseEntity<String> eventAttachInsert(@RequestBody List<AttachFileVo> alist) {
		Log.info("alist:"+alist);
		
		ResponseEntity<String> r =null;
		try {
			AttachFileService.insertAttachListToEvent(alist);
			r = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			r = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return r;
	}
	
	@RequestMapping("event_cont")
	public void event_cont(Integer eno, Model model) {
		EventVo event = eventService.selectOneEventByEno(eno);
		model.addAttribute("event", event);
	}
	
	@RequestMapping("event_delete")
	public String event_delete(Integer eno, Model model) {
		eventService.deleteOneEventByEno(eno);
		return "redirect:/event/event";
	}
	
	@RequestMapping("dayCheck")
	public void dayCheck(String today, Model model) {
		Log.info("오늘:"+today);
		model.addAttribute("today",today);
	}
	
	@RequestMapping("dayCheck_ok")
	public String dayCheck_ok(Principal principal, HttpServletRequest request, Model model, RedirectAttributes rttr) {
		MemberVo member = getMemberBysecurity(principal);
		List<AttendanceVo> atList = attendanceDao.selectListByMno(member.getMno());
		boolean flag = true;
		for(AttendanceVo attendance : atList) {
			LocalDate date = attendance.getAttendance_date().toLocalDate();
			LocalDate now = LocalDate.now();
			if(date.isEqual(now)) {
				flag = false;
			}
		}
		
		if(flag) {
			memberService.addPoint(member.getMno());  // 포인트 증가
			Log.info("성공");
			rttr.addAttribute("today", "True");
		}else {
			Log.info("실패");
			rttr.addAttribute("today", "False");
		}
		
		
		return "redirect:/event/dayCheck";
	}
	
}
