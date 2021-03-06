<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
<!--===============================================================================================-->

<!-- ???????????? -->
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
</head>
<body class="animsition">

	<!-- Header -->
	 <header class="header-v4"> 

		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">Welcome to our FlowePot :)</div>

					<div class="right-top-bar flex-w h-full">

						<a href="${pageContext.request.contextPath }/member/signUp" class="flex-c-m trans-04 p-lr-25"> ???????????? </a>
						
						<sec:authorize access="isAnonymous()" >
							<a href="${pageContext.request.contextPath }/member/login" class="flex-c-m trans-04 p-lr-25"> ????????? </a>
						</sec:authorize>
						
						<sec:authorize access="isAuthenticated()" >
						<a class="flex-c-m trans-04 p-lr-25">
							<form action="${pageContext.request.contextPath}/logout" method="post">
								<input type="hidden" name=${_csrf.parameterName } value="${_csrf.token }">	
								<input type="submit" value="????????????" style="background-color: #222; color: #B2B2B2" >
							</form>
						</a>
						</sec:authorize>
						
						<a href="${pageContext.request.contextPath }/member/order" class="flex-c-m trans-04 p-lr-25"> ??????????????? </a>
						
						<a href="${pageContext.request.contextPath }/customerCenter/customerCenter?category=notice" class="flex-c-m trans-04 p-lr-25"> ???????????? </a>
						
						<a href="${pageContext.request.contextPath }/ourCompany/Company_main" class="flex-c-m trans-04 p-lr-25"> ???????????? </a>

					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1"> <!-- how-shadow1 -->

				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="${pageContext.request.contextPath}" class="logo"> 
					<img src="${pageContext.request.contextPath }/resources/images/icons/logoblue.png"/></a>


					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu"><a href="${pageContext.request.contextPath }">home</a></li>
	
							<!-- ?????? ????????? -->
							<li><a href="${pageContext.request.contextPath }/cosmetic/cosmetic_list" class="dropdown-toggle">Shop</a>
								<ul class="sub-menu">
									<li style="border-bottom: 1px solid #ccc; margin: 0 10px; " ><a href="#main-menu" class="font-weight-bold" >????????? ??????</a></li>
									<li><a href="${pageContext.request.contextPath }/cosmetic/cosmetic_list?type=????????????">????????????</a></li>
									<li><a href="${pageContext.request.contextPath }/cosmetic/cosmetic_list?type=????????????">????????????</a></li>
									<li><a href="${pageContext.request.contextPath }/cosmetic/cosmetic_list?type=????????????">????????????</a></li>
									<li><a href="${pageContext.request.contextPath }/cosmetic/cosmetic_list?type=????????????">????????????</a></li>
									<li><a href="${pageContext.request.contextPath }/cosmetic/cosmetic_list?type=??????/?????????">??????/?????????</a></li>
								</ul></li>

							<li><a href="${pageContext.request.contextPath }/magazine/magazine?category=Tip" class="dropdown-toggle">?????????</a>

								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/magazine/magazine?category=Tip">Tip</a></li>
									<li><a href="${pageContext.request.contextPath }/magazine/magazine?category=Interview">Interview</a></li>
									<li><a href="${pageContext.request.contextPath }/magazine/magazine?category=COVID19">COVID19</a></li>
									<li><a href="${pageContext.request.contextPath }/magazine/magazine?category=setec">Setec</a></li>
								</ul></li>

							<li><a href="${pageContext.request.contextPath }/today/today">???????????????</a></li>

							<li><a href="${pageContext.request.contextPath }/event/event" class="dropdown-toggle">?????????</a>
								
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/event/event">?????????</a></li>
									<li><a href="${pageContext.request.contextPath }/event/dayCheck">????????????</a></li>
								</ul>
							</li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${fn:length(shoppingCartList)}">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="${pageContext.request.contextPath }/shoppingList/wishlist" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="index3.html">
					<img src="${pageContext.request.contextPath }/resources/images/icons/logoblue.png" alt="IMG-LOGO">
				</a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="${fn:length(shoppingCartList)}">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">Welcome to our FlowePot :) </div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="${pageContext.request.contextPath }/custumerCenter/costomerCenter" class="flex-c-m trans-04 p-lr-25"> ???????????? </a>

						<a href="${pageContext.request.contextPath }/myPage/myPage" class="flex-c-m trans-04 p-lr-25"> ??????????????? </a>

						<a href="${pageContext.request.contextPath }/member/login" class="flex-c-m trans-04 p-lr-25"> ????????? </a>

						<a href="${pageContext.request.contextPath }/member/signUp" class="flex-c-m trans-04 p-lr-25"> ???????????? </a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li><a href="${pageContext.request.contextPath }">home</a></li>

				<li><a href="product.html">Shop</a>
					<ul class="sub-menu">
						<li><a href="${pageContext.request.contextPath }/category/category">???????????????</a></li>
						<li><a href="${pageContext.request.contextPath }/category/category">????????????</a></li>
						<li><a href="${pageContext.request.contextPath }/category/category">?????????</a></li>
					</ul></li>

				<li class="label1" data-label1="hot"><a href="${pageContext.request.contextPath }/category/category">?????????</a></li>

				<li><a href="${pageContext.request.contextPath }/magazine/magazine">?????????</a></li>

				<li><a href="${pageContext.request.contextPath }/today/today.jsp">???????????????</a></li>

				<li><a href="${pageContext.request.contextPath }/event/event">?????????</a>
					<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/event/event">?????????</a></li>
									<li><a href="${pageContext.request.contextPath }/event/dayCheck">????????????</a></li>
								</ul>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="${pageContext.request.contextPath }/resources/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-25 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> ???????????? ?????? </span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<c:forEach var="cosmetic" items="${shoppingCartList }">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<input type="hidden" class="c-discount" value="${cosmetic.discountPersent}">
						<div class="header-cart-item-img">
							<img src="${cosmetic.mappingList[0] }" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04"> ${cosmetic.name } </a>

							<span class="header-cart-item-info">
								<span class="c-price">${cosmetic.price }</span> <span>???</span>
							</span>
							<span class="header-cart-item-info">
								<span class="c-num">${cosmetic.numProduct }</span> <span>???</span>
							</span>
						</div>
					</li>
					</c:forEach>
				</ul>

				<div class="w-full">
					<!-- ??? ?????? -->
					<div class="header-cart-total w-full p-tb-40">??? ??????: <span class="t-price"></span><span>???</span></div>
					
					<div class="header-cart-buttons flex-w w-full">	
						<!-- ??????????????? ?????? -->
						<a href="${pageContext.request.contextPath }/shoppingList/shoppingList" 
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"> ??????????????? ?????? </a>
						<!-- ???????????? -->
						<a href="${pageContext.request.contextPath}/cosmetic/payment?root=2" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"> ???????????? </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
function shoppingList() {
	var totalPrice = 0;
	for(var i=0; i<$('.c-price').length; i++){
		var price =  Number($($('.c-price').get(i)).html());
		var num = Number($($('.c-num').get(i)).html());
		var discount = $($('.c-discount').get(i)).val();
		totalPrice += price*num*((100-discount)/100);
	}
	$('.t-price').html(String(totalPrice));
}

shoppingList();

</script>