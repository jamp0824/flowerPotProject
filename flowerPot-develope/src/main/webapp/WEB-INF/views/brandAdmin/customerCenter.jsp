<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">고객센터</h4>
			<div class="ml-auto text-right">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">고객센터</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title my-3">카테고리</h5>
					<form action="#">
						<select name="category" aria-controls="zero_config" class="form-control form-control-sm border-gray" onchange="return selectCosmetic(this);">
							<option selected="selected">카테고리...</option>
							<option value="1">공지사항</option>
							<option value="2">FAQ</option>
							<option value="3">1대1문의</option>
						</select>
					</form>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="zero_config" class="table table-striped table-bordered dataTable" role="grid" aria-describedby="zero_config_info">
							<thead>
								<tr role="row">
									<th>화장품이름</th>
									<th>카테고리</th>
									<th>댓글제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성날짜</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
							<ul class="pagination justify-content-center">
								<li class="paginate_button page-item previous disabled" id="zero_config_previous">
									<a href="#" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
								</li>
								<li class="paginate_button page-item active">
									<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">1</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="zero_config" data-dt-idx="2" tabindex="0" class="page-link">2</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="zero_config" data-dt-idx="3" tabindex="0" class="page-link">3</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="zero_config" data-dt-idx="4" tabindex="0" class="page-link">4</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="zero_config" data-dt-idx="5" tabindex="0" class="page-link">5</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="zero_config" data-dt-idx="6" tabindex="0" class="page-link">6</a>
								</li>
								<li class="paginate_button page-item next" id="zero_config_next">
									<a href="#" aria-controls="zero_config" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
								</li>
							</ul>
						</div>
						<div class="dataTables_info text-center" id="zero_config_info" role="status" aria-live="polite" >Showing 1 to 10 of 57 entries</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function selectCosmetic(selectBox) {
		$('form').submit();
	}
</script>

<jsp:include page="footer.jsp"></jsp:include>