<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>

<jsp:include page="../info/header2.jsp"></jsp:include>
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> 홈 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04"> 이벤트 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
	</div>
</div>
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-12 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!--  -->
					<div class="wrap-pic-w how-pos5-parent">
						<img src="${event.mappingURL}" alt="IMG-BLOG">
						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<!--  날짜 -->
							<span class="ltext-107 cl2 txt-center"> <javatime:format value="${event.moddate}" pattern="dd" /> </span> <span class="stext-109 cl3 txt-center"> <javatime:format value="${event.moddate}" pattern="MMM yyyy" /> </span>
						</div>
					</div>
					<div class="p-t-32">
						<!-- 날짜 -->
						<div class="text-center"> ${event.regdate }  </div>
						<!-- 제목 -->
						<h4 class="ltext-109 cl2 p-b-28 text-center mt-2"> ${event.title }</h4>
						<div>
							<img class="border rounded-circle ml-2 d-inlineblock" src="${pageContext.request.contextPath }/resources/images/product-min-02.jpg" width="50" height="50" alt="작성자 이름" /> <span class="cl12 m-l-4 m-r-6">|</span>
								<!-- member정보 필요 -->
							<p class="ml-2 d-inline-block">by 윤신영</p> <span class="cl12 m-l-4 m-r-6">|</span>
							<p class="ml-2 d-inline-block">phantom_ysy@naver.com</p>
						</div>
						<hr />
						<!-- 내용 -->
						<div class="stext-117 cl6 p-b-26" style="min-height: 300px;">${event.content }</div>
					</div>
					<hr />
					<div class="text-right">
						<a href="${pageContext.request.contextPath }/event/event_update?eno=${event.eno}" class="btn btn-secondary btn-primary" >이벤트 수정</a> <!-- 이거한번 실험해보자 -->
						<a href="${pageContext.request.contextPath }/event/event_delete?enoo=${event.eno}" class="btn btn-secondary btn-primary" >이벤트 삭제</a>
						<a href="${pageContext.request.contextPath }/event/event" class="btn btn-secondary btn-primary" >이벤트 목록</a>
					</div>
				</div>
			</div>
			<div class="col-12  p-b-80">
				<div class="side-menu">
					<div class="bor17 of-hidden pos-relative">
						<form action="#" method="post">
						<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">
						<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>
						</form>
					</div>
					
					<!-- 
					<div class="p-t-65">
						<h4 class="mtext-112 cl2 p-b-33">관련 이벤트</h4>
					</div>
					 -->
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../info/footer.jsp"></jsp:include>