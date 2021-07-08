<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<jsp:include page="myPageTop.jsp"></jsp:include>

<div class="page_aticle aticle_type2">
	<div id="snb" class="snb_my">
		<h2 class="tit_snb">마이컬리</h2>
		<div class="inner_snb">
			<ul class="list_menu">
				<li class="on"><a href="${pageContext.request.contextPath }/myPage/orderList">주문 내역</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/wishList">늘 사는 것</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/review">상품후기</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/emoney">적립금</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/coupon">쿠폰</a></li>
				<li><a href="${pageContext.request.contextPath }/myPage/myInfo_update">개인 정보 수정</a></li>
			</ul>
		</div>
		<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
	</div>
	<div class="page_section section_review">
		<div class="head_aticle">
			<h2 class="tit">상품후기</h2>
		</div>
		<div id="reviewView" v-cloak>
			<div class="review_notice" v-html="msgNotice"></div>
			<ul class="tab_menu">
				<li class="on"><a href="#viewBeforeList">작성가능 후기 <span v-text="beforeCount"></span></a></li>
				<li><a href="#viewAfterList">작성완료 후기 <span v-text="afterCount"></span></a></li>
			</ul>
		</div>

		<div id="viewBeforeList" class="before_view" v-cloak>
			<ul class="list_before">
				<template v-for="(itemview, idx) in products" v-if="!noData && showPage"> <before-list v-if="!itemview.is_package" :ref="itemview.no" :parent-item="itemview" :itemview="itemview" :key="itemview.no+idx" :package-check="false"></before-list> <before-list v-for="item in itemview.products" v-if="itemview.is_package" :ref="itemview.no" :parent-item="itemview" :itemview="item" :key="item.no+idx" :package-check="true"></before-list> </template>
				<li class="no_data" v-if="noData && showPage">작성가능 후기 내역이 없습니다.</li>
			</ul>
		</div>


		<div id="viewAfterList" class="after_view" v-cloak>
			<ul class="list_after">
				<after-list v-for="(itemview, idx) in reviews" :idx="idx" :ref="itemview.no" :itemview="itemview" :key="itemview.no+idx" v-if="!noData && showPage" @review-delete="reviewDelete"></after-list>
				<li class="no_data" v-if="noData && showPage">작성한 후기가 없습니다.</li>
			</ul>
		</div>





	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>