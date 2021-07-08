<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="header.jsp"></jsp:include>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">상품관리</h4>
			<div class="ml-auto text-right">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">상품관리</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<h5 class="page-title">화장품 리스트</h5>
	
	<div class="row el-element-overlay">
		<c:forEach var="cosmetic" items="${cList }">
		<div class="col-lg-3 col-md-6">
			<div class="card">
				<div class="el-card-item">
					<div class="el-card-avatar el-overlay-1">
						<img src="${cosmetic.mappingURL }" alt="user">
						<div class="el-overlay">
							<ul class="list-style-none el-info">
								<li class="el-item">
									<a class="btn default btn-outline image-popup-vertical-fit el-link" href="assets/images/big/img1.jpg">
										<i class="mdi mdi-magnify-plus"></i>
									</a>
								</li>
								<li class="el-item">
									<a class="btn default btn-outline el-link" href="javascript:void(0);">
										<i class="mdi mdi-link"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="el-card-content">
						<a href="${initParam.cpath }/brandAdmin/cosmeticContent?cno=${cosmetic.cno}" class="m-b-0">${cosmetic.name }</a>
						<span class="text-muted"><fmt:formatNumber type="number" value="${cosmetic.price }" pattern="#,##0원" /> </span>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<a href="${initParam.cpath }/cosmetic/cosmetic_register" class="btn btn-primary btn-lg float-right">화장품 등록</a>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>