<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
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
		<a class="navbar-brand" href="${pageContext.request.contextPath}">이벤트</a>
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
	<!-- content -->
	<div class="container-fluid">
		<h2 class="text-center my-3">이벤트 등록</h2>
		<form onsubmit="return false;">
			<!-- 회원번호 --> 
			<%-- <input type="hidden" name="mno"  --%>
			
			<div class="form-group">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">섬네일 이미지</div>
				<div class="custom-file">
				  <input type="file" class="custom-file-input" id="sumnailImage" accept="image/gif,image/jpeg,image/png">
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
			
			<!-- title -->
			<div class="mb-3">
				<label for="username">제목</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" id="title" name="title" placeholder="Username" required="">
					<div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
				</div>
			</div>
			<!-- /title -->
			<!-- 내용 -->
			<div class="mb-2">
				<textarea id="summernote" class="content" name="content"></textarea>
			</div>
			<!-- 제출 -->
			<div class="text-center">
				<input type="submit" class="btn btn-primary submit-button" value="등록">
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		var attachFileList = new Object();
		var attachFileVoArray = new Array();
		var attachFileVo = new Object();
		
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : 600, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			fontNames: ['fontA',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		    fontNamesIgnoreCheck: ['fontA'],
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
					attachFileVoArray.push(data.attach);
					console.log(attachFileVoArray);
					$(editor).summernote('insertImage', data.url);
				}
			});
		}
		
$(document).ready(function () {
	    	
	    	// 제출될때 이벤트 발생
	        $('.submit-button').click(function () {
		        // 제목 유효성 검증
		        if($('#title').val()==''){
		        	alert('제목을 입력해주세요');
		        	return false;
	        	}

		        var title = $('#title').val();
		        var content= $('.content').val();
		        var mappingURL = attachFileVo.mappingURL;
		        
		        //폼 태그도 ajax로 보내야함;; 그리고 다 되었으면 다시 ajax로 보내고,, 그리고 location.href로 이동
                var data = {'title':title, 'content':content, 'mappingURL':mappingURL};
                console.log(data);
               
                $.ajax({
                    data: data,
                    type: 'POST',
                    dataType: 'html',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    url: "${pageContext.request.contextPath}/event/event_write_ok",
                    success: function (data) {
						
                        data *= 1; // eno 숫자타입으로 만들기

                        for (var i = 0; i < attachFileVoArray.length; i++) {
                        	attachFileVoArray[i].eno = data;
                        }
                        console.log(attachFileVoArray);

                        $.ajax({
                                data: JSON.stringify(attachFileVoArray),
                                type: 'POST',
                                dataType: 'html',
                                contentType: 'application/json; charset=UTF-8',
                                url: "${pageContext.request.contextPath}/event/eventAttachInsert",
                                success: function (data) {
                                    console.log(data);
                                    if (data == "success") {
                                    	window.location.href='${pageContext.request.contextPath}/event/event';
                                    } else {
                                    	swal('fail','등록이 되지 않았습니다','fail');
                                    }
                                }
                            }); // end ajax
                    } // end success function
                }); // end ajax	  	
		        	
	        });
	    	
	    	// 섬네일 이미지 작업
	    	
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
	    		console.log(files);
	    		
	    		formdata.append('file',files[0]);
	    		/*
	    		for(var i=0; i<files.length ; i++){
	    			fileSizeCheck(files[i]);
	    			console.log(files[i]);
	    			if(imageFileCheck(files[i])==false){
	    				return false;
	    			}
	    			formdata.append('file',files[i]);   // name은 키값인가?
	    		}*/
	    		
	    		$.ajax({
	    			url: '${pageContext.request.contextPath}/sumnailImageFileUpLoad', // 클라이언트가 요청을 보낼 서버의 URL 주소
	    			processData : false,   // 이 두개를 반드시 false로 해야한다고함.. 이유는 모름
	    			contentType : false, 
	    			data: formdata,        // HTTP 요청과 함께 서버로 보낼 데이터
	    			type: 'POST',          // HTTP 요청 방식(GET, POST)
	    			dataType: 'json',      // 호출 했을 때 결과타입
	    			success : function(data) {
	    				console.log(data)
	    				
	    				if($('.image-list li').get(0)!=0){
	    					$('.image-list li').remove();  // li 태그 삭제
	    					// 실제 파일도 삭제처리해주면 좋을듯
	    				}
	    				attachFileVo = data[0];
	    				console.log(attachFileVo);
	    					
	    				for(var i=0; i<data.length; i++){
	    					attachFileVoArray.push(data[i]);
	    					console.log("파일 선택후 ")
	    					console.log(attachFileVoArray);
	    					$li = $('<li class="list-group-item" style="padding-top: 5px; padding-bottom: 5px;">'+data[i].originalFileName+' </li>')
	    					$('.image-list').append($li);
	    				}
	    			}
	    		});
	    	});
	    });
		
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : 600, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			fontNames: ['fontA',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		    fontNamesIgnoreCheck: ['fontA'],
			placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
			callbacks : { //여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				}
			}
		});
		
	</script>
	
	<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
</body>
</html>
