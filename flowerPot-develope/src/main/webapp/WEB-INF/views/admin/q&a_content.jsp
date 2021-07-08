<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="info/resources.jsp" />
<%--css,img,script등 정적자원 --%>

</head>
<body>
	<div class="wrapper">
		<!-- 사이드바 -->
		<jsp:include page="info/sidebar.jsp" />
		<%--사이드바 --%>

		<div class="main-panel">
			<!-- header(nav) -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand" href="#pablo"> 소통 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">Q & A</h4>
										</div>
										<div class="card-body">
											<div class="content">
												<div class="row">
													<div class="col-md-1">
														<div class="form-group">
															<label>번호</label>
															<text class="form-control">${qANDa.ccno}</text>
														</div>
													</div>
													<div class="col-md-11">
														<div class="form-group">
															<label>제목</label>
															<text class="form-control">${qANDa.title}</text>
														</div>
													</div>

												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>내용</label>
															<text class="form-control" style="height : 200px">${qANDa.content}</text>
														</div>
													</div>
												</div>
												<form action="${pageContext.request.contextPath}/admin/customer/q&a_modify" method="post">
													<input type="hidden" name="ccno" value="${qANDa.ccno}">
													<button type="submit" class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52; margin-left: 10px;">수정</button>
												</form>
												<button class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;" onclick="location='${pageContext.request.contextPath}/admin/customer/q&a/'">목록</button> &nbsp;
												<button class="btn btn-info btn-fill pull-left" style="background-color: #212b52; color: white; border: 1px solid #212b52;" onclick="location='${pageContext.request.contextPath}/comments/q&aComnt_write/${qANDa.ccno}'">답글</button>

												<div class="clearfix"></div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" id="CommentsInput">
									<div class="card">
										<div class="card-header">
											<button class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;" onclick="onDisplay();">내용보기</button>
											<h4 class="card-title">등록한 답변내용</h4>
										</div>
										<div class="card-body">
											<div class="content" id="comntCont" style="display: none">
												<c:forEach var="reply" items="${rList}">
												<form action="${pageContext.request.contextPath}/comments/q&aComnt_modify">
												<input type="hidden" name="rno" value="${reply.rno}">
													<div class="row">
														<div class="col-md-1">
															<div class="form-group">
																<label>답글번호</label>
																<text class="form-control">${reply.rno}</text>
															</div>
														</div>
														<div class="col-md-7">
															<div class="form-group">
																<label>제목</label>
																<text class="form-control">${reply.replytitle}</text>
															</div>
														</div>
														<div class="col-md-2">
															<div class="form-group">
																<label>등록날짜</label>
																<text class="form-control"> <fmt:formatDate  value="${reply.regdate}" pattern="yyyy년 MM월 dd일"/></text>
															</div>
														</div>
														<div class="col-md-2">
															<div class="form-group">
																<label>수정날짜</label>
																<text class="form-control"> <c:if test="${reply.updatedate!=null}"><fmt:formatDate  value="${reply.updatedate}" pattern="yyyy년 MM월 dd일"/></c:if>
																<c:if test="${reply.updatedate==null}">미수정</c:if>
																</text>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label>내용</label>
																<text class="form-control" style="height: 200px">${reply.replytext}</text>
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;">수정</button>
												</form>

												<div class="clearfix"></div>
													<hr style="border:1px dotted #a0a0a0;"/>
												</c:forEach>

											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="row" >
								<div class="col-md-8" id="CommentsOut" style="display: none;">
									<div class="card">
										<div class="card-header">
												<button class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;">닫기</button>
											<h4 class="card-title">xx번글 답변</h4>
										</div>
										<div class="card-body">
											<div class="content">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>내용</label>
															<b id="replyConent">
															<text class="form-control" style="height: 100px"></text>
															</b>
														</div>
													</div>
												</div>
												
												<button class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;" id="replyAddBtn">수정</button>
												<button class="btn btn-info btn-fill pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;" id="replyAddBtn">삭제</button>
												
												<div class="clearfix"></div>

											</div>
										</div>
									</div>
								</div>
							</div> -->
						</div>
					</div>
					<!-- 본문 끝 -->

					<!-- footer -->
					<jsp:include page="info/footer.jsp" />
					<%--푸터 --%>

				</div>
		</div>
</body>
<script>

function onDisplay() {
	if($("#comntCont").css("display") == "none"){
		$("#comntCont").show();
	}else{
		$("#comntCont").hide();
	}
}
function offDisplay() {
	$('#comntCont').hide();
}




/*
var ccno=${qANDa.ccno};

(function() {
	console.log('메롱');
	$.ajax({//jQuery 비동기식 아작스 함수
		type : 'get',//메서드 보내는 방식이 post
		url : '${pageContext.request.contextPath}/comments/all/'+ccno, //매핑주소
		headers : {
			"Content-Type" : "application/json"
		}, //HTTP 헤더에 추가되는 컨텐트 타입형식이 json이고,메서드방식이 POST
		dataType : 'json',//자료형식이 문자열
		success : function(entity) {
			//비동기식으로 가져오는 것이 성공시 호출되는 콜백함수,가져온 문자열은
			//result매개변수에 저장
				console.log(entity);
				if(entity == null){
					$("#comntWrite").html('<button class="btn btn-info btn-fill pull-left" id="comntWrite" style="background-color: #212b52; color: white; border: 1px solid #212b52;" onclick="onDisplay()">답글</button>');
				}else{
					$( 'p' ).remove( '.rm' );
				}
				$("#replyConent").html('<text class="form-control" style="height: 100px">'+entity.replytext+'</text>');
		}
	});
})();

$('#replyAddBtn').on("click", function() {
	//댓글등록 버튼을 클릭했을 때 실행
	var replyer = '관리자'//댓글작성자
	var replytext = $('#newReplyText').val();//댓글내용

	$.ajax({//jQuery 비동기식 아작스 함수
		type : 'post',//메서드 보내는 방식이 post
		url : '${pageContext.request.contextPath}/comments', //매핑주소
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST",
		}, //HTTP 헤더에 추가되는 컨텐트 타입형식이 json이고,메서드방식이 POST
		dataType : 'text',//자료형식이 문자열
		data : JSON.stringify({
			ccno : ccno,
			replyer : replyer,
			replytext : replytext,
		//좌측변수 bno,replyer,replytext가 JSON의 키 이름이고, 이것이 ReplyVO빈 클래스의 변수명이 된다.
		}),//보내는 데이터가 JSON문자열
		success : function(result) {
			//비동기식으로 가져오는 것이 성공시 호출되는 콜백함수,가져온 문자열은
			//result매개변수에 저장
			if (result == 'SUCCESS') {
				alert('댓글이 등록되었습니다!');
				$('#CommentsInput').hide();
				$.ajax({//jQuery 비동기식 아작스 함수
					type : 'get',//메서드 보내는 방식이 post
					url : '${pageContext.request.contextPath}/comments/all/'+ccno, //매핑주소
					headers : {
						"Content-Type" : "application/json"
					}, //HTTP 헤더에 추가되는 컨텐트 타입형식이 json이고,메서드방식이 POST
					dataType : 'json',//자료형식이 문자열
					success : function(entity) {
						//비동기식으로 가져오는 것이 성공시 호출되는 콜백함수,가져온 문자열은
						//result매개변수에 저장
							console.log(entity);
							$("#replyConent").html('<text class="form-control" style="height: 100px">'+entity.replytext+'</text>');
					}
				});
				$('#CommentsOut').show();
			}
		}
	});
}); */



</script>
</html>