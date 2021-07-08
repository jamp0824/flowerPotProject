<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>enneagram</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css">  -->
</head>
<body>
	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #efbbcf; padding: 2px;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">FlowerPot</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<!-- home -->
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}">
						Home<span class="sr-only">(current)</span>
					</a></li>
				<!-- category -->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/product/product" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</a></li>
				<!-- 매거진 -->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/magazine/magazine" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">매거진</a></li>
				<!-- 오늘의 추천 -->
				<li class="nav-item"><a href="contact.html" class="nav-link">오늘의 추천</a></li>
				<!-- 이벤트 -->
				<li class="nav-item"><a href="contact.html" class="nav-link">이벤트</a></li>
				<!-- 이벤트 -->
				<li class="nav-item"><a href="${pageContext.request.contextPath}/semiadmin/dashboard" class="nav-link">브랜드 관리자</a></li>
			</ul>
		</div>
	</nav>
	<!-- /nav -->
	<!-- content -->
	<div class="container-fluid p-b-85" style="padding: 0 300px;" >
		<h2 class="text-center my-5">화장품 등록  </h2>
		<form class="cosmetic-form" action="${pageContext.request.contextPath}/cosmetic/cosmetic_register_ok" method="post" enctype="multipart/form-data" onsubmit="return false;">
			<!-- 화장품 타입, 화장품 브랜드 -->
			<div class="row">
				<%-- <input type="hidden" name="mno" value="${login.mno }"> --%>
				<div class="col">
					<!-- 타입 -->
					<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">타입</div>
					<select class="custom-select d-block w-100" id="type" name="type" onchange="return changeType();">
						<option value="">1차 카테고리 목록</option>
						<c:forEach var="type" items="${tList }">
							<option value="${type.type }">${type.type }</option>
						</c:forEach>
					</select>
					<div class="invalid-feedback">Please select a valid country.</div>
				</div>
				<div class="col">
					<!-- 서브타입 -->
					<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">서브타입</div>
					<select class="custom-select d-block w-100" id="sub_type" name="sub_type" >
						<option value="">2차 카테고리 목록</option>
					</select>
					<div class="invalid-feedback">Please select a valid country.</div>
				</div>
				<div class="col">
					<!-- 브랜드 -->
					<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">브랜드</div>
					<select class="custom-select d-block w-100" id="brand" name="brand" required="">
						<option value="">브랜드 목록</option>
						<c:forEach var="brand" items="${bList }">
							<option value="${brand.name }">${brand.name }</option>
						</c:forEach>
					</select>
					<div class="invalid-feedback">Please select a valid country.</div>
				</div>
				<div class="col">
					<!-- 피부타입 -->
					 <div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">피부타입</div>
					 <select class="custom-select d-block w-100" id="skinType" name="skinType" required="">
						<option value="">피부타입</option>
						<option value="지성">지성</option>
						<option value="건성">건성</option>
						<option value="복합성">복합성</option>
					</select>
					<div class="invalid-feedback">Please select a valid country.</div>
				</div>
			</div>
			<!-- /카테고리 -->
			
			
			<!-- 섬네일 이미지 등록 -->
			<div class="form-group">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">섬네일 이미지</div>
				<div class="custom-file">
				  <input type="file" class="custom-file-input" id="sumnailImage" multiple="multiple" accept="image/gif,image/jpeg,image/png">
				  <label class="custom-file-label" for="sumnailImage">이미지 파일 첨부</label>
				</div>
				<ul class="image-list list-group my-2">
					 <!-- <li class="list-group-item" style="padding-top: 5px; padding-bottom: 5px;">파일목록
					 <button class="float-right x-button border-0" onclick="return deleteButton();" style="background-color: #fff;">
					 <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg>
					</button>
					 </li> -->
				</ul>
			</div>
			<!-- 이름 -->
			<div class="mb-3">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">화장품 이름</div>
				<div class="input-group">
					
					<input type="text" class="form-control" id="name" name="name" placeholder="화장품 이름을 입력하세요" required="">
					<div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
				</div>
			</div>
			<!-- /이름 -->
			<!-- 내용 -->
			
			<div class="mb-2">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">화장품 소개 내용</div>
				<textarea id="summernote" class="content" name="content"></textarea>
			</div>
			
			<!-- 상품 상세설명 -->
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						 <div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">가격</div>
						<input type="number" class="form-control" id="price" name="price" placeholder="가격을 입력하세요">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						 <div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">용량</div> 
						<input type="number" class="form-control" id="capacity" name="capacity" placeholder="용량을 입력해주세요(ml 단위)" aria-describedby="emailHelp"> 
						<small id="emailHelp" class="form-text text-muted"></small>
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						 <div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">기간</div>
						<input type="number" class="form-control" id="period" name="period" placeholder="기간을 입력해주세요(일 단위)" aria-describedby="emailHelp"> 
						<small id="emailHelp" class="form-text text-muted"></small>
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						 <div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">국가</div>
						<input type="text" class="form-control" id="nation" name="nation" aria-describedby="emailHelp" placeholder="제조국을 입력해주세요"> 
						<small id="emailHelp" class="form-text text-muted"></small>
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						 <div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">사용방법</div>
						<input type="text" class="form-control" id="useMethod" name="useMethod" placeholder="사용방법을 입력해주세요" aria-describedby="emailHelp"> 
						<small id="emailHelp" class="form-text text-muted"></small>
					</div>
				</div>
				<div class="col-12">
					<input type="submit" class="cosmetic-register-button btn btn-secondary btn-lg btn-block" value="등록" style="height: 50px;">
				</div>
				
			</div>
			<!-- /상품 상세설명 -->
		</form>
	</div>
	
	<div style="height: 300px;">
	</div>
	
