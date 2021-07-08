package com.flowerPot.domain;

import java.util.List;

import org.mortbay.log.Log;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.flowerPot.member.service.MemberService;
import com.flowerPot.point.service.PointService;
import com.flowerPot.vo.MemberVo;
import com.flowerPot.vo.PointVo;

public class CloudJobExecutor extends QuartzJobBean {

	private PointService pointService;
	private MemberService memberService;
	
	public void setPointService(PointService pointService) {
		this.pointService = pointService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		// 실제 수행할 로직..
		System.out.println(arg0.toString());
		
		
		System.out.println(pointService);
		System.out.println(memberService);
		// 회원등급 수정 (일정포인트가 넘었을시 등급수정)
		List<Integer> mnoList = memberService.selectAllMemberMno();
		for(Integer mno : mnoList) {
			List<PointVo> pList = pointService.selectListPointByMno(mno);
			int sum = 0;
			// 지금까지 포인트 사용 내역을 더함
			for(PointVo p : pList) {
				sum = sum + p.getAdd_point();
			}
			
			if(PointEnum.ChangeRank(sum)!=null) {
				MemberVo m = new MemberVo();
				m.setMember_rank(PointEnum.ChangeRank(sum));
				m.setMno(mno);
				memberService.updateRankByMno(m);
				Log.info("회원등급상승!!");
			}
		}
		
		// 쿠폰삭제
	}

}