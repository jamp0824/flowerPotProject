<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<jsp:include page="../info/header2.jsp"></jsp:include>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath }/resources/images/logo_mypage.png');">
	<h2 class="ltext-105 cl0 txt-center"></h2>
</section>

<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
			홈 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>

		<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
			마이페이지 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>

		<span class="stext-109 cl4"> 상품주문 </span>
	</div>
</div>

<!-- Content page -->
<section class="bg0 p-t-62 p-b-60">
	<div class="container">
		<jsp:include page="jumbotron.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-4 col-lg-3 p-b-80">
				<jsp:include page="sidebar.jsp"></jsp:include>
			</div>

			<div class="col-md-8 col-lg-9 p-b-80" style="padding: 50px">
				<h2 class="text-center my-3">내가 가진 쿠폰 내역</h2>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">쿠폰이름</th>
							<!-- <th scope="col">할인율</th>
							<th scope="col">할인액</th> -->
							<th scope="col">유효기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="coup" items="${coupList }">
								<td>${coup.couponName }</td>
								<%-- <td>${coup.discountPercent }%</td>
							<td>${coup.discountMoney }원</td> --%>
								<td>
									<javatime:format value="${coup.startDate }" pattern="yyyy년 MM월 dd일" />
									~
									<javatime:format value="${coup.endDate }" pattern="yyyy년 MM월 dd일" />
								</td>
							</c:forEach>
							<c:if test="${fn:length(coupList) == 0}">
								<td colspan="2" class="text-center">
									가지고있는 쿠폰이 없습니다
								</td>
							</c:if>
						</tr>
					</tbody>
				</table>

				<h2 class="text-center my-3 pt-4">사용한 쿠폰 내역</h2>
				<div class="wrap-table-shopping-cart">
					<table class="table " style="margin: 0;">
						<tr>
							<!-- <th class="column-1 text-center"></th> -->
							<th scope="col" class="text-center">상품사진</th>
							<th scope="col" class="text-center">상품이름</th>
							<th scope="col" class="text-center">개수</th>
							<th scope="col" class="text-center">배송 상태</th>
							<th scope="col" class="text-center">주문상태</th>
						</tr>
						<c:set var="orderNum" property="0"></c:set>
						<c:forEach var="order" items="${oList }">
							<!-- 사용한 포인트가 있을때만 출력 -->
							<c:if test="${order.orderProductList[0].couponName ne null }">
								<tr>
									<td colspan="4" class="align-middle">주문번호 : ${order.order_num }</td>
									<td class="align-middle">${order.regdate }</td>
								</tr>

								<c:forEach var="op" items="${order.orderProductList }">
									<tr class="">
										<!-- <td class="column-1 text-center"><input class="align-self-center m-l-10" type="checkbox" id=""></td>  -->
										<!-- 요부분 생각좀하자 -->
										<td class="align-self-center text-center">
											<div class="how-itemcart1" style="margin: 0 auto;">
												<img src="${op.cosmeticVo.mappingList[0] }" alt="상품사진">
											</div>
										</td>
										<td class="text-center align-middle">${op.cosmeticVo.name }</td>
										<!-- 개수 -->
										<td class="text-center align-middle">
											<span> ${op.amount} </span>
										</td>
										<!--  -->
										<td class="text-center align-middle">${op.deliver_state }</td>
										<td class="text-center align-middle">${op.state }</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="5">사용한 쿠폰 이름 : ${order.orderProductList[0].couponName }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>


		</div>
	</div>
</section>

<script>

//start JQuery
$(function() {
	
	const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const getPhone = RegExp(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/);
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false; chk6 = false;

	$(document).ready(function() {
		
		(function yajax() {
			$.ajax({
				url : '${pageContext.request.contextPath }/magazine/magazineAjax',
				type : 'GET',
				dataType : 'json',
				success : function (data) {
					console.log(data);
					$('#magazine-test a img').attr('src','${pageContext.request.contextPath }'+data[0].rootfolder+data[0].uuidname);
					$('#magazine-title').html(data[0].title)
				}
			});

		})();
	});
	
	//패스워드 입력값 검증.
	$('#password').on('keydown', function() {
		//비밀번호 공백 확인
		if($("#password").val() === ""){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#password').css("background-color", "aqua");
			$('#pwChk').html('<b style="font-size:14px;color:green;">[√]</b>');
			chk2 = true;
		}
		
	});
	
	//패스워드 확인란 입력값 검증.
	$('#password_check').on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($("#password_check").val() === ""){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
			chk3 = false;
		}		         
		//비밀번호 확인란 유효성검사
		else if($("#password").val() != $("#password_check").val()){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
			chk3 = false;
		} else {
			$('#password_check').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:14px;color:green;">[√]</b>');
			chk3 = true;
		}
		
	});
	
	//이름 입력값 검증.
	$('#user_name').on('keyup', function() {
		//이름값 공백 확인
		if($("#user_name").val() === ""){
		    $('#user_name').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 필수정보!]</b>');
			chk4 = false;
		}		         
		//이름값 유효성검사
		else if(!getName.test($("#user_name").val())){
		    $('#user_name').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 한글로 ~]</b>');
			chk4 = false;
		} else {
			$('#user_name').css("background-color", "aqua");
			$('#nameChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk4 = true;
		}
		
	});
	
	//전화번호 입력값 검증.
	$('#user_phone').on('keyup', function() {
		if($("#user_phone").val() === ""){
			$('#user_phone').css("background-color", "pink");
			$('#phoneChk').html('<b style="font-size:14px;color:red;">[전화번호는 필수 정보에요!]</b>');
			chk6 = false;
		}
	
		//전화번호 유효성검사
		else if(!getPhone.test($("#user_phone").val())){
			$('#user_phone').css("background-color", "pink");
			$('#phoneChk').html('<b style="font-size:14px;color:red;">[예시:010-0000-0000]</b>');	  
			chk6 = false;
		} 
		//전화번호 중복확인 비동기 처리
		else {
			//전화번호 중복확인 비동기 통신
			const phone = $(this).val();
			console.log(phone);
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/member/checkPhone",	
				headers: {
	                "Content-Type": "application/json"
	            },
				dataType: "text",
				data: phone,
				success: function(result) {
					if(result === "OK") {
						$("#user_phone").css("background-color", "aqua");
						$("#phoneChk").html("<b style='font-size:14px; color:green;'>[전화번호는 사용 가능!]</b>");						
						chk6 = true;
					} else {
						$("#user_phone").css("background-color", "pink");
						$("#phoneChk").html("<b style='font-size:14px; color:red;'>[전화번호가 중복됨!]</b>");						
						chk6 = false;
					}
				},
				error: function() {
					console.log("통신 실패!");
				}
			});
		}
	});
	
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

<jsp:include page="../info/footer.jsp"></jsp:include>