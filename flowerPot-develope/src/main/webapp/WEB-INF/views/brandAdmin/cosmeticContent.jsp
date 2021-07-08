<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">상품</h4>
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
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">${cosmetic.name }</h4>
			<div class="tab-pane p-20" id="messages" role="tabpanel">
				<div class="p-20">
					<p>${cosmetic.content }</p>
				</div>
			</div>
			<table class="table">
				<tbody>
					<tr>
						<th>가격</th>
						<td>${cosmetic.price }원</td>
					</tr>
					<tr>
						<th>할인율</th>
						<td>${cosmetic.discountPersent }%</td>
					</tr>
					<tr>
						<th>재고</th>
						<td>${cosmetic.stockNumber }개</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${cosmetic.hits }</td>
					</tr>
					<tr>
						<th>좋아요수</th>
						<td>${cosmetic.likey }개</td>
					</tr>
					<tr>
						<th colspan="2">
							<a href="${initParam.cpath }/brandAdmin/cosmeticUpdate?cno=${cosmetic.cno}" class="btn btn-outline-secondary">수정</a>
							<a href="${initParam.cpath }/brandAdmin/cosmeticDelete?cno=${cosmetic.cno}" class="btn btn-outline-secondary">삭제</a>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>