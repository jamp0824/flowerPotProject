<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>


<!DOCTYPE html>

<html lang="ko">
<head>
<jsp:include page="info/resources.jsp" />
<%--css,img,script등 정적자원 --%>

<script>
$(function() {
	$('#searchBtn').click(function(){
		console.log('검색버튼이 클릭됨!');
		let keyword = $('#keywordInput').val();
		console.log('검색어 : '+keyword);
		const condition = $('#condition option:selected').val();
		console.log('검색조건 : '+condition);
		location.href="${pageContext.request.contextPath}/admin/member?keyword="+keyword+"&condition="+condition;
	});
	
	$('#keywordInput').keydown(function(key){
		if(key.keyCode == 13){
			$('#searchBtn').click();
		}
	});
});
</script>
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
					<a class="navbar-brand" href="#pablo"> 회원 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card strpied-tabled-with-hover">
										<div class="card-header ">
											<h4 class="card-title" style="display: inline-block;">회원 목록</h4>
											<!-- 검색 기능 -->
											<div class="col-md-12 ">
												<div class="pull-right" style="text-align: right;">
													<div class="input-group pull-right" style="text-align: right !important;">
														<button class="btn btn-izone btn-flat authorize-button mr-3" id="popup_open_btn" data-toggle="modal" data-target="#myModal1"  style="background-color: #212b52; color: white; border:1px solid #212b52">권한</button>

														<select id="condition" class="y-form-control" name="condition" style="width: 100px;">
															<option value="mno">번호</option>
															<option value="id">ID</option>
															<option value="name">이름</option>
														</select>
														<input type="text" class="y-form-control " name="keyword" id="keywordInput" placeholder="검색어" style="width: 200px;">
														<span class="input-group-btn "> <input type="button" style="background-color: #212b52; color: white; display: inline-block;" value="검색" class="btn btn-izone btn-flat" id="searchBtn">
														</span>
													</div>
												</div>
											</div>
											<p class="card-category">부제</p>
										</div>
										<div class="card-body table-full-width table-responsive">
											<table class="table table-hover table-striped">
												<!-- 게시글 목록 출력 -->
												<!-- 게시글 목록 출력 -->
												<thead>
													<tr>
														<th>번호</th>
														<th>ID</th>
														<th>이름</th>
														<th>닉네임</th>
														<th>이메일</th>
														<th>성별</th>
														<th>생일</th>
														<th>등급</th>
														<th>가입일</th>
														<th>상태</th>
														<th>비고</th>
													</tr>
												</thead>
												<tbody>
													<%-- <c:forEach begin="1" end="100" step="1"">
												<tr>
													<td>mem.mno</td>
													<td>mem.id</td>
													<td>mem.name</td>
													<td>mem.nickname</td>
													<td>mem.address</td>
													<td>mem.email</td>
													<td>mem.gender</td>
													<td>mem.birth</td>
													<td>mem.member_rank</td>
													<td>mem.regdate</td>
													<td>mem.enabled</td>
													<td>탈퇴</td>
												</tr>
											</c:forEach> --%>
													<c:forEach var="mem" items="${mList}">
														<tr>
															<td>${mem.mno}</td>
															<td>${mem.id}</td>
															<td>${mem.name}</td>
															<td>${mem.nickname}</td>
															<td>${mem.email}</td>
															<td>${mem.gender}</td>
															<td>${mem.birth}</td>
															<td>${mem.member_rank}</td>
															<td>${mem.regdate}<%-- <javatime:format value="${mem.regdate}" pattern="yyyy년 MM월 dd일"/> --%>
															</td>
															<td>
																<c:if test="${mem.enabled eq 'true'}">활성화①</c:if>
																<c:if test="${mem.enabled ne 'true'}">비활성화②</c:if>
															</td>
															<td>
																<form action="${pageContext.request.contextPath}/admin/member_delete">
																	<input type="hidden" name="mno" value="${mem.mno}" />
																	<input class="btn btn-outline-dark" type="submit" value="탈퇴">
																</form>
																<form action="${pageContext.request.contextPath}/admin/member_restore">
																	<input type="hidden" name="mno" value="${mem.mno}" />
																	<input class="btn btn-outline-dark" type="submit" value="복구">
																</form>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<!-- 검색 기능 -->
								<!-- <div class="col-md-12 ">
									<div class="pull-right" style="text-align: right;">
										<div class="input-group pull-right" style="text-align: right !important; ">
											<select id="condition" class="y-form-control"
												name="condition" style="width: 100px;">
												<option value="mno">번호</option>
												<option value="id">ID</option>
												<option value="name">이름</option>
											</select> <input type="text" class="y-form-control " name="keyword"
												id="keywordInput" placeholder="검색어" style="width: 200px;">
											<span class="input-group-btn "> 
												<input type="button"
												style="background-color: #9765da; color: white; display: inline-block;" value="검색"
												class="btn btn-izone btn-flat" id="searchBtn" >
											</span>
										</div>
									</div>
								</div> -->
								<div class="col-md-12">
									<!-- 페이징 처리 부분  -->
									<div class="paging">
										<ul class="pagination justify-content-center">
											<!-- 이전 버튼 -->
											<c:if test="${pc.prev}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/member/${pc.makeURI(pc.beginPage - 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #212b52; opacity: 0.8">이전</a></li>
											</c:if>

											<!-- 페이지 버튼 -->
											<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
												<li class="page-item"><a href="<c:url value='/admin/member/${pc.makeURI(pageNum)}'/>" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: #212b52; text-align: center; border: 1px solid #212b52;">${pageNum}</a></li>
											</c:forEach>

											<!-- 다음 버튼 -->
											<c:if test="${pc.next}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/member/${pc.makeURI(pc.endPage + 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #212b52; opacity: 0.8">다음</a></li>
											</c:if>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- 본문 끝 -->	
					<!-- Mini Modal -->
					<div class="modal fade modal modal-primary" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="border: 3px solid #00498c; border-radius: 20px;">
								<div class="modal-header justify-content-center" style="display: inline-block;">
									<h3 style="text-align: center; color: #00498c; font-weight: bold">권한부여</h3>
								</div>
								<div class="modal-body text-center">
									
										<select class="custom-select" id="Authority-select">
											<option value="NO" selected="selected">권한 종류</option>
											<option value="ROLE_USER">일반회원</option>
											<option value="ROLE_MAGAZINE">매거진</option>
											<option value="ROLE_BRAND">브랜드 관리자</option>
											<option value="ROLE_ADMIN">전체 관리자</option>
										</select>
										<select class="custom-select" id="brand-select">
											<option value="" selected="selected">브랜드</option>
											<!-- 이부분 -->
											<c:forEach var="b" items="${blist }">
												<option value="${b.brandName }" >${b.brandName }</option>
											</c:forEach>
										</select>
										
										<div class="input-group my-3">
											<input type="text" class="form-control" id="idBox" placeholder="id를 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2" style="border: 1px solid #19375e;">
											<div class="input-group-append">
												<button class="btn" type="button" style="background-color: #19375e; border: 1px solid #19375e; color: white;" onclick="return searchId();">검색</button>
											</div>
										</div>
											
										<ul class="list-group my-3 id-list">
										</ul>
										<input type="submit" class="btn btn-outline-primary btn-lg btn-block" value="부여" style="background-color: #19375e; border: 1px solid #19375e; color: white;" onclick="return authoritySubmit();">
										
									</div>
								</div>
							</div>
						</div>
					</div>


				<!-- footer -->
					<jsp:include page="info/footer.jsp" />
					<%--푸터 --%>

				</div>
		
		
	</div>

