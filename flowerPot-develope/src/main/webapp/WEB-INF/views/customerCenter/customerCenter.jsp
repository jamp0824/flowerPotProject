<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>

<jsp:include page="../info/header2.jsp"></jsp:include>
<style type="text/css">
@font-face {
	font-family: 'UhBeeSeulvely';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeSeulvely.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

a:link {
	text-decoration: none;
}

.h50 {
	height: 50px;
}
</style>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/banner_navy.png');">
	<h2 style="font-family: UhBeeSeulvely; font-weight: bolder; color: #ffffff">
		<a href="${pageContext.request.contextPath }/customerCenter/customerCenter" style="color: #ffffff">NOTICE</a>
	</h2>
</section>

<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="${pageContext.request.contextPath }" class="stext-109 cl8 hov-cl1 trans-04">
			홈 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<a href="${pageContext.request.contextPath }/customerCenter/customerCenter" class="stext-109 cl8 hov-cl1 trans-04">
			고객센터 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<span class="stext-109 cl4"> 공지사항 </span>
	</div>
</div>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-lg-3 p-b-80">
				<div class="side-menu">
					<jsp:include page="keyword.jsp"></jsp:include>

					<jsp:include page="sidebar.jsp"></jsp:include>
					
					<sec:authorize access="hasRole('ROLE_USER')" >
						<div class="p-t-50">
							<a href="${pageContext.request.contextPath }/customerCenter/write" class="btn btn-secondary btn-lg btn-block">1대1 문의하기</a>
						</div>
					</sec:authorize>
				</div>
			</div>

			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="table col-12 board-listt ">
						<c:if test="${category eq 'notice' }">
							<h2 class="my-4 text-center">공지사항</h2>
						</c:if>
						<c:if test="${category eq 'FAQ' }">
							<h2 class="my-4 text-center">자주찾는질문(FAQ)</h2>
						</c:if>
						<c:if test="${category eq 'enquiry' }">
							<h2 class="my-4 text-center">1대1문의</h2>
						</c:if>
						<table class="table table-striped table-sm ">
							<thead>
								<tr>
									<th class="text-center h50 align-middle">번호</th>
									<th class="text-center h50 align-middle" style="width: 50%">제목</th>
									<th class="text-center h50 align-middle">작성자</th>
									<th class="text-center h50 align-middle">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cc" items="${cList }">
									<tr>
										<th class="text-center h50 align-middle">${cc.ccno }</th>
										<th class="text-center h50 align-middle" style="width: 50%"><a href="${pageContext.request.contextPath }/customerCenter/content?ccno=${cc.ccno }">${cc.title }</a></th>
										<th class="text-center h50 align-middle">${cc.memberVo.nickname }</th>
										<th class="text-center h50 align-middle"> ${cc.regdate } </th>
									</tr>
									<c:if test="${cc.rlist ne null}">
										<c:forEach var="r" items="${cc.rlist }">
										<tr>
											<th class="text-center h50 align-middle">
												<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
												</svg>
											</th>
											<th class="text-center h50 align-middle" style="width: 50%"><a href="${pageContext.request.contextPath }/customerCenter/rcontent?rno=${r.rno }">${r.replytitle }</a></th>
											<th class="text-center h50 align-middle">${r.replyer }</th>
											<th class="text-center h50 align-middle"> ${r.regdate } </th>
										</tr>
										</c:forEach>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<div class="flex-c-m flex-w w-full p-t-10 m-lr--7 magazine-nav">
						<!-- Pagination -->
						<c:if test="${page.prev eq true}">
							<a href="${pageContext.request.contextPath }/customerCenter/customerCenter?category=${pg.cri.category}&pageNum=${pg.startPage-10}" class="flex-c-m how-pagination1 trans-04 m-all-7">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
								</svg>
							</a>
						</c:if>
						<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }" step="1">

							<a href="${pageContext.request.contextPath }/customerCenter/customerCenter?category=${pg.cri.category}&pageNum=${num}" class="flex-c-m how-pagination1 trans-04 m-all-7"> ${num } </a>

						</c:forEach>

						<c:if test="${page.next eq true}">
							<a href="${pageContext.request.contextPath }/customerCenter/customerCenter?category=${pg.cri.category}&pageNum=${pg.startPage+10}" class="flex-c-m how-pagination1 trans-04 m-all-7">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  		<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
								</svg>
							</a>
						</c:if>

						<!-- <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"> 1 </a>
						<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7"> 2 </a>
						<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
						</a>
						 -->
					</div>
				</div>
			</div>


		</div>
	</div>
</section>

<jsp:include page="../info/footer.jsp"></jsp:include>