<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<jsp:include page="info/resources.jsp" />
<%--css,img,script등 정적자원 --%>
<script>
$(function() {
	$('#searchBtn').click(function(){
		console.log('검색버튼이 클릭됨!');
		let keyword = $('#keywordInput').val();
		console.log('검색어 : '+keyword);
		const condition = $('#condition option:selected').val();
		console.log('검색조건 : '+condition);
		location.href="${pageContext.request.contextPath}/admin/customer/notice?keyword="+keyword+"&condition="+condition;
	});
	
	$('#keywordInput').keydown(function(key){
		if(key.keyCode == 13){
			$('#searchBtn').click();
		}
	});
});
</script>
</head>
<body>
	<div class="wrapper">
		<!-- 사이드바 -->
		<jsp:include page="info/sidebar.jsp" />
		<%--사이드바 --%>

		<div class="main-panel">
			<!-- header(nav) -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand" href="#pablo"> 소통 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card strpied-tabled-with-hover">
										<div class="card-header ">
											<h4 class="card-title" style="display: inline-block;">공지 사항</h4>
											<a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #212b52; display: inline-block;">
												<span class="no-icon" style="color: #212b52">카테고리</span>
											</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
												<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/customer/notice">공지사항</a>
												<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/customer/faq">F A Q</a>
												<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/customer/q&a">Q & A</a>
											</div>
											<button class="btn btn-izone btn-flat pull-right" onclick="location='${pageContext.request.contextPath}/admin/customer/notice_write'" style="background-color: #212b52; color: white; border: 1px solid #212b52;">작성</button>
											<p class="card-category">공지사항, FAQ, Q&A를 관리하는 페이지 입니다</p>
											<br>
											<!-- 검색 기능 -->
											<div class="col-md-12 ">
												<div class="pull-right" style="text-align: right;">
													<div class="input-group pull-right" style="text-align: right !important;">


														<select id="condition" class="y-form-control" name="condition" style="width: 100px;">
															<option value="ccno">번호</option>
															<option value="title">ID</option>
															<option value="ccnoTitle">번호+ID</option>
														</select>


														<input type="text" class="y-form-control " name="keyword" id="keywordInput" placeholder="검색어" style="width: 200px;">
														<span class="input-group-btn "> <input type="button" style="background-color: #212b52; color: white; display: inline-block;" value="검색" class="btn btn-izone btn-flat" id="searchBtn">
														</span>
													</div>
												</div>
											</div>
											<!-- <li class="nav-item dropdown" style="text-decoration: none;"> -->
										</div>
										<div class="content card-body table-full-width table-responsive">
											<table class="table table-hover table-striped">
												<!-- 게시글 목록 출력 -->
												<thead>
													<th>번호</th>
													<th>제목</th>
													<th>등록날짜</th>
													<th>수정날짜</th>
													<th></th>
												</thead>
												<tbody>
													<c:forEach var="notice" items="${nList}">
														<tr>
															<td>${notice.ccno}</td>
															<td>${notice.title}</td>
															<td>
																<fmt:formatDate value="${notice.regDate}" pattern="yyyy년 MM월 dd일" />
															</td>
															<td>
																<c:if test="${!empty notice.modDate}">
																	<fmt:formatDate value="${notice.modDate}" pattern="yyyy년 MM월 dd일" />
																</c:if>
																<c:if test="${empty notice.modDate}">
													미수정
													</c:if>
															</td>
															<td>
																<button class="btn btn-outline-dark" onclick="location='${pageContext.request.contextPath}/admin/customer/notice_content/${notice.ccno}'">내용</button>
																<form action="${pageContext.request.contextPath}/admin/customer/notice_del" method="post">
																	<input  type="hidden" name="ccno" value="${notice.ccno}" />
																	<button class="btn btn-outline-dark" type="submit" >삭제</button>
																</form>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<!-- 검색 기능 -->
								<!-- <div class="col-md-12 ">
									<div class="pull-right" style="text-align: right;">
										<div class="input-group pull-right" style="text-align: right !important; ">
											<select id="condition" class="y-form-control"
												name="condition" style="width: 100px;">
												<option value="mno">번호</option>
												<option value="id">ID</option>
												<option value="name">이름</option>
											</select> <input type="text" class="y-form-control " name="keyword"
												id="keywordInput" placeholder="검색어" style="width: 200px;">
											<span class="input-group-btn "> 
												<input type="button"
												style="background-color: #9765da; color: white; display: inline-block;" value="검색"
												class="btn btn-izone btn-flat" id="searchBtn" >
											</span>
										</div>
									</div>

								</div> -->
								<div class="col-md-12">
									<!-- 페이징 처리 부분  -->
									<div class="paging">
										<ul class="pagination justify-content-center">
											<!-- 이전 버튼 -->
											<c:if test="${pc.prev}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/customer/notice/${pc.makeURI(pc.beginPage - 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #d3d3d3; opacity: 0.8">이전</a></li>
											</c:if>

											<!-- 페이지 버튼 -->
											<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
												<li class="page-item"><a href="<c:url value='/admin/customer/notice/${pc.makeURI(pageNum)}'/>" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: #212b52; text-align: center; border: 1px solid #d3d3d3;">${pageNum}</a></li>
											</c:forEach>

											<!-- 다음 버튼 -->
											<c:if test="${pc.next}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/customer/notice/${pc.makeURI(pc.endPage + 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #d3d3d3; opacity: 0.8">다음</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 본문 끝 -->

					<!-- footer -->
					<jsp:include page="info/footer.jsp" />
					<%--푸터 --%>

				</div>
		</div>
</body>
</html>