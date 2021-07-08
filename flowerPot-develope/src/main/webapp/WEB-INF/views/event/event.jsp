<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../info/header2.jsp"></jsp:include>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/logo_event.png');">
	<h2 class="ltext-105 cl0 txt-center"></h2>
</section>

<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				이벤트
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
		
		</div>
	</div>
	
	
<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
			 
			 	<!--  이벤트 목록 -->
				<div class="p-r-45 p-r-0-lg ">
					<c:forEach var="event" items="${eList }">
						<div class="p-b-63">
							<a href="${pageContext.request.contextPath }/event/event_cont?eno=${event.eno }" class="hov-img0 how-pos5-parent">
								<img src="${event.mappingURL }" alt="IMG-BLOG">
								<div class="flex-col-c-m size-123 bg9 how-pos5">
									<span class="ltext-107 cl2 txt-center"><javatime:format value="${event.moddate}" pattern="dd" /></span><span class="stext-109 cl3 txt-center"><javatime:format value="${event.moddate}" pattern="MMM yyyy" /></span>
								</div>
							</a>
							<div class="p-t-32">
								<h4 class="p-b-15">
									<a href="${pageContext.request.contextPath }/event/event_cont?eno=${event.eno }" class="ltext-108 cl2 hov-cl1 trans-04"> ${event.title } </a>
								</h4>
								<div class="flex-w flex-sb-m p-t-18">
									<a href="${pageContext.request.contextPath }/event/event_cont?eno=${event.eno }" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
										Continue Reading <i class="fa fa-long-arrow-right m-l-9"></i>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 이벤트 페이징 넘버 -->
				<div class="flex-c-m flex-w w-full p-t-10 m-lr--7 magazine-nav">
					<!-- <a >
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
						</svg>
					</a>
					<button class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"> 1 </button>
					<a class="flex-c-m how-pagination1 trans-04 m-all-7"> 2 </a>
					<a >
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</a> -->
				</div>
			</div>
			<div class="col-md-4 col-lg-3 p-b-80">
				<div class="side-menu">
					<div class="bor17 of-hidden pos-relative">
						<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">
						<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>
					</div>
					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-20">Archive</h4>
						<ul>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> July 2018 </span> <span> (9) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> June 2018 </span> <span> (39) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> May 2018 </span> <span> (29) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> April 2018 </span> <span> (35) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> March 2018 </span> <span> (22) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> February 2018 </span> <span> (32) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> January 2018 </span> <span> (21) </span>
								</a></li>
							<li class="p-b-7"><a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
									<span> December 2017 </span> <span> (26) </span>
								</a></li>
						</ul>
					</div>
					<div class="p-t-50">
						<h4 class="mtext-112 cl2 p-b-27">Tags</h4>
						<div class="flex-w m-r--5">
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Fashion </a>
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Lifestyle </a>
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Denim </a>
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Streetstyle </a>
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Crafts </a>
						</div>
					</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')" >
						<div class="p-t-50">
							<a href="${pageContext.request.contextPath }/event/event_write" class="btn btn-secondary btn-lg btn-block" >이벤트 등록</a>
						</div>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../info/footer.jsp"></jsp:include>
</head>
</html>
