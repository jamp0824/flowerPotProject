<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">주문관리</h4>
			<div class="ml-auto text-right">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="#">Home</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">주문관리</li>
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
					<h5 class="card-title my-3">상품선택</h5>
					<form action="${pageContext.request.contextPath }/brandAdmin/orderManage">
						<select name="cno" aria-controls="zero_config" class="form-control form-control-sm border-gray" onchange="return selectCosmetic(this);">
							<option selected="selected">상품별...</option>
							<c:forEach var="c" items="${cList }">
								<option value="${c.cno }">${c.name }</option>
							</c:forEach>
						</select>
					</form>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="zero_config" class="table table-striped table-bordered dataTable" role="grid" aria-describedby="zero_config_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">화장품이름</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">주문번호</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">회원아이디</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">회원이름</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending">배송상태</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending">주문상태</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">주문날짜</th>
									<th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">주문상태변경</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="op" items="${opList }">
									<tr role="row" class="odd">
										<td class="sorting_1">${op.cosmeticVo.name }</td>
										<td>${op.order_num }</td>
										<c:if test="${op.memberVo != null }">
											<td>${op.memberVo.id }</td>
											<td>${op.memberVo.name }</td>
										</c:if>
										<c:if test="${op.memberVo == null }">
											<td>비회원</td>
											<td>비회원</td>
										</c:if>
										<td>${op.deliver_state }</td>
										<td>${op.state }</td>
										<td>${op.regdate }</td>
										<td>
											<button type="button" class="btn btn-primary btn-sm">주문완료</button>
										</td>
									</tr>
								</c:forEach>
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