<script>

var id_list = new Array();

function searchId() {
	var id = $('#idBox').val();
	
	//ajax통신으로 서버에서 값 받아오기 
	console.log("id: "+id);
	
	//중복된 아이디 처리
	for(var i=0; i<id_list.length; i++){
		if(id==id_list[i]){
			alert('중복된 아이디입니다');
			console.log('중복된 아이디');
			return false;
		}
	}
	
	/* 모달창의 id입력박스가 비어있을떄 경고메시지 */
	if($.trim($('#idBox').val())==''){
		alert('ID를 입력해주세요');
		//$("#idBox").css("background-color", "pink");
		//$("#idChk").html("<b style='font-size:14px; color:red;'>ID를 입력해주세요</b>");						
		//$('#idBox').val('').focus();
		/* 비어있지 않다면 ajax 실행 */
		return false;
	}	
	
	$.ajax({
		url: '${pageContext.request.contextPath}/member/searchMemberById',
		type: 'post',
		data: {'id' : id},
		dataType:"html",
		success:function(data){
			console.log(data);
			if(data=='success'){
				// 회원아이디가 있었을 경우
				id_list.push(id);
				$('.id-list').append($('<li class="list-group-item " style="border: 1px solid #19375e;" ><span class="member-id">'+ id +'</span><span class="float-right" onclick="return deleteId(this);" style="cursor: pointer;">X</span></li>'))
			}else{
				// 회원아읻가 없었을 경우
				alert('회원아이디가 없습니다.');
			}
		}
	});
}

// 리스트 아이디 지우기
function deleteId(tag) {
	console.log(tag);
	var id = $(tag).parent().children('.member-id').html();
	for(var i=0; i<id_list.length; i++){
		if(id==id_list[i]){
			id_list.splice(i, 1); // i번째 1개 삭제
		}
	}
	$(tag).parent().remove();
}
	
// 권한 submit
function authoritySubmit() {
	var authority = $('#Authority-select option:selected').val();
	var brand = $('#brand-select option:selected').val();
	
	console.log(authority);
	console.log(brand);
	
	// 유효성검증
	if(authority=='NO'){
		alert('권한을 선택해주세요');
		return false;
	}
	if(id_list.length==0){
		alert('아이디를 입력해주세요');
		return false;
	}
	
	var data = {"authority" : authority, "brand" : brand, "id_list": id_list };
	
	$.ajax({
		url: '${pageContext.request.contextPath}/member/insertAuthority',
		type: 'post',
		data: JSON.stringify(data),
		dataType:"html",
		contentType: "application/json",
		success:function(data){
			console.log(data);
			if(data=='success'){
				location.href='${pageContext.request.contextPath}/admin/member';
			}else{
				alert('권한 부여 실패	');
			}
		}
	});
}


	
</script>
</body>

</html>