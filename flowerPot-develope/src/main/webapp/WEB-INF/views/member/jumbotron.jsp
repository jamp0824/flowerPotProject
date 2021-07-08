<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="jumbotron" style="background-color: #fff; border: 1px solid #bbb; margin: 0;">
	<div class="row text-center">
		<div class="col-6">
			<h3 class="py-2 text-center">회원 등급</h3>
			<p class="lead py-1 mb-2 text-center">
				<span>${member.name}</span> 님의 등급은 <span>${member.member_rank}</span> 입니다
			</p>
		
			<a class="btn btn-outline-success" href="#" role="button">등급별 혜택 보러가기</a>
		</div>
		
		<div class="col-6">
			<h3 class="py-2 text-center">포인트</h3>
			<p class="lead text-center">
				<span>${member.name}</span> 님의 사용가능한 포인트는 <br /><span>${member.point} point</span>입니다
			</p>
		</div>
	</div>
</div>