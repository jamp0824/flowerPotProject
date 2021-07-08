<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SemiAdmin - Main DashBoard</title>

<link rel="stylesheet" href="../resources/semiadmin_css/assets/css/bootstrap.css">

<link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/chartjs/Chart.min.css">

<link rel="stylesheet" href="../resources/semiadmin_css/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="../resources/semiadmin_css/assets/css/app.css">
<link rel="shortcut icon" href="../resources/semiadmin_css/assets/images/favicon.svg" type="image/x-icon">

<style>
.delButton {
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

</head>
<body>
	<div id="app">
		<jsp:include page="sidebar.jsp"></jsp:include>
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
											<p class='text-xs'>An order made by Ahmad Saugi for product Samsung Galaxy S69</p>
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

			<div class="main-content container-fluid">
				<div class="page-title">
					<h3 style="font-weight: bold;">${member.brand }</h3>
					<p class="text-subtitle text-muted">A good dashboard to display your statistics</p>
				</div>
				<section class="section">
					<div class="row mb-2">
						<div class="col-12 col-md-3">
							<div class="card card-statistic">
								<div class="card-body p-0">
									<div class="d-flex flex-column">
										<div class='px-3 py-3 d-flex justify-content-between'>
											<h3 class='card-title'>BALANCE</h3>
											<div class="card-right d-flex align-items-center">
												<p>$50</p>
											</div>
										</div>
										<div class="chart-wrapper">
											<canvas id="canvas1" style="height: 100px !important"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<div class="card card-statistic">
								<div class="card-body p-0">
									<div class="d-flex flex-column">
										<div class='px-3 py-3 d-flex justify-content-between'>
											<h3 class='card-title'>Revenue</h3>
											<div class="card-right d-flex align-items-center">
												<p>$532,2</p>
											</div>
										</div>
										<div class="chart-wrapper">
											<canvas id="canvas2" style="height: 100px !important"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<div class="card card-statistic">
								<div class="card-body p-0">
									<div class="d-flex flex-column">
										<div class='px-3 py-3 d-flex justify-content-between'>
											<h3 class='card-title'>ORDERS</h3>
											<div class="card-right d-flex align-items-center">
												<p>1,544</p>
											</div>
										</div>
										<div class="chart-wrapper">
											<canvas id="canvas3" style="height: 100px !important"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<div class="card card-statistic">
								<div class="card-body p-0">
									<div class="d-flex flex-column">
										<div class='px-3 py-3 d-flex justify-content-between'>
											<h3 class='card-title'>Sales Today</h3>
											<div class="card-right d-flex align-items-center">
												<p>423</p>
											</div>
										</div>
										<div class="chart-wrapper">
											<canvas id="canvas4" style="height: 100px !important"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-8">
							<div class="card">
								<div class="card-header">
									<h3 class='card-heading p-1 pl-3'>Sales</h3>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-4 col-12">
											<div class="pl-3">
												<h1 class='mt-5'>$21,102</h1>
												<p class='text-xs'>
													<span class="text-green"><i data-feather="bar-chart" width="15"></i> +19%</span> than last month
												</p>
												<div class="legends">
													<div class="legend d-flex flex-row align-items-center">
														<div class='w-3 h-3 rounded-full bg-info mr-2'></div>
														<span class='text-xs'>Last Month</span>
													</div>
													<div class="legend d-flex flex-row align-items-center">
														<div class='w-3 h-3 rounded-full bg-blue mr-2'></div>
														<span class='text-xs'>Current Month</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-8 col-12">
											<canvas id="bar"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header d-flex justify-content-between align-items-center">
									<h4 class="card-title">오늘의 공지사항</h4>
									<div class="d-flex ">
										<i data-feather="download"></i>
									</div>
									ㄴ
								</div>
								<div class="card-body px-0 pb-0">
									<div class="table-responsive">
										<table class='table mb-0' id="table1">
											<thead>
												<tr>
													<th>숫자</th>
													<th>제목</th>
													<th>내용</th>
													<th>작성자</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="b" items="${blist}">
													<tr>
														<td>${b.sBno}</td>
														<td>${b.sTitle}</td>
														<td>${b.sContent}</td>
														<td>${b.sWriter}</td>
														<td><fmt:formatDate value="${b.sDate}" pattern="yyyy년 MM월 dd일 " /></td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card ">
								<div class="card-header">
									<h4>Your Earnings</h4>
								</div>
								<div class="card-body">
									<div id="radialBars"></div>
									<div class="text-center mb-5">
										<h6>From last month</h6>
										<h1 class='text-green'>+$2,134</h1>
									</div>
								</div>
							</div>
							<div class="card widget-todo">
								<div class="card-header border-bottom d-flex justify-content-between align-items-center">
									<h4 class="card-title d-flex">
										<i class='bx bx-check font-medium-5 pl-25 pr-75'></i>Progress
									</h4>

								</div>
								<div class="card-body px-0 py-1">
									<table class='table table-borderless'>
										<tr>
											<td class='col-3'>UI Design</td>
											<td class='col-6'>
												<div class="progress progress-info">
													<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
											<td class='col-3 text-center'>60%</td>
										</tr>
										<tr>
											<td class='col-3'>VueJS</td>
											<td class='col-6'>
												<div class="progress progress-success">
													<div class="progress-bar" role="progressbar" style="width: 35%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
											<td class='col-3 text-center'>30%</td>
										</tr>
										<tr>
											<td class='col-3'>Laravel</td>
											<td class='col-6'>
												<div class="progress progress-danger">
													<div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
											<td class='col-3 text-center'>50%</td>
										</tr>
										<tr>
											<td class='col-3'>ReactJS</td>
											<td class='col-6'>
												<div class="progress progress-primary">
													<div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
											<td class='col-3 text-center'>80%</td>
										</tr>
										<tr>
											<td class='col-3'>Go</td>
											<td class='col-6'>
												<div class="progress progress-secondary">
													<div class="progress-bar" role="progressbar" style="width: 65%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</td>
											<td class='col-3 text-center'>65%</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- Bordered table end -->
			<jsp:include page="footerbar.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>
