<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt"   prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../info/header2.jsp"></jsp:include>
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> 홈 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04"> 매거진 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> ${magazineVo.category } </span>
	</div>
</div>
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-12 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!--  -->
					<div class="wrap-pic-w how-pos5-parent">
						<img src="${pageContext.request.contextPath}${magazineVo.rootfolder}${magazineVo.UUIDName}" alt="IMG-BLOG">
						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<span class="ltext-107 cl2 txt-center"> <fmt:formatDate value="${magazineVo.regdate}" pattern="dd" /> </span> <span class="stext-109 cl3 txt-center"> <fmt:formatDate value="${magazineVo.regdate}" pattern="yyyy년 MM월" /> </span>
						</div>
					</div>
					<div class="p-t-32">
						<!-- 날짜 -->
						<div class="text-center"> ${magazineVo.regdate }  </div>
						<!-- 제목 -->
						<h4 class="ltext-109 cl2 p-b-28 text-center mt-2"> ${magazineVo.title }</h4>
						<div>
							<img class="border rounded-circle ml-2 d-inlineblock" src="${pageContext.request.contextPath }/resources/images/product-min-02.jpg" width="50" height="50" alt="작성자 이름" /> <span class="cl12 m-l-4 m-r-6">|</span>
							<p class="ml-2 d-inline-block">by 윤신영</p> <span class="cl12 m-l-4 m-r-6">|</span>
							<p class="ml-2 d-inline-block">phantom_ysy@naver.com</p>
						</div>
						<hr />
						<!-- 내용 -->
						<div class="stext-117 cl6 p-b-26" style="min-height: 300px;">${magazineVo.content }</div>
					</div>
					<hr />
					<div class="text-right">
						<c:if test="${member.mno == magazineVo.mno }">
							<a href="${pageContext.request.contextPath }/magazine/magazine_update?mgno=${magazineVo.mgno}" class="btn btn-secondary btn-primary" >메거진 수정</a> <!-- 이거한번 실험해보자 -->
							<a href="${pageContext.request.contextPath }/magazine/magazine_delete?mgno=${magazineVo.mgno}" class="btn btn-secondary btn-primary" >메거진 삭제</a>
						</c:if>
							<a href="${pageContext.request.contextPath }/magazine/magazine?category=${magazineVo.category}" class="btn btn-secondary btn-primary" >메거진 목록</a>
						
					</div>
					<!-- 태그기능 있으면 좋을듯 -->
					<!-- <div class="flex-w flex-t p-t-16">
						<span class="size-216 stext-116 cl8 p-t-4"> Tags </span>
						<div class="flex-w size-217">
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Streetstyle </a> <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5"> Crafts </a>
						</div>
					</div> -->
					
				</div>
			</div>
			<div class="col-12 p-b-80">
				<div class="side-menu">
					<div class="bor17 of-hidden pos-relative">
						<form action="#" method="post">
						<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">
						<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>
						</form>
					</div>
					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-33">카테고리</h4>
						<ul>
							<li class="bor18"><a href="${pageContext.request.contextPath }/magazine/magazine?category=Tip" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> Tip </a></li>
							<li class="bor18"><a href="${pageContext.request.contextPath }/magazine/magazine?category=Interview" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> Interview </a></li>
							<li class="bor18"><a href="${pageContext.request.contextPath }/magazine/magazine?category=COVID19" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> COVID19 </a></li>
							<li class="bor18"><a href="${pageContext.request.contextPath }/magazine/magazine?category=Setec" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"> Setec </a></li>
						</ul>
					</div>
					<div class="p-t-65">
						<h4 class="mtext-112 cl2 p-b-33">관련 매거진</h4>
					<%-- 	<ul>
							<li class="flex-w flex-t p-b-30"><a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20"> <img src="${pageContext.request.contextPath }/resources/images/product-min-01.jpg" alt="PRODUCT">
							</a>
								<div class="size-215 flex-col-t p-t-8">
									<a href="#" class="stext-116 cl8 hov-cl1 trans-04"> White Shirt With Pleat Detail Back </a> <span class="stext-116 cl6 p-t-20"> $19.00 </span>
								</div></li>
							<li class="flex-w flex-t p-b-30"><a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20"> <img src="${pageContext.request.contextPath }/resources/images/product-min-02.jpg" alt="PRODUCT">
							</a>
								<div class="size-215 flex-col-t p-t-8">
									<a href="#" class="stext-116 cl8 hov-cl1 trans-04"> Converse All Star Hi Black Canvas </a> <span class="stext-116 cl6 p-t-20"> $39.00 </span>
								</div></li>
							<li class="flex-w flex-t p-b-30"><a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20"> <img src="${pageContext.request.contextPath }/resources/images/product-min-03.jpg" alt="PRODUCT">
							</a>
								<div class="size-215 flex-col-t p-t-8">
									<a href="#" class="stext-116 cl8 hov-cl1 trans-04"> Nixon Porter Leather Watch In Tan </a> <span class="stext-116 cl6 p-t-20"> $17.00 </span>
								</div>
								</li>
						</ul> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../info/footer.jsp"></jsp:include>