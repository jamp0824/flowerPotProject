<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style type="text/css">
.Enq {
	align-items: center;
}
</style>

</head>
<body >

	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #efbbcf; padding: 5 20px;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">고객센터</a>
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
				<li class="nav-item"><a href="${pageContext.request.contextPath}/event/event" class="nav-link">이벤트</a></li>
			</ul>
		</div>
	</nav>
	<!-- /nav -->
	
	
	<!-- start of content -->
	<div class="row" style="padding : 0 100px;">	
		<div class="col-12">
			<h2 class="text-center my-4">1:1 문의</h2>
		</div>
		<div class="col-12">
			<form action="#" method="post" enctype="multipart/form-data" onsubmit="return false;">
				<input type="hidden" id="mno" value="${memberVo.mno }" name="">
				<div>
					<h2 class="my-3"></h2>
	
					
					<input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title"  size="130">
					<textarea rows="20" cols="100" id="summernote" name="content" class="summernote"></textarea>
						
	
					<input type="submit" class="btn btn-outline-secondary btn-lg btn-block" value="확인" onclick="return check();">
					<!-- <a href="content" onclick="check()"; id="submitBtn">수정</a> -->
				</div>
			</form>
		</div>
	</div>
	
	<script>
		var url;
		// 유효성검증, 폼전송
		function check() {

			if ($.trim($("#title").val()) == "") {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;

			} else if ($.trim($("#summernote").val()) == "") {
				alert("내용을 입력해 주세요 ㅇㅅㅇ!");
				$("#title").focus();
				return false;

			} else {
				var text = confirm("작성하시겠습니까?");
				if (text) {
				const boardInfo = {
					title : $("#title").val(),//db에 저장할 게시판 제목
					content : $("#summernote").val(),// " 내용
					mno : $("#mno").val(),
					url : url,// " 이미지 파일 경로
					// email : "<c:out value='${login.email}'/>"// " 작성자 이메일
				};
				
				console.log(boardInfo);
							
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath }/customerCenter/write_ok", //controller mapping address
					headers : {
						"Content-Type" : "application/json"
					},//json형식으로 보내기
					data : JSON.stringify(boardInfo),//보낼 정보
					success : function() {
						window.location.replace("${pageContext.request.contextPath }/customerCenter/customerCenter?category=enquiry");//성공시 페이지 이동 괄호 안 controller mapping address
						}
					});
				}
			} 

		}

		$(document).ready(
			function() {
			$('#summernote').summernote({
				height : 500,
				MinHeight : 700,
				callbacks : { //여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
					uploadSummernoteImageFile(
					files[0], this);
					}
				}
			});
			
		// 이미지 파일 업로드
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "${pageContext.request.contextPath}/customerCenter/uploadSummernoteImageFile",
					contentType : false,
					processData : false,
					success : function(data) {
						console.log(data)
						//항상 업로드된 파일의 url이 있어야 한다.
						$(editor).summernote('insertImage',data.url);/* url을 이용해 summernote 작성란에 이미지가 보여지게 함  */
						url = data.url;
					}
				});
			}
		});
	</script>