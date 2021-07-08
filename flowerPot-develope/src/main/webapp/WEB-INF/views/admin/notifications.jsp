<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    	<jsp:include page="info/resources.jsp"/> <%--css,img,script등 정적자원 --%>

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
					<a class="navbar-brand" href="#pablo"> 입점 관리 </a>
					<jsp:include page="info/header.jsp" />
					<%--헤더(네비) --%>

					<!-- 본문 시작 -->
					<div class="content">
						<div class="container-fluid">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Notifications</h4>
									<p class="card-category">
										Handcrafted by our friend
										<a target="_blank" href="https://github.com/mouse0270">Robert McIntosh</a>
										. Please checkout the
										<a href="http://bootstrap-notify.remabledesigns.com/" target="_blank">full documentation.</a>
									</p>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6">
											<h5>
												<small>Notifications Style</small>
											</h5>
											<div class="alert alert-info">
												<span>This is a plain notification</span>
											</div>
											<div class="alert alert-info">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span>This is a notification with close button.</span>
											</div>
											<div class="alert alert-info alert-with-icon" data-notify="container">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span data-notify="icon" class="nc-icon nc-bell-55"></span> <span data-notify="message">This is a notification with close button and icon.</span>
											</div>
											<div class="alert alert-info alert-with-icon" data-notify="container">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span data-notify="icon" class="nc-icon nc-bell-55"></span> <span data-notify="message">This is a notification with close button and icon and have many lines. You can see that the icon and the close button are always vertically aligned. This is a beautiful notification. So you don't have to worry about the style.</span>
											</div>
										</div>
										<div class="col-md-6">
											<h5>
												<small>Notification States</small>
											</h5>
											<div class="alert alert-primary">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span> <b> Primary - </b> This is a regular notification made with ".alert-primary"
												</span>
											</div>
											<div class="alert alert-info">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span> <b> Info - </b> This is a regular notification made with ".alert-info"
												</span>
											</div>
											<div class="alert alert-success">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span> <b> Success - </b> This is a regular notification made with ".alert-success"
												</span>
											</div>
											<div class="alert alert-warning">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span> <b> Warning - </b> This is a regular notification made with ".alert-warning"
												</span>
											</div>
											<div class="alert alert-danger">
												<button type="button" aria-hidden="true" class="close" data-dismiss="alert">
													<i class="nc-icon nc-simple-remove"></i>
												</button>
												<span> <b> Danger - </b> This is a regular notification made with ".alert-danger"
												</span>
											</div>
										</div>
									</div>
									<br> <br>
									<div class="places-buttons">
										<div class="row">
											<div class="col-md-6 offset-md-3 text-center">
												<h4 class="card-title">
													Notifications Places
													<p class="card-category">
														<small>Click to view notifications</small>
													</p>
												</h4>
											</div>
										</div>
										<div class="row justify-content-center">
											<div class="col-md-3 col-lg-3">
												<button class="btn btn-default btn-block" onclick="demo.showNotification('top','left')">Top Left</button>
											</div>
											<div class="col-md-3 col-lg-3">
												<button class="btn btn-default btn-block" onclick="demo.showNotification('top','center')">Top Center</button>
											</div>
											<div class="col-md-3 col-lg-3">
												<button class="btn btn-default btn-block" onclick="demo.showNotification('top','right')">Top Right</button>
											</div>
										</div>
										<div class="row justify-content-center">
											<div class="col-md-3 col-lg-3">
												<button class="btn btn-default btn-block" onclick="demo.showNotification('bottom','left')">Bottom Left</button>
											</div>
											<div class="col-md-3 col-lg-3">
												<button class="btn btn-default btn-block" onclick="demo.showNotification('bottom','center')">Bottom Center</button>
											</div>
											<div class="col-md-3 col-lg-3">
												<button class="btn btn-default btn-block" onclick="demo.showNotification('bottom','right')">Bottom Right</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 text-center">
											<h4 class="title">Modal</h4>
											<a class="btn btn-info btn-fill btn-wd" data-toggle="modal" data-target="#myModal1" href="#pablo"> Launch Modal Mini </a>
										</div>
									</div>
								</div>
							</div>
							<!-- Mini Modal -->
							<div class="modal fade modal-mini modal-primary" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header justify-content-center">
											<div class="modal-profile">
												<i class="nc-icon nc-bulb-63"></i>
											</div>
										</div>
										<div class="modal-body text-center">
											<p>Always have an access to your profile</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-link btn-simple">Back</button>
											<button type="button" class="btn btn-link btn-simple" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
							<!--  End Modal -->
						</div>
					</div>
					<!-- 본문 끝 -->

					<!-- footer -->
					<jsp:include page="info/footer.jsp" />
					<%--푸터 --%>

				</div>
		</div>
</body>

<script type="text/javascript">
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.showNotification();

    });
</script>
<%--주소 --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</html>