<script type="text/javascript">
console.log(''===null);
console.log(''==null);

		$('#summernote').summernote(
				{
					height : 300, // 에디터 높이
					minHeight : 600, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					fontNames : [ 'fontA', 'Arial', 'Arial Black',
							'Comic Sans MS', 'Courier New', ],
					fontNamesIgnoreCheck : [ 'fontA' ],
					placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
					callbacks : { //여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0], this);
						}
					}
				});

		/**
		 * 이미지 파일 업로드
		 */
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${pageContext.request.contextPath}/uploadSummernoteImageFile2",
				contentType : false,
				processData : false,
				success : function(data) {
					//항상 업로드된 파일의 url이 있어야 한다.
					console.log(data);
					attachList.push(data.attach);
					console.log(attachList);
					
					$(editor).summernote('insertImage', data.url);
				}
			});	
		}
		
// 첨부파일 리스트
var attachList = new Array();
		
// 첨부파일삭제
function deleteButton(data) {
	console.log(data);
	var realName=$(data).data('realname');
	console.log(realName); 
	alert('성공'); 
	// 어짜피 한번할떄마다 하나만 삭제
	for(var i=0; data.length; i++){
		if(attachList[i].realName==realName){
			
			attachList.pop(i);
			$.ajax({
				type: "POST", 
				url: "${pageContext.request.contextPath}/deleteSumnailImage", 
				data: attachList[i], 
				success: function(data) { 
					console.log(data); 
					
				}
			});
		}
	}
	$(data).parent().remove();
	console.log(attachList);
}

		
$(document).ready(function () {
	$('#name').on('blur',function() {
		
		$.ajax({
			url: '${pageContext.request.contextPath}/cosmetic/isexistName',
			data: {'name': $('#name').val()},       
			type: 'POST',          
			dataType: 'html',     
			success : function(data){
				console.log(data);
				if(data=='no'){
					
				}else{
					alert('중복된 이름입니다');
					$('#name').val('');
				}
			}
		});
	});
	
	// 파일 용량 체크
	function fileSizeCheck(file) {
		if(file.size>20971520){ // 20MB
			alert('20MB이상 첨부 불가능');
			return false; 
		}  
	}
	// 이미지 파일 체크
	function imageFileCheck(obj) {
		var pathpoint = obj.name.lastIndexOf('.');
		var filepoint = obj.name.substring(pathpoint+1,obj.lengh);
		var filetype = filepoint.toLowerCase();
		if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
			// 정상상황
		}else{
			alert('이미지파일만 선택할수 있습니다');
			return false;
		}
	}
	
	// 파일 선택시 호출됨 -> upload폴더에 파일 저장 및 파일HTML태그 추가
	$('#sumnailImage').change(function() {
		// console.log('change');  //// console.log(this.files); //// console.log(this.files[0]); //
		
		var files= this.files;
		var formdata = new FormData();
		for(var i=0; i<files.length ; i++){
			fileSizeCheck(files[i]);
			console.log(files[i]);
			if(imageFileCheck(files[i])==false){
				return false;
			}
			formdata.append('file',files[i]);   // name은 키값인가?
		}
		// console.log(formdata);  //// console.log(formdata.get('file'));  //
		$.ajax({
			url: '${pageContext.request.contextPath}/sumnailImageFileUpLoad', // 클라이언트가 요청을 보낼 서버의 URL 주소
			processData : false,   // 이 두개를 반드시 false로 해야한다고함.. 이유는 모름
			contentType : false, 
			data: formdata,        // HTTP 요청과 함께 서버로 보낼 데이터
			type: 'POST',          // HTTP 요청 방식(GET, POST)
			dataType: 'json',      // 호출 했을 때 결과타입
			success : function(data) {
				console.log(data)
				for(var i=0; i<data.length; i++){
					attachList.push(data[i]);
					console.log("파일 선택후 ")
					console.log(attachList);
					$li = $('<li class="list-group-item" style="padding-top: 5px; padding-bottom: 5px;">'+data[i].originalFileName+' <button data-realName='+data[i].realName+' data-uploadFolderPath='+data[i].uploadFolderPath+' class="float-right x-button border-0" onclick="return deleteButton(this);" style="background-color: #fff;"><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></button></li>')
					$('.image-list').append($li);
				}
				/* for(var i=0; i<AttachFileDTOList.length; i++){
					AttachFileDTOArray.push(AttachFileDTOList[i]);
				}
				// AttachFileDTO 객체를 받으면
				if(AttachFileDTOList!=null){
					attachFileAppend(AttachFileDTOList);
				}  */
			}
		});
	});
	
	// 전송버튼을 클릭했을때, ajax로 데이터 전송
	$('.cosmetic-register-button').click(function() {
		if(attachList.length == 0){
			alert('첨부파일을 첨부해주세요');
			return false;
		}
		
		var type = $('#type option:selected').val();
		if(type==''){
			alert('1차카테고리를 선택해주세요');
			return false;
		}
		//console.log(type);
		var sub_type = $('#sub_type option:selected').val();
		if(sub_type==''){
			alert('2차카테고리를 선택해주세요');
			return false;
		}
		console.log(sub_type);
		var brand = $('#brand option:selected').val();
		if(brand==''){
			alert('브랜드를 선택해주세요');
			return false;
		}
		//console.log(brand);
		var skinType = $('#skinType option:selected').val();
		if(skinType==''){
			alert('피부타입를 선택해주세요');
			return false;
		}
		//console.log(skinType);
		var price = $('#price').val();
		if(price==''){
			alert('가격를 입력해주세요');
			return false;
		}
		if(price<0){
			alert('가격은 음수값이 나올수 없습니다');
			return false;
		}
		//console.log(price);
		var name = $('#name').val();
		if(name==''){
			alert('상품이름을 입력해주세요');
			return false;
		}
		//console.log(name);
		var content = $('.content').val();
		if(content==''){
			alert('상품내용을 입력해주세요');
			return false;
		}
		//console.log(content);
		var capacity = $('#capacity').val();
		if(capacity==''){
			alert('용량을 입력해주세요');
			return false;
		}
		//console.log(content);
		if(capacity<0){
			alert('용량은 음수값이 나올수 없습니다');
			return false;
		}
		//console.log(capacity);
		var period = $('#period').val();
		if(period==''){
			alert('사용기간을 입력해주세요');
			return false;
		}
		if(period<0){
			alert('사용기간은 음수값이 나올수 없습니다');
			return false;
		}
		//console.log(period);
		var nation = $('#nation').val();
		if(nation==''){
			alert('제조국을 입력해주세요');
			return false;
		}
		//console.log(nation);
		var useMethod = $('#useMethod').val();
		if(useMethod==''){
			alert('사용방법을 입력해주세요');
			return false;
		}
		
		//console.log(useMethod);
		var formdata = {'type':type,'sub_type': sub_type,'brand':brand,'skinType':skinType,'price':price,'name':name
				,'content':content,'capacity':capacity,'period':period,'nation':nation,'useMethod':useMethod};
		console.log("formdata");
		console.log(formdata);
		
		var cno;
		// 화장품, 상세정보 등록 아작스
		$.ajax({
			url: '${pageContext.request.contextPath}/cosmetic/cosmeticRegister', // 클라이언트가 요청을 보낼 서버의 URL 주소
			data: formdata,        // HTTP 요청과 함께 서버로 보낼 데이터
			type: 'POST',          // HTTP 요청 방식(GET, POST)
			dataType: 'html',      // 호출 했을 때 결과타입
			success : function(data) {
				console.log("게시물번호");
				console.log(data);
				cno = Number(data);
				for(var i=0; i<attachList.length;i++){
					attachList[i].cno = cno;
				}
			}
		}).done(function() {
			
			console.log("attach리스트");
			console.log(attachList);
			// 첨부파일 등록 ajax
			$.ajax({
				url: '${pageContext.request.contextPath}/cosmetic/AttachRegister', // 클라이언트가 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(attachList),        // HTTP 요청과 함께 서버로 보낼 데이터
				type: 'POST',          // HTTP 요청 방식(GET, POST)
				dataType: 'html',      // 호출 했을 때 결과타입
				contentType: 'application/json',
				success : function(data) {
					if(data=='success'){
						alert('등록성공');
						location.href='${pageContext.request.contextPath}/semiadmin/inventory';
						
					}else{
						alert('등록실패');
					}
				}
			});
		});
	});
});
// /ready()	


// 1차 카테고리 변경시
function changeType() {
	var type = $("#type option:selected").val();
	
	$.ajax({
		url: '${pageContext.request.contextPath}/cosmetic/subTypeList',
		data : { 'type':type },
		type : 'POST',
		dataType: 'json',
		success : function(typeList) {
			console.log(typeList);
			$('#sub_type').html('');
			$('#sub_type').append($('<option value="">2차 카테고리 목록</option>'))
			for(var i=0; i<typeList.length; i++){
				$('#sub_type').append($('<option value="'+typeList[i].sub_type+'">'+typeList[i].sub_type+'</option>'));
			}
		}
	});
}
		
// 유효성검증, input타입에 모든 값이 들어가있는지
</script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

</body>
</html>
