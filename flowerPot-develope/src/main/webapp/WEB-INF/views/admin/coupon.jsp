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
		location.href="${pageContext.request.contextPath}/admin/coupon?keyword="+keyword+"&condition="+condition;
	});
	
	$('#keywordInput').keydown(function(key){
		if(key.keyCode == 13){
			$('#searchBtn').click();
		}
	});
});
function check(){
	if($.trim($('#coupName').val())==''){
		alert('쿠폰 이름을 입력하세요!');
		$('#coupName').val('').focus();
		return false;
	}
	if(($.trim($('#discMoney').val())=='') && ($.trim($('#discPercent').val())=='')){
		alert('할인액과 할인률중 하나 이상 입력하세요!');
		$('#discMoney').val('').focus();
		return false;
	}
	/*if($.trim($('#discPercent').val())==''){
		alert('할인 율을 입력하세요!');
		$('#discPercent').val('').focus();
		return false;
	}*/
	if($.trim($('#startD').val())==''){
		alert('쿠폰 시작기간을 입력하세요!');
		$('#startD').val('').focus();
		return false;
	}
	if($.trim($('#endD').val())==''){
		alert('쿠폰 마감기간을 입력하세요!');
		$('#endD').val('').focus();
		return false;
	}
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
					<a class="navbar-brand" href="#pablo"> 쿠폰 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<form action="${pageContext.request.contextPath}/admin/couponRegist" method="post" onsubmit="return check();">
										<div class="card">
											<div class="card-header">
												<button type="submit" class="btn btn-izone btn-flat pull-right" style="background-color: #212b52; color: white; border: 1px solid #212b52;">등록</button>
												<h4 class="card-title">쿠폰 등록</h4>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-md-2">
														<div class="form-group">
															<label>쿠폰 이름</label>
															<input type="text" id="coupName" class="form-control" name="couponName" placeholder="쿠폰 이름">
														</div>
													</div>

													<div class="col-md-2">
														<div class="form-group">
															<label>할인 액</label>
															<input type="text" id="discMoney" class="form-control" name="discountMoney" placeholder="할인 금액">
														</div>
													</div>
													<div class="col-md-2">
														<div class="form-group">
															<label>할인 율</label>
															<input type="text" id="discPercent" class="form-control" name="discountPercent" placeholder="할인 율">
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<label>유효기간</label>
															<input type="date" id="startD" class="form-control" name="startPDate" placeholder="시작">
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<label>마감기간</label>
															<input type="date" id="endD" class="form-control" name="endPDate" placeholder="마감">
														</div>
													</div>
												</div>
												<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card strpied-tabled-with-hover">
								<div class="card-header ">
									<h4 class="card-title" style="display: inline-block;">쿠폰 목록</h4>
									<div class="pull-right" style="text-align: right;">

										<div class="input-group pull-right" style="text-align: right !important;">
											<select id="condition" class="y-form-control" name="condition" style="width: 100px;">
												<option value="couponName">쿠폰명</option>
											</select>
											<input type="text" class="y-form-control" name="keyword" id="keywordInput" placeholder="쿠폰 이름을 입력하세요" style="width: 200px;">
											<span class="input-group-btn "> <input type="button" style="background-color: #212b52; color: white; display: inline-block;" value="검색" class="btn btn-izone btn-flat" id="searchBtn">
											</span>
										</div>
									</div>
									<p class="card-category">부제</p>
								</div>
								<div class="card-body table-full-width table-responsive">
									<table class="table table-hover table-striped">
										<!-- 게시글 목록 출력 -->
										<!-- 게시글 목록 출력 -->
										<!-- 쿠폰 목록 출력 -->
										<thead>
											<th>쿠폰 번호</th>
											<th>쿠폰 이름</th>
											<th>할인 액</th>
											<th>할인 율</th>
											<th>시작 기간</th>
											<th></th>
											<th>마감 기간</th>
											<th>비 고</th>
										</thead>
										<tbody>
											<c:forEach var="coup" items="${cList}">
												<tr>
													<td class="c-couNo">${coup.couNo}</td>
													<td class="c-name">${coup.couponName}</td>
													<td>
														<c:if test="${empty coup.discountMoney}">0원</c:if>
														<c:if test="${!empty coup.discountMoney}">${coup.discountMoney}원</c:if>
													</td>
													<td>
														<c:if test="${empty coup.discountPercent}">0%</c:if>
														<c:if test="${!empty coup.discountPercent}">${coup.discountPercent}%</c:if>
													</td>
													<td>
														<javatime:format value="${coup.startDate}" pattern="yyyy년 MM월 dd일" />
													</td>
													<td>~</td>
													<td>
														<javatime:format value="${coup.endDate}" pattern="yyyy년 MM월 dd일" />
													</td>
													<%-- <fmt:formatDate value="${coup.endPDate}" pattern="yyyy년 MM월 dd일"/> --%>
													</td>
													<td>
														<button id="popup_open_btn" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal1" href="#pablo" value="${coup.couponName}" onclick="return giftCoupon(this);">쿠폰 발급</button>
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
												style="background-color: #212b52; color: white; display: inline-block;" value="검색"
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
										<li class="page-item"><a class="page-link" href="<c:url value='/admin/coupon/${pc.makeURI(pc.beginPage - 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #d3d3d3; opacity: 0.8">이전</a></li>
									</c:if>

									<!-- 페이지 버튼 -->
									<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
										<li class="page-item"><a href="<c:url value='/admin/coupon/${pc.makeURI(pageNum)}'/>" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: #212b52; text-align: center; border: 1px solid #d3d3d3;">${pageNum}</a></li>
									</c:forEach>

									<!-- 다음 버튼 -->
									<c:if test="${pc.next}">
										<li class="page-item"><a class="page-link" href="<c:url value='/admin/coupon/${pc.makeURI(pc.endPage + 1)}' />" style="background-color: #212b52; margin-top: 0; height: 40px; color: white; border: 0px solid #d3d3d3; opacity: 0.8">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>

					<!-- Mini Modal -->
					<div class="modal fade modal modal-primary" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="border: 3px solid #00498c; border-radius: 20px;">
								<div class="modal-header justify-content-center" style="display: inline-block;">
									<h3 style="text-align: center; color: #00498c; font-weight: bold">쿠폰 발급</h3>

									<h4 style="text-align: center;" id="coupon-name">내용</h4>


									<!-- 
                                    <div class="modal-profile">
                                        <i class="nc-icon nc-bulb-63"></i> 
                                    </div>
                                        -->
								</div>
									<form action="${pageContext.request.contextPath}/admin/couponRegistToMember" method="post">
									<input type="hidden" id="couNo" name="couNo" value="">
									<div class="modal-body text-center">

										<input type="radio" name="radio" value="1" onchange="setDisplay();">
										모든 회원 &nbsp;
										<input type="radio" id="appoint" name="radio" value="2" onchange="setDisplay();">
										특정 회원
									
										<div id="memApp" style="display: none;">

											<!-- 검색 아이디 유효성 검증 -->
											<b id="idChk"></b>

											<div class="input-group mb-3">
												<input type="text" class="form-control" id="idBox" placeholder="id를 입력하세요" aria-label="Recipient's username" aria-describedby="basic-addon2" style="border: 1px solid #19375e;">
												<div class="input-group-append">
													<button class="btn" id="searchId" type="button" style="background-color: #19375e; border: 1px solid #19375e; color: white;">검색</button>
												</div>
											</div>
											<!-- ul -->
											<ul class="list-group" style="border: 1px solid #19375e; border-radius: 5px;">
											</ul>
										</div>
									</div>
									<div class="modal-footer pull-right">
											<input type="submit" class="btn btn-flat pull-right"  style="background-color: #19375e; color: white; border: 1px solid #19375e; margin-left: 180px;" value="지급">
										<!-- <button type="button" class="btn btn-link btn-simple">Back</button> -->
									</div>
									</form>
							</div>
						</div>
					</div>

					<!--  End Modal -->

				</div>
		</div>
		<!-- 모달 -->

		<!-- 본문 끝 -->

		<!-- footer -->
		<jsp:include page="info/footer.jsp" />
		<%--푸터 --%>

	</div>
	
</body>

<script>

// 아이디 리스트
var id_list = new Array();

//restAPI와 Ajax()를 활용하여 DB정보를 가져온다
$(function() {
	//엔터를 눌렀을때 키다운
	$('#idBox').keydown(function(key){
		if(key.keyCode == 13){
			$('#searchId').click();
		}
	});
	
	//버튼 클릭 이벤트
	$("#searchId").click(function(){
		
		//ajax통신으로 서버에서 값 받아오기 
		const id= $('#idBox').val();
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
			$("#idBox").css("background-color", "pink");
			$("#idChk").html("<b style='font-size:14px; color:red;'>ID를 입력해주세요</b>");						
			$('#idBox').val('').focus();
			/* 비어있지 않다면 ajax 실행 */
			return false;
		}	
		$.ajax({
			type:"get",
			url: "${pageContext.request.contextPath}/admin/coupon/"+id,
			headers:{
				"Content-Type": "application/json"
			},
			/* data: id, */
			dataType:"json",
			success:function(result){
				console.log(result);
				console.log(result.id);
				const memberId = result.id;
				console.log('ID : '+memberId);
				
				// id 리스트에 id추가
				id_list.push(memberId);
				
				
				//.append()함수를통해서 가져온 정보를 html태그와 함께 누적해서 추가한다.
				$("#idChk").html("<b></b>"); /* 이건 작동됨 */
				$('#idBox').val('').focus();

				$("#idBox").css("background-color", "#e8f0fe");/* 이게 안먹음 검색성공하면 녹색으로 색이바껴야하는데 안먹음*/
				$('.list-group').append('<li class="list-group-item d-flex justify-content-between align-items-center" style="background-color: #fafad2;" >'+memberId+'<input type="hidden" name="id" value="'+memberId+'"><input type="checkbox" value=""></li>');
			}
			,error: function() {//DB에 데이터가 없을때 이곳에서 검증
				$('#idBox').val('').focus();
				$("#idBox").css("background-color", "pink");/* 이게 안먹음 검색실패하면 핑크색으로 색이바껴야하는데 안먹음*/
				$("#idChk").html("<b style='font-size:14px; color:red;'>요청하신 회원의 정보를 찾을수 없습니다</b>");						
				
			}
		});
		
	})
});

function giftCoupon(data) {
	console.log(data);
	console.log($(data).parent());
	console.log($(data).parent().parent().children('.c-name').html());
	$('#coupon-name').html($(data).parent().parent().children('.c-name').html());
	
	var couNo = Number($(data).parent().parent().children('.c-couNo').html());	
	$('#couNo').val(couNo);
} 

function setDisplay(){
    if($('input:radio[id=appoint]').is(':checked')){
        $('#memApp').show();
    }else{
        $('#memApp').hide();
    }
}


</script>
</html>

<!-- <div id="memApp" style="display: none;">
                                	<div class="input-group pull-right" >
										<input type="text"class="y-form-control" name="keyword" id="keywordInput" placeholder="id" style="width: 100px; margin-left: 180px;">
										<span class="input-group-btn "> 
											<input type="button" style="background-color: #212b52; color: white; display: inline-block;" value="검색"	 class="btn btn-izone btn-flat"id="searchBtn">
										</span>
									</div>
                                </div> -->