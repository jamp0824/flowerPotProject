<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">상품수정</h4>
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
		<form action="${pageContext.request.contextPath}/brandAdmin/cosmeticUpdate_ok" class="form-horizontal" method="post" onsubmit="return cosmeticUpdateSubmit(this);">
			<input type="hidden" name="cno" value="${cosmetic.cno }">
			<input type="hidden" id="content" name="content" >
			<div class="card-body">
				<div class="form-group row">
					<label for="name" class="col-sm-3 text-right control-label col-form-label text-center">상품이름</label>
					<div class="col-sm-9">
						<input type="text" name="name" class="form-control" id="name" placeholder="상품이름을 입력해주세요" value="${cosmetic.name }">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="price" class="col-sm-3 text-right control-label col-form-label text-center ">가격</label>
					<div class="col-sm-9">
						<input type="number" name="price" class="form-control" id="price" placeholder="가격을 입력해주세요" value="${cosmetic.price }" min="0">
					</div>
				</div>
				<div class="form-group row">
					<label for="discountPersent" class="col-sm-3 text-right control-label col-form-label text-center">할인율</label>
					<div class="col-sm-9">
						<input type="number" name="discountPersent" class="form-control" id="discountPersent" placeholder="할인율을 입력해주세요" value="${cosmetic.discountPersent }"  min="0">
					</div>
				</div>
				<div class="form-group row">
					<label for="stockNumber" class="col-sm-3 text-right control-label col-form-label text-center">재고추가</label>
					<div class="col-sm-9">
						<input type="number" name="stockNumber" class="form-control" id="stockNumber" placeholder="추가재고를 입력해주세요" value="${cosmetic.stockNumber }"  min="0">
					</div>
				</div>
				<!-- 이미지 파일 첨부 -->
				<!-- <div class="form-group row">
					<label class="col-sm-3 text-center">이미지 파일 첨부</label>
					<div class="col-sm-9">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="validatedCustomFile" required="">
							<label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
							<div class="invalid-feedback">Example invalid custom file feedback</div>
						</div>
					</div>
				</div> -->
				
				<div id="editor-container" style="height: 500px;">
					${cosmetic.content }
				</div>		
			</div>
			<div class="border-top">
				<div class="card-body">
					<button type="submit" class="btn btn-primary btn-lg  float-right">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>


<!-- Include the Quill library -->
<!-- <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/brandAdmin/assets/libs/quill/dist/quill.min.js"></script> --%>
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
<!-- <script src="https://cdn.quilljs.com/1.3.6/quill.core.js"></script> -->

<script>
   var quill = new Quill('#editor-container', {
	   placeholder: '내용입력',
	   theme: 'snow'  // or 'bubble'
	 });
   
   	// submit 유효성 검증
	function cosmeticUpdateSubmit(form) {
   		console.log($('#name').val());
   		console.log($('.ql-editor').html());
   		console.log($('#price').val());
   		console.log($('#discountPersent').val());
   		console.log($('#stockNumber').val());
   		
   		
   		
		// 화장품 이름이 없거나, 같은 이름이 있을경우
   		if( $.trim($('#name').val()) == '' ) {
   			swal({
   				text : "상품이름을 입력해주세요",
   			 	icon : "warning"
   			});
   			return false;
   		}
		
   		// 가격이 0미만일 경우
   		if( $('#price').val() < 0 ) {
   			swal({
   				text : "가격에 0보다 작은숫자는 안되요!",
   				icon : "warning"
   			});
   			return false;
   		}
   		// 할인율이 0미만이거나 100초과일경우
   		if( $('#discountPersent').val() < 0 || $('#discountPersent').val() > 100 ) {
   			swal({
   				text : "할인율은 0과 100사이만 입력가능해요!",
   				icon : "warning"
   			});
   			return false;
   		}
   		// 재고추가에 0미만이 들어갈 경우
   		if( $('#stockNumber').val() < 0 ) {
   			swal({
   				text : "재고추가에 0보다 작은숫자는 안되요!",
   				icon : "warning"
   			});
   			return false;
   		}
   		
   		// 재고추가에 0미만이 들어갈 경우
   		if($.trim($('.ql-editor').html())=='' ) {
   			swal({
   				text : "내용을 입력해주세요",
   				icon : "warning"
   			});
   			return false;
   		}
   		
   		$('#content').val($('.ql-editor').html());
	}
</script>

<jsp:include page="footer.jsp"></jsp:include>