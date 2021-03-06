<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>enneagram</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css">  -->
</head>
<body>

	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-color: #efbbcf; padding: 2px;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">FlowerPot</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}"> Home<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Test</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="portfolio.html"
					id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">????????????</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="${pageContext.request.contextPath}/board/boardList"
					id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">?????????</a></li>

				<li class="nav-item"><a href="contact.html" class="nav-link">?????????
						??????</a></li>
			</ul>
		</div>
	</nav>
	<!-- /nav -->

	<!-- content -->
	<div class="container-fluid">
		
			<h2 class="text-center my-3">????????? ??????</h2>
			<form action="${pageContext.request.contextPath}/magazine/magazine_writer_ok" method="post" enctype="multipart/form-data">
				<%-- <input type="hidden" name="mno" value="${login.mno }"> --%>

				<!-- ???????????? -->
					<div class="mb-3">
						<label for="country">????????????</label> 
						<select class="custom-select d-block w-100" id="country" name="category" required="">
							<option value="">Choose...</option>
							<option value="TIP">TIP</option>
							<option value="?????????">?????????</option>
							<option value="COVID19">COVID19</option>
						</select>
						<div class="invalid-feedback">Please select a valid country.
						</div>
					</div>
				<!-- /???????????? -->
				
				<!-- ????????? ????????? ?????? -->
				<div class="form-group">
				    <label for="exampleFormControlFile1">????????? ????????? </label>
				    <input type="file" name="imgFile" class="form-control-file" id="exampleFormControlFile1">
				</div> 

				<!-- title -->
				<div class="mb-3">
					<label for="username">??????</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">??????</span>
						</div>
						<input type="text" class="form-control" id="username" name="title" placeholder="Username" required="">
						<div class="invalid-feedback" style="width: 100%;">Your
							username is required.</div>
					</div>
				</div>
				<!-- /title -->

				<!-- ?????? -->
				<div class="mb-2">
					<textarea id="summernote" name="content"></textarea>
				</div>

				<!-- ?????? -->
				<div class="text-center">
					<input type="submit" class="btn btn-primary" value="??????">
				</div>
				
			</form>

	
	</div>


	<script type="text/javascript">
		$('#summernote').summernote({
			height : 300, // ????????? ??????
			minHeight : 600, // ?????? ??????
			maxHeight : null, // ?????? ??????
			focus : true, // ????????? ????????? ???????????? ????????? ??????
			lang : "ko-KR", // ?????? ??????
			fontNames: ['fontA',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		    fontNamesIgnoreCheck: ['fontA'],
			placeholder : '?????? 2048????????? ??? ??? ????????????', //placeholder ??????
			callbacks : { //?????? ????????? ???????????? ???????????? ??????
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				}
			}
		});

		/**
		 * ????????? ?????? ?????????
		 */
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
				contentType : false,
				processData : false,
				success : function(data) {
					//?????? ???????????? ????????? url??? ????????? ??????.
					console.log(data);
					$(editor).summernote('insertImage', data.url);
				}
			});
		}
		
	</script>



</body>
</html>
