
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Table - Voler Admin Dashboard</title>

<link rel="stylesheet" href="../resources/semiadmin_css/assets/css/bootstrap.css">

<link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/simple-datatables/style.css">

<link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="../resources/semiadmin_css/assets/css/app.css">
<style>
.submit {
	display: inline-block;
	padding: 0.4rem 0.55rem;
	font-size: 0.75rem;
	font-weight: 500;
	line-height: 1;
	background-color: #5A8DEE;
	border-color: #5A8DEE;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: 1rem;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>

	<div id="app">
		<jsp:include page="sidebar.jsp"></jsp:include>
	</div>
	<div id="main">
		<nav class="navbar navbar-header navbar-expand navbar-light">
			<a class="sidebar-toggler" href="#">
				<span class="navbar-toggler-icon"></span>
			</a>
			<button class="btn navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav d-flex align-items-center navbar-light ml-auto">
					<li class="dropdown nav-icon"><a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
							<div class="d-lg-inline-block">
								<i data-feather="bell"></i>
							</div>
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-large">
							<h6 class='py-2 px-4'>Notifications</h6>
							<ul class="list-group rounded-none">
								<li class="list-group-item border-0 align-items-start">
									<div class="avatar bg-success mr-3">
										<span class="avatar-content"><i data-feather="shopping-cart"></i></span>
									</div>
									<div>
										<h6 class='text-bold'>New Order</h6>
										<p class='text-xs'>An order made by Light &emp; Salt for FlowerPot</p>
									</div>
								</li>
							</ul>
						</div></li>
					<li class="dropdown nav-icon mr-2"><a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
							<div class="d-lg-inline-block">
								<i data-feather="mail"></i>
							</div>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="#">
								<i data-feather="user"></i> Account
							</a>
							<a class="dropdown-item active" href="#">
								<i data-feather="mail"></i> Messages
							</a>
							<a class="dropdown-item" href="#">
								<i data-feather="settings"></i> Settings
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<i data-feather="log-out"></i> Logout
							</a>
						</div></li>
					<li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
							<div class="avatar mr-1">
								<img src="../resources/semiadmin_css/assets/images/avatar/avatar-s-1.png" alt="" srcset="">
							</div>
							<div class="d-none d-md-block d-lg-inline-block">Hi, 성은</div>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="#">
								<i data-feather="user"></i> Account
							</a>
							<a class="dropdown-item active" href="#">
								<i data-feather="mail"></i> Messages
							</a>
							<a class="dropdown-item" href="#">
								<i data-feather="settings"></i> Settings
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<i data-feather="log-out"></i> Logout
							</a>
						</div></li>
				</ul>
			</div>
		</nav>

		<!-- check: Bordered table start -->
		<!-- ----------------------------------------------------------------- -->
		<div class="main-content container-fluid">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>상품/재고관리</h3>
						<p class="text-subtitle text-muted">
							현재 화장품의 재고 상태를 보여줍니다	
						</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb" class='breadcrumb-header'>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">상품/재고관리</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<section class="section">
				<div class="card">

					<!-- table bordered -->
					<div class="row" id="table-bordered">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
								</div>
								<div class="card-content">
									<div class="card-body">
										<p class="card-text">
											<code>재고를 바로 확인 할 수 있고 필요하신 부분이 있으시면 신청해주시기 바랍니다. </code>
											<br /> 그 외의 문의사항은 언제든지 FlowerPot 담당자에게 메일로 연락주시면 됩니다.
										</p>
									</div>
									<!-- table bordered -->
									<div class="table-responsive">
										<table class="table table-bordered mb-0">

											<thead>
												<tr>
													<th>상품 번호</th>
													<th>상품명</th>
													<th>기존 할인율</th>
													<th style="min-width: 100px;">할인율 조정</th>
													<th>기존 수량</th>
													<th style="min-width: 100px;">추가 요청 수량</th>
													<th>확인</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="i" items="${ilist}">
													<tr>
														<form method="post">
															<td class="text-nowrap text-bold-500">${i.cno}</td>
															<td class="text-nowrap">${i.name}</td>
															<td >${i.discountPersent}</td>
															<td style="min-width: 100px;">
															<input id="plusDiscountPersent" type="number" name="discountPersent" value="${i.discountPersent}" style="border: 2px solid #0d6efd; width: 50%;">
																<div id="emailHelp" class="form-text">단위는  %입니다</div>
															</td>
															<td >${i.stockNumber}</td>

															<td style="min-width: 100px;">
																<input id="hidden_cno" type="number" name="plusStock" style="border: 2px solid #0d6efd; width: 50%;">
																<input type="hidden" name="cno" value="${i.cno}">
															</td>

															<td>
																<input type="submit" value="수정" class="submit" onclick="return stocksave(this);">
															</td>
														</form>
													</tr>
												</c:forEach>
											</tbody>

										</table>
										
										<a href="${pageContext.request.contextPath }/cosmetic/cosmetic_register" class="btn btn-outline-secondary my-4 mx-4 float-right">화장품 등록</a>
									</div>
								</div>
							</div>
						</div>
					</div>

<script>
					
console.log(document.getElementById("hidden_cno"));

function stocksave(tag) {
	console.log(tag);
	$(tag).parent();
	console.log($(tag).parent());
	console.log($(tag).parent().prev().children());
	console.log($($(tag).parent().prev().children()).val());
	
	if($($(tag).parent().prev().children()).val() == ''){
		alert ("재고를 입력해주세요");
		return false;
	}
	
	if($($(tag).parent().prev().children('#plusDiscountPersent')).val() == ''){
		alert ("할인률을 입력해주세요");
		return false;
	}
	
	if($($(tag).parent().prev().children('#plusDiscountPersent')).val() >100 || $($(tag).parent().prev().children('#plusDiscountPersent')).val() < 0){
		alert ("유효하지 않은 숫자입니다");
		return false;
	}
	
}


</script>
					<!-- Bordered table end -->

					<jsp:include page="footerbar.jsp"></jsp:include>
				</div>
		</div>
	</div>


</body>
</html>
