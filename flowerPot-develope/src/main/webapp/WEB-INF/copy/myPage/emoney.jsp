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
	<div class="page_section section_point">
		<div class="head_aticle">
			<h2 class="tit">
				적립금 <span class="tit_sub">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span>
			</h2>
		</div>
		<div id="viewPointList">
			<point-header :emoney-total="emoneyTotal" :expire-date="expireDate" :expire-point="expirePoint" :type="type" :no-data="noData"></point-header>
			<table class="tbl tbl_type1">
				<caption style="display: none">적립 사용 내역 상세보기</caption>
				<colgroup>
					<col style="width: 120px;">
					<col style="width: auto">
					<col style="width: 122px;">
					<col style="width: 140px;">
				</colgroup>
				<thead>
					<tr>
						<th>날짜</th>
						<th class="info">내용</th>
						<th>유효기간</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="itemview in postsArray" is="point-itemlist-pc" :ref="itemview.no" :itemview="itemview" :key="itemview.no" v-if="!noData"></tr>
					<tr v-if="noData">
						<td colspan="4" class="no_data">적립금 내역이 존재하지 않습니다.</td>
					</tr>
				</tbody>
			</table>
			<div class="layout-pagination" v-if="!noData">
				<div class="pagediv">
					<a @click="onMoveList(1)" href="#viewOrderList" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a> <a @click="onMoveList(pageCount-1)" href="#viewOrderList" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
					<order-itemlist-paging v-for="(paging, idx) in pagingCountArray" :idx="idx+1" :key="idx" :page-count="pageCount" :total-page-count="totalPageCount" @on-move-list="onMoveList"></order-itemlist-paging>
					<a @click="onMoveList(pageCount+1)" href="#viewOrderList" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a> <a @click="onMoveList(endPaging)" href="#viewOrderList" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>