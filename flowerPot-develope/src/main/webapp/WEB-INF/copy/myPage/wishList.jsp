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
	<div class="page_section section_wishlist">
		<div class="head_aticle">
			<h2 class="tit">
				늘 사는 것 <span class="tit_sub">늘 사는 것으로 등록하신 상품 목록 입니다</span>
			</h2>
		</div>
		<form name=frmWish method=post>
			<input type=hidden name=mode>
			<table class="tbl tbl_type1">
				<colgroup>
					<col style="width: 27px;">
					<col style="width: 150px;">
					<col style="width: auto;">
					<col style="width: 165px;">
				</colgroup>
				<thead>
					<tr>
						<th><label class="label_check disabled"> <input type="checkbox" class="ico_check" name="all_checked" disabled="disabled">
						</label></th>
						<th><span class="screen_out">상품이미지</span></th>
						<th>상품정보</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="no_data" colspan="4">늘 사는 상품 내역이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<div class="group_btn">
				<div class="inner_groupbtn">
					<button type="button" onclick="act_all('delItem')" class="btn btn_negative">늘 사는 것 비우기</button>
					<span class="space"></span>
					<button type="button" onclick="act_all('cart')" class="btn btn_positive">전체 주문하기</button>
				</div>
			</div>
		</form>
		<div class="layout-pagination">
			<div class="pagediv"></div>
		</div>
	</div>
	<div id="viewOrderList" class="page_section section_orderlist" v-cloak>
		<div class="head_aticle">
			<h2 class="tit">
				주문 내역 <span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span>
			</h2>
		</div>
		<div class="search_date">
			<h3 class="screen_out">기간 선택</h3>
			<a href="#none" v-html="checkYear" class="btn_layer"></a>
			<ul class="layer_search">
				<li><a href="#none" @click="searchResult" class="on">전체기간</a></li>
				<li><a href="#none" @click="searchResult" data-year="2020">2020 년</a></li>
				<li><a href="#none" @click="searchResult" data-year="2019">2019 년</a></li>
				<li><a href="#none" @click="searchResult" data-year="2018">2018 년</a></li>
			</ul>
		</div>
		<ul class="list_order">
			<order-itemlist-pc v-for="itemview in postsArray" :ref="itemview.no" :itemview="itemview" :key="itemview.no" :search-date-hash="searchDateHash" v-if="!noData"></order-itemlist-pc>
			<li v-if="noData" class="no_data">주문내역이 없습니다.</li>
		</ul>
		<div class="layout-pagination" v-if="!noData">
			<div class="pagediv">
				<a @click="onMoveList(1)" href="#viewOrderList" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a> <a @click="onMoveList(pageCount-1)" href="#viewOrderList" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
				<order-itemlist-paging v-for="(paging, idx) in pagingCountArray" :idx="idx+1" :key="idx" :page-count="pageCount" :total-page-count="totalPageCount" @on-move-list="onMoveList"></order-itemlist-paging>
				<a @click="onMoveList(pageCount+1)" href="#viewOrderList" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a> <a @click="onMoveList(endPaging)" href="#viewOrderList" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>