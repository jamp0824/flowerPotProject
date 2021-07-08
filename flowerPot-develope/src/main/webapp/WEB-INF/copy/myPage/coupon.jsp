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
	<div class="page_section section_coupon">
		<div class="head_aticle">
			<h2 class="tit">쿠폰</h2>
		</div>
		<div class="coupon_reg">
			<form method="post" action="/shop/mypage/indb.paper.php?&" onsubmit="return chkForm(this)">
				<fieldset>
					<legend>쿠폰 등록 폼</legend>
					<div class="reg">
						<input type="hidden" name="sno" value=""> <input type="text" name="coupon_number" label="쿠폰번호" class="inp" required="required" value="" placeholder="쿠폰을 입력해주세요">
						<button type="submit" class="btn">쿠폰 등록</button>
					</div>
					<p class="notice">쿠폰에 하이픈("-")이 포함되어 있을경우 하이픈("-")을 반드시 입력해주세요.</p>
				</fieldset>
			</form>
		</div>
		<div class="coupon_count">
			<span class="ico"></span>
			<p class="txt">쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</p>
			<p class="count">
				<span class="tit">사용가능쿠폰</span> : 1장
			</p>
		</div>
		<table class="tbl tbl_type1">
			<caption>적립 사용 내역 상세보기</caption>
			<colgroup>
				<col style="width: auto;">
				<col style="width: 58px;">
				<col style="width: 101px;">
				<col style="width: 139px;">
				<col style="width: 101px;">
			</colgroup>
			<thead>
				<tr>
					<th class="name">쿠폰명</th>
					<th>기능</th>
					<th>할인/적립</th>
					<th>사용가능기간</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<tr class="operational">
					<td class="name">1만원 쿠폰(2만원 이상 주문, 만료일 24시까지) <span class="txt_sub">2만원 이상 주문 시 1만원 할인</span>
					</td>
					<td>할인</td>
					<td>10,000원</td>
					<td>20-07-08 ~ 20-07-10</td>
					<td class="use">미사용</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>
