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
			<h4 class="card-title my-2">쿠폰 등록</h4>
			<form action="${initParam.cpath }/lastAdmin/couponRegister" >
				<div class="form-row pb-3">
					<div class="col-md-4 mb-3">
						<label for="validationDefault01">쿠폰이름</label>
						<input type="text" name="couponName" class="form-control border-gray" id="validationDefault01" placeholder="쿠폰이름을 입력해주세요"  required>
					</div>
					<div class="col-md-4 mb-3">
						<label for="validationDefault02">쿠폰 할인율</label>
						<input type="number" name="discountPercent" class="form-control border-gray" id="validationDefault02" placeholder="쿠폰 할인율" value="0"  required>
					</div>
					<div class="col-md-4 mb-3">
						<label for="validationDefault02">쿠폰 할인액</label>
						<input type="number" name="discountMoney" class="form-control border-gray" id="validationDefault02" placeholder="쿠폰 할인액" value="0" required>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-6 mb-3">
						<label for="validationDefault03">시작일</label>
						<input type="date" name="startDate" class="form-control border-gray" id="validationDefault03" placeholder="시작일" required>
					</div>
					<div class="col-md-6 mb-3">
						<label for="validationDefault04">종료일</label>
						<input type="date" name="endDate" class="form-control border-gray" id="validationDefault04" placeholder="종료일" required>
					</div>
				</div>
				<div>
					<button class="btn btn-primary float-right" type="submit">쿠폰 등록</button>
				</div>
				
			</form>
		</div>
	</div>
	<hr />
	<div class="card">
		<div class="card-body">
			<h4 class="my-2">쿠폰 목록</h4>
			<table class="table">
				<thead>
					<tr>
						<th>쿠폰이름</th>
						<th>할인액</th>
						<th>할인률</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>회원발급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="coupon" items="${cplist }">
						<tr>
							<th>${coupon.couponName }</th>
							<th>${coupon.discountMoney }원</th>
							<th>${coupon.discountPercent }%</th>
							<th>${coupon.start_date }</th>
							<th>${coupon.end_date }</th>
							<th>
								<!-- Button trigger modal -->
								<button type="button" data-couno="${coupon.couNo }" class="btn btn-primary coupon-button" data-toggle="modal" data-target="#exampleModal">쿠폰 발급</button>
							</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">쿠폰 발급</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form>
				<div class="modal-body">
					<div class="form-row mb-3">
						<div class="col-6">
							<div class="custom-control custom-radio">
								<input type="radio" id="kinds" name="kinds" class="kinds custom-control-input" value="1">
								<label class="custom-control-label" for="kinds">모든회원</label>
							</div>
						</div>
						<div class="col-6">
							<div class="custom-control custom-radio">
								<input type="radio" id="kinds2" name="kinds" class="kinds custom-control-input" value="2">
								<label class="custom-control-label" for="kinds2">특정회원</label>
							</div>
						</div>
					</div>
					
					<div class="row member-search" style="padding: 1rem; border-top: 1px solid #e9ecef; display: none;">
						<div class="col-12">
							<h6 >사용자아이디 검색</h6>
							<div class="input-group	">
								<input type="text" class="form-control member-id" placeholder="사용자아아디" aria-label="Recipient's username" aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button" id="member-add-button">추가</button>
								</div>
								<div>
							      
							    </div>
							</div>
						</div>
						<div class="col-12">
							<ul class="list-group mt-3 member-list">
							</ul>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="last-button">쿠폰발급</button>
			</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus');
	});
	
	$(document).ready(function() {
		var memberArray = new Array();
		var couNo=0;
		var kinds;
		
		$('.coupon-button').click(function() {
			couNo = $(this).data('couno');
			console.log(couNo);
		});
		
		$('.kinds').change(function() {
		    var valueCheck = $('.kinds:checked').val();
		    console.log(valueCheck);
		    
		    if(valueCheck==1){
		    	kinds = 1;
		    	$('.member-search').hide();
		    }else{
		    	kinds = 2;
		    	$('.member-search').show();
		    }
		});
		
		
		// 아이디 검증
		$('.member-id').change(function(){
			var id = $('.member-id').val();
			console.log(id);
			$.ajax({
				type: "POST",
				url: "${initParam.cpath}/lastAdmin/isMember", 
				data: {'id' : id}, 
				
				success: function(data) { 
					console.log(data); 
					if(data=='exist'){
						console.log($('.member-id').next().get(0));
						$('.member-id').attr('class','form-control member-id is-valid');
						$('.member-id').next().next().attr('class','valid-feedback');
						$('.member-id').next().next().html('존재하는 아이디');
					}else{
						console.log($('.member-id').next());
						$('.member-id').attr('class','form-control member-id is-invalid');
						$('.member-id').next().next().attr('class','invalid-feedback');
						$('.member-id').next().next().html('존재하지 않는 아이디');
					}
					// 존재하지 않는 아이디입니다
				}
			});
		});
		
		$('#member-add-button').click(function() {
			var id = $('.member-id').val();
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath }/lastAdmin/memberAdd", 
				data: {'id' : id}, 
				dataType : 'html',
				success: function(data) { 
					console.log(data);
					if(data!=null){
						// 아이디가 존재할때
						memberArray.push(data.mno);
						$('.member-list').append($('<li data-mno="'+data.mno+'" class="list-group-item">'+id+'</li>'))
						$('.member-id').val('');
					}else{
						// 아이디가 존재 X
						swal({
							  text: "존재하지 않는 아이디입니다",
						});
						$('.member-id').val('');
					}
				}
			});
		});
		
		// 클릭시 쿠폰 발급
		$('#last-button').click(function () {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath }/lastAdmin/couponDeploy", 
				data: JSON.stringify({'memberArray': memberArray, 'couNo' : couNo, 'kinds': kinds}),
				dataType : 'html',
				contentType: "application/json",
				success: function(data) { 
					if(data=='success'){
						$('#myModal').modal('hide');
						swal({
							 icon: "success",
							 text: "발급성공",
						});
						
						for(var i=0; memberArray.length; i++){
							memberArray.pop();
						}
						console.log(memberArray);
						
					}else{
						$('#myModal').modal('hide');
						swal({
							 icon: "warning",
							 text: "발급실패",
						});
						
					}
				}
			});
		});
		
	});
	
	
</script>

<jsp:include page="footer.jsp"></jsp:include>