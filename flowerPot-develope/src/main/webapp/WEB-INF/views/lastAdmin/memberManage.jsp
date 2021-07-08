<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">쿠폰관리</h4>
			<div class="ml-auto text-right">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">쿠폰관리</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<form action="${initParam.cpath }/lastAdmin/memberManage" id="pageAndSearchFrom">
			<div class="row">
				<div class="col-6">
					<h4 class="my-2">회원 목록</h4>
				</div>
				<div class="col-6">
					<div class="form-row">
						<input type="hidden" id="pageNum" name="pageNum" value="${myCriteria.pageNum }">
						<div class="col-2" style="padding: 0;">
							<select class="custom-select border-gray" name="searchCategory">
								<option selected disabled="disabled">검색</option>
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="nickname">닉네임</option>
							</select>
						</div>
						<div class="col-8" style="padding: 0;">
							<input type="text" class="form-control border-gray" placeholder="검색할 내용" name="searchName">
						</div>
						<div class="col-2" style="padding: 0;">
							<input type="submit" class="btn btn-primary border-gray" value="검색" placeholder="Zip">
						</div>
					</div>
				</div>
			</div>
			<table class="table mt-3">
				<thead>
					<tr>
						<th>회원아이디</th>
						<th>회원이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>권한목록</th>
						<th>권한부여</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${mList }">
						<tr>
							<th>${member.id }</th>
							<th>${member.name }</th>
							<th>${member.nickname }</th>
							<th>${member.email }</th>
							<th>${member.tel }</th>
							<th>
							<c:forEach var="auth" items="${member.authList }">
								<c:if test="${auth.authority == 'ROLE_USER' }"><button type="button" class="btn btn-info btn-sm my-1">회원</button></c:if>
								<c:if test="${auth.authority == 'ROLE_MAGAZINE' }"><button type="button" class="btn btn-info btn-sm my-1">매거진</button></c:if>
								<c:if test="${auth.authority == 'ROLE_BRAND' }"><button type="button" class="btn btn-info btn-sm my-1">브랜드</button></c:if>
								<c:if test="${auth.authority == 'ROLE_ADMIN' }"><button type="button" class="btn btn-info btn-sm my-1">관리자</button></c:if>
							</c:forEach>						
							</th>
							<th>
								<!-- Button trigger modal -->
								<button type="button" data-id="${member.id }" data-mno="${member.mno }" class="btn btn-primary authority-button" data-toggle="modal" data-target="#exampleModal">권한부여</button>
							</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
				<ul class="pagination justify-content-center">
					<c:if test="${myCriteria.prev == true}">
						<li class="paginate_button page-item previous disabled" id="zero_config_previous">
						<a href="#" aria-controls="zero_config" data-pagenum="${myCriteria.startNum - 1 }" data-dt-idx="0" tabindex="0" class="page-link" onclick="return pageSubmit(this);">Previous</a>
					</li>
					</c:if>
					
					<c:forEach var="n" begin="${myCriteria.startNum }" end="${myCriteria.endNum }">
						<c:if test="${myCriteria.pageNum == n }">
							<li class="paginate_button page-item active">
							<a href="#" aria-controls="zero_config" data-pagenum="${n }" data-dt-idx="${n }" tabindex="0" class="page-link" onclick="return pageSubmit(this);">${n }</a>
						</li>
						</c:if>
						<c:if test="${myCriteria.pageNum != n }">
							<li class="paginate_button page-item">
								<a href="#" aria-controls="zero_config" data-pagenum="${n }" data-dt-idx="${n }" tabindex="0" class="page-link" onclick="return pageSubmit(this);">${n }</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${myCriteria.next == true}">
					<li class="paginate_button page-item next" id="zero_config_next">
						<a href="#" aria-controls="zero_config" data-pagenum="${myCriteria.startNum + 10 }" data-dt-idx="7" tabindex="0" class="page-link" onclick="return pageSubmit(this);">Next</a>
					</li>
					</c:if>
				</ul>
			</div>
			</form>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">권한부여</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="${initParam.cpath }/lastAdmin/insertAuthority" id="authoritySubmit" >
				<div class="modal-body">
					<div class="row member-search" >
						<div class="col-12">
							<input type="hidden" id="mno" name="mno" value="">
							<input type="hidden" id="member-id" name="id" value="">
							<select class="custom-select my-3 border-gray" id="selectAuthority" name="authority">
								<option selected disabled="disabled">부여할 권한</option>
								<option value="ROLE_USER">회원</option>
								<option value="ROLE_MAGAZINE">매거진</option>
								<option value="ROLE_BRAND">브랜드관리자</option>
								<option value="ROLE_ADMIN">괸리자</option>
							</select>
							
							<select class="custom-select my-3 border-gray" id="selectBrand" name="brand" style="display: none;">
								<option selected disabled="disabled">브랜드목록</option>
								<c:forEach var="brand" items="${bList }">
									<option value="${brand.name }">${brand.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="last-button" >권한부여</button>
			</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus');
	});
	
	function pageSubmit(data) {
		console.log(data);
		console.log($(data).data('pagenum'));
		
		$('#pageNum').val($(data).data('pagenum'));
		$('#pageAndSearchFrom').submit();
	}

	$(document).ready(function() {
		var mno;
		var id;
	
		// 권한부여 버튼 클릭
		$('.authority-button').click(function() {
			mno = $(this).data('mno'); 
			id = $(this).data('id'); 
			console.log(mno);
			console.log(id);
		});
		
		$('#selectAuthority').change(function () {
			console.log($('#selectAuthority option:selected').val());
			if($('#selectAuthority option:selected').val()=='ROLE_BRAND'){
				$('#selectBrand').show();
			}else{
				$('#selectBrand').hide();
			}
		});
		
		// 최종  버튼 클릭
		$('#last-button').click(function() {
			$('#mno').val(mno);
			$('#member-id').val(id);
			$('#authoritySubmit').submit();
		});
	});
	
	
</script>

<jsp:include page="footer.jsp"></jsp:include>