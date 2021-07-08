<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">브랜드관리</h4>
			<div class="ml-auto text-right">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">브랜드관리</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title my-2">브랜드 등록</h4>
			<form action="${initParam.cpath }/lastAdmin/brandRegister_ok">
				<div class="form-row">
					<div class="col-md-4 mb-3">
						<label for="validationDefault01">브랜드이름</label>
						<input type="text" name="name" class="form-control" id="validationDefault01" placeholder="브랜드이름"  required>
					</div>
					<div class="col-md-4 mb-3">
						<label for="validationDefault02">회사명</label>
						<input type="text" name="company" class="form-control" id="validationDefault02" placeholder="회사명"  required>
					</div>
					<div class="col-md-4 mb-3">
						<label for="validationDefault02">전화번호</label>
						<input type="tel" name="tel" class="form-control" id="validationDefault02" placeholder="전화번호"  required>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-6 mb-3">
						<label for="validationDefault03">주소</label>
						<input type="text" name="roadAddr" class="form-control" id="validationDefault03" placeholder="주소" required>
					</div>
					<div class="col-md-6 mb-3">
						<label for="validationDefault04">이메일</label>
						<input type="email" name="email" class="form-control" id="validationDefault04" placeholder="이메일" required>
					</div>
				</div>
				<div>
					<button class="btn btn-primary float-right" type="submit">브랜드 등록</button>
				</div>
				
			</form>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h4 class="my-2">브랜드 목록</h4>
			<table class="table">
				<thead>
					<tr>
						<th>브랜드이름</th>
						<th>회사명</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="brand" items="${bList }">
						<tr>
							<th>${brand.name }</th>
							<th>${brand.company }</th>
							<th>${brand.tel }</th>
							<th>${brand.email }</th>
							<th>${brand.regDate }</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<script>
	function selectCosmetic(selectBox) {
		$('form').submit();
	}

	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
</script>
<jsp:include page="footer.jsp"></jsp:include>