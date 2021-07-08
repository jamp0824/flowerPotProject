<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light mb-5" style="background-color: #efbbcf; padding: 2px;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">FlowerPot</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<!-- home -->
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}">
						Home<span class="sr-only">(current)</span>
					</a></li>
				<!-- category -->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/product/product" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</a></li>
				<!-- 매거진 -->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/magazine/magazine" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">매거진</a></li>
				<!-- 오늘의 추천 -->
				<li class="nav-item"><a href="#" class="nav-link">오늘의 추천</a></li>
				<!-- 이벤트 -->
				<li class="nav-item"><a href="${pageContext.request.contextPath}/event/event" class="nav-link">이벤트</a></li>
				<!-- 관리자 -->
				<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">관리자</a></li>
			</ul>
		</div>
	</nav></html>