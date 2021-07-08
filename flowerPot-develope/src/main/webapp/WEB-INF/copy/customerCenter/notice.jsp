<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div class="page_aticle aticle_type2">
	
	<jsp:include page="notice_nav.jsp"></jsp:include>
	
	<div class="page_section">
		<div class="head_aticle">
			<h2 class="tit">
				공지사항 <span class="tit_sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
			</h2>
		</div>
		<form name=frmList action="/shop/board/list.php?&" onsubmit="return chkFormList(this)">
			<input type=hidden name=id value="notice">
			<table width=100% align=center cellpadding=0 cellspacing=0>
				<tr>
					<td>
						<div class="xans-element- xans-myshop xans-myshop-couponserial ">
							<table width=100% class="xans-board-listheader jh" cellpadding=0 cellspacing=0>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회</th>
								</tr>
								<tr>
									<td width=50 nowrap align=center>공지</td>
									<td style="padding-left: 10px; text-align: left; color: #999"><a href="view.php?id=notice&no=715"><b>[가격인상공지] [굴다리식품] 새우젓 150g 외 4종 (2020 7. 14 ~)</a></td>
									<td width=100 nowrap align=center>MarketKurly</td>
									<td width=100 nowrap align=center class=eng2>2020-07-10</td>
									<td width=30 nowrap align=center class=eng2>9</td>
								</tr>
								<tr>
									<td width=50 nowrap align=center>공지</td>
									<td style="padding-left: 10px; text-align: left; color: #999"><a href="view.php?id=notice&no=714"><b>[마켓컬리] 유튜브 ‘컬리라이프-일할 때도 쉴 때도 먹어야 한다, 극한직업 컬리 MD편’ 댓글 이벤트 당첨 공지</a></td>
									<td width=100 nowrap align=center>MarketKurly</td>
									<td width=100 nowrap align=center class=eng2>2020-07-04</td>
									<td width=30 nowrap align=center class=eng2>358</td>
								</tr>
								<tr>
									<td width=50 nowrap align=center>공지</td>
									<td style="padding-left: 10px; text-align: left; color: #999"><a href="view.php?id=notice&no=713"><b>[가격인상공지] [베베숲] 프리미어 70매 캡 1팩 외 3건 (2020 7. 3 ~)</a></td>
									<td width=100 nowrap align=center>MarketKurly</td>
									<td width=100 nowrap align=center class=eng2>2020-07-01</td>
									<td width=30 nowrap align=center class=eng2>379</td>
								</tr>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>

			<div class="layout-pagination">
				<div class="pagediv">
					<a href="list.php?id=notice&page=1" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a><a href="list.php?id=notice&page=1" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a><strong class="layout-pagination-button layout-pagination-number __active">1</strong><a href="list.php?id=notice&page=2" class="layout-pagination-button layout-pagination-number">2</a><a href="list.php?id=notice&page=3" class="layout-pagination-button layout-pagination-number">3</a><a href="list.php?id=notice&page=4" class="layout-pagination-button layout-pagination-number">4</a><a href="list.php?id=notice&page=5" class="layout-pagination-button layout-pagination-number">5</a><a href="list.php?id=notice&page=6" class="layout-pagination-button layout-pagination-number">6</a><a href="list.php?id=notice&page=7" class="layout-pagination-button layout-pagination-number">7</a><a href="list.php?id=notice&page=8"
						class="layout-pagination-button layout-pagination-number"
					>8</a><a href="list.php?id=notice&page=9" class="layout-pagination-button layout-pagination-number">9</a><a href="list.php?id=notice&page=10" class="layout-pagination-button layout-pagination-number">10</a><a href="list.php?id=notice&page=2" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a><a href="list.php?id=notice&page=22" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
				</div>
			</div>
			<table class="xans-board-search xans-board-search2">
				<tr>
					<!-- <td class=input_txt><img src="/shop/data/skin/designgj/images/board/ico_function.gif">검색어</td> -->
					<td class=stxt><input type=checkbox name="search[name]">이름 <input type=checkbox name="search[subject]">제목 <input type=checkbox name="search[contents]">내용&nbsp;</td>
					<td class=input_txt>&nbsp;</td>
					<td>
						<div class="search_bt">
							<a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/glass.png"></a> <input type="text" name="search[word]" value="" required>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<jsp:include page="../info/footer.jsp"></jsp:include>