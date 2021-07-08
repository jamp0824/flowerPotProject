<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<jsp:include page="info/resources.jsp" />
<%--css,img,script등 정적자원 --%>

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
								<div class="col-md-8">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">F A Q</h4>
										</div>
										<div class="card-body">
											<div class="content">
												<div class="row">
													<div class="col-md-1">
														<div class="form-group">
															<label>번호</label>
															<text class="form-control" >${faq.ccno}</text>
														</div>
													</div>
													<div class="col-md-11">
														<div class="form-group">
															<label>제목</label>
															<text class="form-control" >${faq.title}</text>
														</div>
													</div>

												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>내용</label>
															<text class="form-control" style="height : 200px" >${faq.content}</text>
														</div>
													</div>
												</div>
												<form action="${pageContext.request.contextPath}/admin/customer/faq_modify" method="post">
													<input type="hidden" name="ccno" value="${faq.ccno}">												
													<button type="submit" class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52; margin-left: 10px;">수정</button>
												</form>
												<button class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;" onclick="location='${pageContext.request.contextPath}/admin/customer/faq/'">목록</button>
												&nbsp;
												<div class="clearfix"></div>
											</div>
										</div>
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