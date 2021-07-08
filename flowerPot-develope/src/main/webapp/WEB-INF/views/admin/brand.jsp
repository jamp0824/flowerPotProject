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
		$('#searchBtn')
				.click(
						function() {
							console.log('검색버튼이 클릭됨!');
							let keyword = $('#keywordInput').val();
							console.log('검색어 : ' + keyword);
							const condition = $('#condition option:selected')
									.val();
							console.log('검색조건 : ' + condition);
							location.href = "${pageContext.request.contextPath}/admin/brand?keyword="
									+ keyword + "&condition=" + condition;
						});

		$('#keywordInput').keydown(function(key) {
			if (key.keyCode == 13) {
				$('#searchBtn').click();
			}
		});
	});

	const result = "${msg}";

	if (result === "modSuccess") {
		alert('브랜드 정보 수정 성공!');
	} else if (result === "delSuccess") {
		alert('브랜드 정보 삭제 성공!');
	}
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
					<a class="navbar-brand" href="#pablo"> 입점 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->

					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card strpied-tabled-with-hover">
										<div class="card-header ">
											<h4 class="card-title" style="display: inline-block;">브랜드 목록</h4>
											<button class="btn btn-flat" onclick="location='${pageContext.request.contextPath}/admin/brandAdd';" style="background-color: #212b52; color: white; border: 1px solid #212b52; display: inline-block; margin-left: 20px;">신규 등록</button>
											<!-- 검색 기능 -->
											<div class="col-md-12 ">
												<div class="pull-right" style="text-align: right;">
													<div class="input-group pull-right" style="text-align: right !important;">
														<select id="condition" class="y-form-control" name="condition" style="width: 100px;">
															<option value="company">회사명</option>
															<option value="brandName">브랜드명</option>
															<option value="busNo">사업자번호</option>
														</select>
														<input type="text" class="y-form-control " name="keyword" id="keywordInput" placeholder="검색어" style="width: 200px;">
														<span class="input-group-btn "> <input type="button" value="검색" class="btn btn-flat" id="searchBtn" style="background-color: #212b52; color: white; border: 1px solid #212b52; display: inline-block;">
														</span>
													</div>
												</div>
											</div>
											<p class="card-category">부제</p>

										</div>
										<div class="card-body table-full-width table-responsive">
											<table class="table table-hover table-striped">
												<!-- 게시글 목록 출력 -->
												<thead>
													<th>번호</th>
													<th>회사명</th>
													<th></th>
													<th>브랜드명</th>
													<th>대표</th>
													<th>사업자번호</th>
													<th>비고</th>
												</thead>
												<tbody>
													<c:forEach var="brand" items="${bList}">
														<tr>
															<td>${brand.bno}</td>
															<td>${brand.company}</td>
															<td>
																<button class="btn btn-outline-dark" onclick="location='${pageContext.request.contextPath}/admin/brandInfo/${brand.bno}';">상세정보</button>
															</td>
															<td>${brand.brandName}</td>
															<td>${brand.ceoName}</td>
															<td>${brand.busNo}</td>
															<td>
																<form action="${pageContext.request.contextPath}/admin/brandDelete" name="deleteBrand">
																	<input type="hidden" name="bno" value="${brand.bno}" />
																	<input class="btn btn-outline-dark" type="submit" value="삭제" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){return false;}" />
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
												style="background-color: #212b52; color: white; display: inline-block; " value="검색"
												class="btn btn-izone btn-flat" id="searchBtn" >
											</span>
										</div>
									</div>
								</div> -->

								<!-- 페이징 처리 부분  -->
								<div class="col-md-12">
									<div class="paging">
										<ul class="pagination justify-content-center">
											<!-- 이전 버튼 -->
											<c:if test="${pc.prev}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/brand${pc.makeURI(pc.beginPage - 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #d3d3d3; opacity: 0.8">이전</a></li>
											</c:if>

											<!-- 페이지 버튼 -->
											<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
												<li class="page-item"><a href="<c:url value='/admin/brand${pc.makeURI(pageNum)}'/>" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: #212b52; text-align: center; border: 1px solid #d3d3d3;">${pageNum}</a></li>
											</c:forEach>

											<!-- 다음 버튼 -->
											<c:if test="${pc.next}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/brand${pc.makeURI(pc.endPage + 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #d3d3d3; opacity: 0.8">다음</a></li>
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