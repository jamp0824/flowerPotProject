<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화분</title>

<!-- 아이콘 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="../resources/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/kurly1.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/c.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/b.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/a.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/notice.css">   --%>

<!-- slick -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<!-- jqeury -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

	<div id="wrap" >
		<div id="pos_scroll"></div>
		<div id="container">
			<div id="header">
				<div class="bnr_header" id="top-message">


					<a href="${pageContext.request.contextPath }" id="eventLanding"> 지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png" class="bnr_arr">
						<div class="bnr_top">
							<div class="inner_top_close">
								<button id="top-message-close" class="btn_top_bnr">가입하고 혜택받기</button>
							</div>
						</div>
					</a>
				</div>

				<div id="userMenu-wrap">
					<div id="userMenu">
						<ul class="list_menu">
							<li class="menu"><a href="${pageContext.request.contextPath }/member/login">로그인</a></li>
							<li class="menu"><a href="${pageContext.request.contextPath }/member/signUp">회원가입</a></li>
							<li class="menu"><a href="${pageContext.request.contextPath }/customerCenter/notice">고객센터</a></li>
							<li class="menu menu-last"><a href="${pageContext.request.contextPath }/ourCompany/Company_main">우리회사</a></li>
						</ul>
					</div>
				</div>	
				<div class="blank"></div>
				<div id="headerLogo" class="layout-wrapper">
					<h1 class="logo">
						<a href="${pageContext.request.contextPath }" class="link_main"> 
							<span id="gnbLogoContainer"></span> <img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="마켓컬리 로고">
						</a>
					</h1>
					<div id="side_search" class="gnb_search">
						<form action="/shop/goods/goods_search.php?&" onsubmit="return searchTracking(this)">
							<input type=hidden name=searched value="Y"> <input type=hidden name=log value="1"> <input type=hidden name=skey value="all"> <input type="hidden" name="hid_pr_text" value=""> <input type="hidden" name="hid_	_url" value=""> <input type="hidden" id="edit" name="edit" value=""> <input name=sword type=text id="" class="inp_search" value="" required label="검색어"> <input type=image src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
						</form>
					</div>
					<div id="my-content">
						<ul>
							<li><a href="${pageContext.request.contextPath }/myPage/orderList">마이페이지</a></li>
						
							<li><a href="${pageContext.request.contextPath }/shoppingList/shoppingList">장바구니</a></li>
							
							<li><a href="#">최근본 상품</a></li>
						</ul>
					</div>
				</div>
				<div class="blank"></div>
				<div id="gnb">
					<h2 class="screen_out">메뉴</h2>
					<div id="gnbMenu" class="gnb_kurly">
						<div class="inner_gnbkurly">
							<div class="gnb_main">
								<ul class="gnb">
									<li class="menu1 AllCategory"><a href="${pageContext.request.contextPath }/category/categoryTest"><span class="ico"></span><span class="txt">전체 카테고리</span></a>
										<!-- 카테고리 리스트 -->
										<div class="category-list">
											<ul>
												<li><h2>유형별</h2></li>
												<li>a</li>
												<li>a</li>
											</ul>
											<ul>
												<li><h2>피부고민별</h2></li>
												<li>a</li>
												<li>a</li>
											</ul>
										</div>
										
									</li>
									<li><a class="link new" href="#"><span class="txt">브랜드</span></a></li>
									<li><a class="link new" href="#"><span class="txt">오늘의 추천</span></a></li>
									<li><a class="link new" href="${pageContext.request.contextPath }/magazine/magazine"><span class="txt">매거진</span></a></li>
									<li class="lst"><a class="link event " href="#"><span class="txt">이벤트</span></a></li>
								</ul>
							</div>
							<div class="gnb_sub">
								<div class="inner_sub">
									<div class="gnb_menu">
										<div class="gnb_menu_col">
											<h2>유형별</h2>
											
											<ul>	
												
												<li><a class="menu">
												<span class="tit">전체보기</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">클렌징</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">스킨케어</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">마스크/팩</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">선케어</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">베이스 메이크업</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">립 메이크업</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">아이 메이크업</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">남성용</span>
												</a></li>	
											</ul>
										</div>
										<div class="gnb_menu_col">
											<h2>피부고민별</h2>
											
											<ul>	
												<li><a class="menu">
												<span class="tit">수분/보습</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">탄력/주름개선</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">민감성피부</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">모공/피지</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">미백/톤개선</span>
												</a></li>
												<li><a class="menu">
												<span class="tit">영양</span>
												</a></li>	
												<li><a class="menu">
												<span class="tit">각질/결개선</span>
												</a></li>	
												<li><a class="menu">
												<span class="tit">진정/수딩</span>
												</a></li>	
											</ul>
										</div>
										<!-- <gnb-menu-pc v-for="(item, idx) in dataGnb" :main-menu="item" :sub-menu="item.categories" :sub-open="item.subOpen" :get-category-num="getCategoryNum" :key="'gnb'+idx" :idx="idx"></gnb-menu-pc> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
<script type="text/javascript">

	$(document).ready(function() {
		$('.AllCategory').mouseover(function() {
			$('.gnb_sub').show('200ms');
			
		});
		$('.gnb_sub').mouseover(function() {
			$('.gnb_sub').show();
		
		});
		$('.gnb_sub').mouseleave(function() {
			$('.gnb_sub').hide();
			
		});
		$('.AllCategory').mouseleave(function() {
			$('.gnb_sub').hide();
			
		});
	}); 
</script>