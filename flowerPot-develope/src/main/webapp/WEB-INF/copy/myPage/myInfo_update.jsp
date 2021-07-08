<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<jsp:include page="myPageTop.jsp"></jsp:include>

<div class="page_aticle aticle_type2">
	<div id="snb" class="snb_my">
		<h2 class="tit_snb">마이페이지</h2>
		<div class="inner_snb">
			<ul class="list_menu">
				<li><a href="/shop/mypage/mypage_orderlist.php">주문 내역</a></li>
				<li><a href="/shop/mypage/mypage_wishlist.php">늘 사는 것</a></li>
				<li><a href="/shop/mypage/mypage_review.php">상품후기</a></li>
				<li><a href="/shop/mypage/mypage_emoney.php">적립금</a></li>
				<li><a href="/shop/mypage/mypage_coupon.php">쿠폰</a></li>
				<li class="on"><a href="/shop/member/myinfo.php">개인 정보 수정</a></li>
			</ul>
		</div>
		<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
	</div>
	<div class="page_section section_myinfo">
		<div class="head_aticle">
			<h2 class="tit">개인 정보 수정</h2>
		</div>
		<div class="type_form member_join member_pw">
			<div class="field_pw">
				<h3 class="tit">비밀번호 재확인</h3>
				<p class="sub">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
				<form name="confirmForm" method="post" action="#">
					<table class="tbl_comm">
						<tr class="fst">
							<th>아이디</th>
							<td><input type="text" value="" readonly class="inp_read"></td>
						</tr>
						<tr>
							<th>비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span>
							</th>
							<td><input type="hidden" name="mode" id="mode" value="confirmPassword"> 
							<input type="password" name="confirm_password" id="confirm_password" class="inp_pw"></td>
						</tr>
					</table>
					<button type="submit" class="btn active">확인</button>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>