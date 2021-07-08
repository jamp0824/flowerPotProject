<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		location.href="${pageContext.request.contextPath}/admin/employee?keyword="+keyword+"&condition="+condition;
	});
	
	$('#keywordInput').keydown(function(key){
		if(key.keyCode == 13){
			$('#searchBtn').click();
		}
	});
});
function check(){
/* 	if($.trim($('#empName').val())==''){
	alert('사원 이름을 입력하세요!');
	$('#empName').val('').focus();
	return false;
	} */

}
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
					<a class="navbar-brand" href="#pablo"> 사원 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<form action="${pageContext.request.contextPath}/admin/empAdd" method="post" onsubmit="return check();">
											<div class="card-header">
												<button type="submit" class="btn btn-izone btn-flat pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;">등록</button>

												<h4 class="card-title">사원 등록</h4>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-md-3">
														<div class="form-group">
															<label>Company (disabled)</label>
															<input type="text" class="form-control" disabled placeholder="Company" value="FlowerPot Inc.">
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<label>부서</label>
															<select id="department" class="form-control" name="deptNo">
																<option value="10">기획</option>
																<option value="20">총무</option>
																<option value="30">인사</option>
																<option value="40">개발</option>
																<option value="50">물류</option>
															</select>
															<!-- <input type="text" class="form-control" name="" placeholder="부서" value="인사"> -->
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<label>직위</label>
															<select id="position" class="form-control" name="poNo">
																<option value="1">알바</option>
																<option value="2">인턴</option>
																<option value="3">사원</option>
																<option value="4">주임</option>
																<option value="5">대리</option>
																<option value="6">팀장</option>
																<option value="7">과장</option>
																<option value="8">차장</option>
																<option value="9">부장</option>
																<option value="10">이사</option>
																<option value="11">상무</option>
																<option value="12">전무</option>
																<option value="13">부사장</option>
																<option value="14">사장</option>
																<option value="15">부회장</option>
																<option value="16">회장</option>
															</select>
															<!-- <input type="text" class="form-control" name="" placeholder="직위" value="팀장"> -->
														</div>
													</div>

													<div class="col-md-3">
														<div class="form-group">
															<label>이름</label>
															<input type="text" id="empName" class="form-control" name="empName" placeholder="이름">
														</div>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
										</form>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card strpied-tabled-with-hover">
										<div class="card-header ">
											<h4 class="card-title" style="display: inline-block;">직원 목록</h4>
											<!-- 검색 기능 -->
											<div class="col-md-12 ">
												<div class="pull-right" style="text-align: right;">
													<div class="input-group pull-right" style="text-align: right !important;">
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
												<thead>
													<th>사원 번호</th>
													<th>사원 ID</th>
													<th></th>
													<th>이름</th>
													<th>부서</th>
													<th>직급</th>
													<th>권한</th>
													<th>비고</th>
													<th>상태</th>
													<th></th>
												</thead>
												<tbody>
													<c:forEach var="emp" items="${eList}">
														<tr>
															<td>${emp.empNo}</td>
															<td>
																<c:if test="${empty emp.empId}">미발급</c:if>
																<c:if test="${!empty emp.empId}">${emp.empId}</c:if>
															</td>
															<td>
																<%-- <button class=" pull-right" onclick="location='${pageContext.request.contextPath}/admin/employee/signUp'">아이디 발급</button> --%>
																<c:if test="${empty emp.empId}">
																	<form action="${pageContext.request.contextPath}/admin/employee/signUp" method="post">
																		<input type="hidden" name="empNo" value="${emp.empNo}">
																		<input type="hidden" name="empName" value="${emp.empName}">
																		<input type="submit" value="아이디 발급" />
																	</form>
																</c:if>
															</td>
															<td>${emp.empName}</td>
															<td>
																<c:forEach var="dept" items="${emp.deptList}">${dept.deptName}</c:forEach>
															</td>
															<td>
																<c:forEach var="po" items="${emp.poList}">${po.poName}</c:forEach>
															</td>

															<td>
																<c:set var="flag" value="true" />
																<c:forEach var="auth" items="${emp.authList}">
																	<c:if test="${auth.authority == 'ROLE_ADMIN'}">
																		관리자
																		<c:set var="flag" value="false" />
																	</c:if>
																	<c:if test="${auth.authority == 'ROLE_USER'}">일반</c:if>
																</c:forEach>
															</td>

															<td>
																<c:if test="${flag == true }">
																	<c:if test="${emp.empId != null }">
																		<form action="${pageContext.request.contextPath}/admin/adminAuth">
																			<input type="hidden" name="empId" value="${emp.empId}" />
																			<input type="submit" value="관리자 권한" onclick="if(!confirm('관리자 권한을 부여하시겠습니까?')){return false;}">
																		</form>
																	</c:if>
																	<c:if test="${emp.empId == null }">
																	</c:if>
																</c:if>
																<c:if test="${flag != true }">
																
																</c:if>
															</td>
															<td data-true="${emp.empEnabled}">
																<c:if test="${emp.empEnabled eq true}">활성화①</c:if>
																<c:if test="${emp.empEnabled ne true}">비활성화②</c:if>
															</td>
															<td>
																<form action="${pageContext.request.contextPath}/admin/empDel">
																	<input type="hidden" name="empNo" value="${emp.empNo}" />
																	<input type="submit" value="삭제" onclick="if(!confirm('정말로 삭제하시겠습니까??')){return false;}">
																</form>
																<form action="${pageContext.request.contextPath}/admin/empRestore">
																	<input type="hidden" name="empNo" value="${emp.empNo}" />
																	<input type="submit" value="복구" onclick="if(!confirm('복구 하시겠습니까??')){return false;}">
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
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/employee/${pc.makeURI(pc.beginPage - 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #212b52; opacity: 0.8">이전</a></li>
											</c:if>

											<!-- 페이지 버튼 -->
											<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
												<li class="page-item"><a href="<c:url value='/admin/employee/${pc.makeURI(pageNum)}'/>" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: #212b52; text-align: center; border: 1px solid #212b52;">${pageNum}</a></li>
											</c:forEach>

											<!-- 다음 버튼 -->
											<c:if test="${pc.next}">
												<li class="page-item"><a class="page-link" href="<c:url value='/admin/employee/${pc.makeURI(pc.endPage + 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #212b52; opacity: 0.8">다음</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
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
//start JQuery
$(function() {
	
	
	const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const getPhone = RegExp(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/);
	
	
	//이름 입력값 검증.
	$('#empName').on('keyup', function() {
		//이름값 공백 확인
		if($("#empName").val() === ""){
		    $('#empName').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 필수정보!]</b>');
			return false;
		}		         
		//이름값 유효성검사
		else if(!getName.test($("#empName").val())){
		    $('#empName').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 한글로 ~]</b>');
			return false;
		} else {
			$('#empName').css("background-color", "aqua");
			$('#nameChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			return false;
		}
		
	});
	
	
});
</script>
</html>