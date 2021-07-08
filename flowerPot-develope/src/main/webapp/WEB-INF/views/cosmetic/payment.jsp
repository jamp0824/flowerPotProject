<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>


<jsp:include page="../info/header2.jsp"></jsp:include>

<!--  <form action="${pageContext.request.contextPath }/kakaoPay" method="post" style="width:100%; margin: 0;">-->
<section class="bg0 p-t-75 p-b-85">
	<div class="row" style="margin: 0 auto; max-width: 1000px">
		
			<div class="col-12 m-lr-auto m-b-50">
				<h2 class="text-center py-5 font-weight-bold">주문서</h2>	
				
				<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30">
					<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">상품정보</div>
				
						<table class="table">
							<tr>
								<th class="text-center">상품사진</th>
								<th class="text-center">상품이름</th>
								<th class="text-center">가격</th>
								<th class="text-center">개수</th>
								<th class="text-center">총 가격</th>
							</tr>
							<!-- 장바구니에서 구매시, 상품정보 -->
							<c:if test="${root==2 }">
								<c:forEach var="cosmetic" items="${shoppingCartList }">
									
									<input type="hidden" class="member-mno" value="${member.mno }" />
									<input type="hidden" class="member-member_rank" value="${member.member_rank }" />
									<input type="hidden" class="cosmetic-cno" value="${cosmetic.cno }" />
									<input type="hidden" class="cosmetic-brand" value="${cosmetic.brand }" />
									<input type="hidden" class="cosmetic-discountPersent" value="${cosmetic.discountPersent }" />
									<tr class="table_row">
										<td class="text-center">
											<div class="how-itemcart1" style="margin : 0 auto;">
												<img src="${cosmetic.mappingList[0] }" alt="상품사진">
											</div>
										</td>
										<td class="text-center align-middle cosmetic-name">${cosmetic.name }</td>
										<!-- 상품하나의 가격 -->
										<td class="text-center align-middle ">
											<c:if test="${cosmetic.discountPersent == 0 }">
												<span class="cosmetic-price">${cosmetic.price }</span><span>원</span>
											</c:if>
											<c:if test="${cosmetic.discountPersent != 0 }">
												<del><span class="cosmetic-price">${cosmetic.price }</span><span>원</span></del><br />
												<span>
													<fmt:parseNumber var="discountPrice" integerOnly= "true" value= "${cosmetic.price*(100-cosmetic.discountPersent)/100 }" />
													<fmt:formatNumber value="${discountPrice}" type="number" groupingUsed="false" />
												</span>
												<span>원</span>
											</c:if>
										</td>
										<!-- 개수선택 -->
										<td class="text-center align-middle">
											<span class="cosmetic-numProduct">${cosmetic.numProduct}</span><span>개</span>
										</td>
										<!-- 총금액 -->
										<td class="text-center align-middle">
											<c:if test="${cosmetic.discountPersent == 0 }">
												<span class="cosmetic-totalprice">${cosmetic.price*cosmetic.numProduct}</span><span>원</span>
											</c:if>
											<c:if test="${cosmetic.discountPersent != 0 }">
												<del><span class="cosmetic-totalprice">${cosmetic.price*cosmetic.numProduct}</span><span>원</span></del><br />
												
												<span><fmt:parseNumber var="discountPrice" integerOnly= "true" value= "${cosmetic.price*(100-cosmetic.discountPersent)/100 }" /><fmt:formatNumber value="${discountPrice*cosmetic.numProduct}" type="number" groupingUsed="false" /></span>
												<span>원</span>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- 바로구매시, 상품정보 -->
		
							<c:if test="${root==1 }">
								<input type="hidden" class="member-mno" value="${member.mno }" />
								<input type="hidden" class="member-member_rank" value="${member.member_rank }" />
								<input type="hidden" class="cosmetic-cno" value="${cosmetic.cno }" />
								<input type="hidden" class="cosmetic-brand" value="${cosmetic.brand }" />
								<input type="hidden" class="cosmetic-discountPersent" value="${cosmetic.discountPersent }" />
								<tr class="table_row">
										<td class="text-center">
											<div class="how-itemcart1" style="margin : 0 auto;">
												<img src="${cosmetic.mappingList[0] }" alt="상품사진">
											</div>
										</td>
										<td class="text-center align-middle">${cosmetic.name }</td>
										<!-- 상품하나의 가격 -->
										<td class="text-center align-middle ">
											<c:if test="${cosmetic.discountPersent == 0 }">
												<span class="cosmetic-price">${cosmetic.price }</span><span>원</span>
											</c:if>
											<c:if test="${cosmetic.discountPersent != 0 }">
												<del><span class="cosmetic-price">${cosmetic.price }</span><span>원</span></del><br />
												<span>
													<fmt:parseNumber var="discountPrice" integerOnly= "true" value= "${cosmetic.price*(100-cosmetic.discountPersent)/100 }" />
													<fmt:formatNumber value="${discountPrice}" type="number" groupingUsed="false" />
												</span>
												<span>원</span>
											</c:if>
										</td>
										<!-- 개수선택 -->
										<td class="text-center align-middle">
											<span class="cosmetic-numProduct">${cosmetic.numProduct}</span><span>개</span>
										</td>
										<!--  -->
										<td class="text-center align-middle">
											<c:if test="${cosmetic.discountPersent == 0 }">
												<span class="cosmetic-totalprice">${cosmetic.price*cosmetic.numProduct}</span><span>원</span>
											</c:if>
											<c:if test="${cosmetic.discountPersent != 0 }">
												<del><span class="cosmetic-totalprice">${cosmetic.price }</span><span>원</span></del><br />
												
												<span >
													<fmt:parseNumber var="discountPrice" integerOnly= "true" value= "${cosmetic.price*(100-cosmetic.discountPersent)/100 }" />
													<fmt:formatNumber value="${discountPrice*cosmetic.numProduct}" type="number" groupingUsed="false" />
												</span>
												<span>원</span>
											</c:if>
											
										</td>
									</tr>
							</c:if>
						</table>
				</div>

			<!-- 주문자 정보 --> <!-- 로그인 되어있을시,, 자동으로 입력되어야함 -->
			<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">주문자 정보</div>

					<div class="form-group row">
						<label for="sender" class="col-sm-2 col-form-label">보내는분</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" value="${member.name }" id="sender">
						</div>
					</div>
					<div class="form-group row">
						<label for="tel" class="col-sm-2 col-form-label">휴대폰 번호</label>
						<div class="col-sm-5">
							<input type="text" class="form-control nomember-tel" value="${member.tel }" id="tel" placeholder="-는 뺴고 입력해주세요">
						</div>
					</div>
					<div class="form-group row">
						<label for="email" class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-5">
							<input type="email" class="form-control nomember-email" value="${member.email }" id="email">
							<small id="emailHelp" class="form-text text-muted">이메일을 통해 주문처리 과정을 보내드립니다</small>
						</div>
					</div>
			</div>
			
			<!-- 배송정보 --> <!-- 로그인 되어있을시,, 값을 가져올수 있어야함 -->
			
			<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30">
					<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">배송 정보</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<input type="text" class="form-control postcode" value="${memberAddress.postcode }" id="sample4_postcode" placeholder="우편번호">
						</div>
						<div class="col-sm-3">
							<input type="button" class="btn btn-outline-secondary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<input type="text" class="form-control street_address" value="${memberAddress.street_address }" id="sample4_roadAddress" placeholder="도로명주소">
							<span id="guide" style="color: #999; display: none"></span>
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control parcel_address" value="${memberAddress.parcel_address }" id="sample4_jibunAddress" placeholder="지번주소">
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-4">
							<input type="text" class="form-control detail_address" value="${memberAddress.detail_address }" id="sample4_detailAddress" placeholder="상세주소">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control more_infomation" value="${memberAddress.more_infomation }" id="sample4_extraAddress" placeholder="참고항목">
						</div>
					</div>
			</div>
			
			<!-- 로그인시만 보이게 -->
			<!-- 쿠폰정보 --> <!-- 로그인 되어있을시,, 자동으로 입력되어야함 -->
			<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">쿠폰 / 적립금</div>
				<div class="row my-3"  style="border-bottom: 1px solid #ddd; margin-left: 0;  margin-right: 0;" >
					<div class="col-4">
						쿠폰 적용
					</div>
					<div class="col-8">  
						<select class="custom-select custom-select-lg mb-3 coupon-select" style="width: 100%;" onchange="return changePrice();">
						  <option value="no" selected="selected">사용안함</option>
						  <!-- 쿠폰리스트 -->
						  <c:if test="${coupList != null }">
						  	<c:forEach var="coup" items="${coupList }">
						  		<option value="${coup.couponName }" data-couNo="${coup.couNo }" data-discountMoney="${coup.discountMoney }" data-discountPercent="${coup.discountPercent }">${coup.couponName }</option> <!-- 쿠폰이름에 정보가 있어야할듯 -->
						  	</c:forEach>
						  </c:if>
						</select>
					</div>
				</div>
				<!-- 적립금 -->
				<div class="row my-3 pb-3"  style="border-bottom: 1px solid #ddd;  margin-left: 0;  margin-right: 0;">
					<div class="col-4">
						적립금 적용
					</div>
					<div class="col-8">
						<div class="d-flex justify-content-between mb-3">
						<span>사용 가능한 적립금</span>
							<!-- 로그인이 안되어있을떄 -->
							<c:if test="${member == null}">
								<span><span class="max-point">0</span><span>원</span></span>
							</c:if>
							<!-- 로그인 되어있을떄 -->
							<c:if test="${member != null}">
								<span><span class="max-point">${member.point }</span><span>원</span></span>
							</c:if>
						</div>
						<input type="number" class="form-control cosmetic-point" value="0" id="" placeholder="적립금 사용" onchange="return maxPoint(this);">
					</div>
				</div>
			</div>
			
			<!-- 결제수단 --> 
			<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">결제 수단</div>
				<div class="row my-3 pb-3 mlr-0" style="border-bottom: 1px solid #ddd;">
					<div class="col-4" style="padding-top: 5px;">
						카카오페이
					</div>
					<div class="col-8">
						 <input type="radio" id="naver" name="pay-method" style="display: inline-block; margin-right: 5px "><label for="naver" style="display: inline-block;"><img alt="" src="${pageContext.request.contextPath }/resources/img/payment_icon_yellow_medium.png" ></label>
					</div>
				</div>
				<div class="row my-3 pb-3 mlr-0" style="border-bottom: 1px solid #ddd;">
					<div class="col-4" style="padding-top: 5px;">
						네이버페이
					</div>
					<div class="col-8">
						<input type="radio" id="kakao" name="pay-method" style="display: inline-block;">
				  		<label for="kakao" style="display: inline-block;"><label for="naver" style="display: inline-block;"><img alt="" src="${pageContext.request.contextPath }/resources/img/naver-pay.png" ></label>
					</div>
				</div>
			</div>
			
			<!-- 결제 금액 요약  -->
			<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">결제 금액</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 pb-3">
						주문금액
					</div>
					<div class="col-6 pb-3">
						<span class="order_price"></span><span>원</span>
					</div>
				</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 p-l-30 pb-3">
						ㄴ상품금액
					</div>
					<div class="col-6">
						<span class="product_price"></span><span>원</span>
					</div>
				</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 p-l-30 pb-3">
						ㄴ상품할인
					</div>
					<div class="col-6 pb-3">
						<span class="product_discount"></span><span>원</span><span style="display : none" class="discount-percent"></span>
					</div>
				</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 pb-3">
						배송비
					</div>
					<div class="col-6 pb-3">
						<span class="delivery_price">2500</span><span>원</span>
					</div>
				</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 pb-3">
						쿠폰할인
					</div>
					<div class="col-6">
						<span class="coupon_discount">0</span><span>원</span>
					</div>
				</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 pb-3">
						적립금사용
					</div>
					<div class="col-6 pb-3">
						<span class="point_discount"></span><span>원</span>
					</div>
				</div>
				<div class="row  my-3 mlr-0"  style="border-bottom: 1px solid #ddd;">
					<div class="col-6 pb-3">
						최종결재금액
					</div>
					<div class="col-6 pb-3">
						<span class="final_price">10000</span><span>원</span>
					</div>
				</div>
			</div>
				
			<div class="m-l-25 m-r-38 m-lr-0-xl p-t-30 p-b-30 text-center">
				<button type="button" class="btn btn-outline-secondary btn-lg" onclick="return ordersubmit();">결제하기</button>
			</div>
		</div>
		
	</div>
</section>
<!-- </form> -->
	
<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script> -->

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

 // 총액 계산 함수
 function changePrice() {
 	
 	var order_price=0;
 	var product_price=0;
 	var product_discount = 0;
 	var delivery_price = Number($('.delivery_price').html());
 	
 	for(var i=0; i< $('.cosmetic-price').length; i++){
 		
 		var price = Number($($('.cosmetic-price').get(i)).html());
		var numProduct = Number($($('.cosmetic-numProduct').get(i)).html());
		console.log(price);  // 상품가격
		console.log(numProduct);   // 상품개수
		var discountPersent = Number($($('.cosmetic-discountPersent').get(i)).val());  // 할인 퍼센트
		
		order_price += price*numProduct*((100-discountPersent)/100);    // 할인적용가격 (포인트와 쿠폰은 적용x)
		product_price += price*numProduct;								// 상품 가격
		product_discount += price*numProduct*(discountPersent/100);		// 할인가격
		
		console.log(order_price);
		//console.log(product_price);
		//console.log(product_discount);
		
	}
	var cosmetic_price = Number($('.cosmetic-price').html());
	var cosmetic_numProduct = Number($('.cosmetic-numProduct').html());
	var point_discount = $('.cosmetic-point').val();
	var final_price = order_price - point_discount + delivery_price; // 최종가격
	
	var point = $('.cosmetic-point').val(); // 차감 포인트
	
	// 쿠폰 할인율, 할인 가격   data-couNo="${coup.couNo }" data-discountMoney="${coup.discountMoney }" data-discountPercent="${coup.discountPercent }
	if($('.coupon-select option:selected').val()=='no'){
		
		$('.coupon_discount').html('0'); // 쿠폰 할인 가격 표시
		
		final_price = final_price - point; 
	}else{
		
		// 쿠폰 적용시 최종가격
		var couNo = $($('.coupon-select option:selected').get(0)).data('couno');  // ㅡ.ㅡ 지 멋대로 소문자로 바뀜
		var discountMoney = $($('.coupon-select option:selected').get(0)).data('discountmoney');
		var discountPercent = $($('.coupon-select option:selected').get(0)).data('discountpercent');
		console.log($('.coupon-select option:selected'));
		//console.log($('.coupon-select option:selected').get(0));
		//console.log($('.coupon-select option:selected').val());
		var coupon_discount = Math.round(final_price*(discountPercent/100));
		
		$('.coupon_discount').html(coupon_discount); // 쿠폰 할인 가격 표시
		final_price = final_price - coupon_discount - discountMoney - point;  
	}

	$('.order_price').html(String(order_price));  // 주문 금액 (상품 자체 할인이 적용된 금액)
	$('.product_price').html(String(product_price));  // 상품 금액 (상품 고유의 금액)
	$('.product_discount').html(String(product_discount));  // 상품 자체 할인이 적용될 금액
	//$('.coupon_discount')
	$('.point_discount').html($('.cosmetic-point').val());  
	$('.final_price').html(String(final_price));
}
changePrice();
    
    // 주문 결제
    function ordersubmit() {
    	console.log($('.cosmetic-cno').length);
    	console.log($('.cosmetic-cno').get(0));
    	
    	var len = $('.cosmetic-cno').length;
    	var olist = [];
    	
    	// 배송정보, 주문자 정보 유효성 검증
    	var flag = validate();
    	
    	if(flag!=false){
    		// 배달 정보 객체
	    	var delivery = {'postcode': $('.postcode').val() ,'street_address': $('.street_address').val() ,'parcel_address': $('.parcel_address').val() ,'detail_address': $('.detail_address').val(), 'more_infomation': $('.more_infomation').val()};
	    	var dno;
	    	
	    	// 배송정보 아작스
	    	$.ajax({
	    		type: "POST",
	    		url: "${pageContext.request.contextPath }/delivery_register", 
	    		data : delivery,
	    		dataType : "html",
	    		success : function(data) {
	    			console.log(data+"배달정보입력");
	    			
	    			dno = Number(data);
	    		}
	    	}).done(function (data) { 
	    		
	    		// 배달정보를 넣은후 여
	    		for(var i=0; i<len; i++){
	        		var OrderProduct={};
	        		OrderProduct.cno = $($('.cosmetic-cno').get(i)).val();
	        		OrderProduct.mno = $('.member-mno').val(); 
	        		OrderProduct.dno = dno;
	        		OrderProduct.amount = Number($($('.cosmetic-numProduct').get(i)).html());
	        		OrderProduct.couponName = $('.coupon-select option:selected').val();
					OrderProduct.member_rank = $($('.member-member_rank').get(i)).val();    		
	        		OrderProduct.point = $('.cosmetic-point').val();
	        		OrderProduct.tel = $('.nomember-tel').val();
	        		OrderProduct.email = $('.nomember-email').val();
	        		OrderProduct.final_price = Number($('.final_price').html());
	        		OrderProduct.brand = $($('.cosmetic-brand').get(i)).val();
	        		olist.push(OrderProduct);
	        		console.log(OrderProduct);
	        	}
	    		
	    		// 카카오 결제
	    		$.ajax({
	        		type: "POST",
	        		url: "${pageContext.request.contextPath }/kakaoPay", 
	        		data: JSON.stringify(olist), 
	        		contentType: "application/json",
	        		dataType : "html",
	        		success: function(data) { 
	        			console.log(data);
	        			location.href=data;
	        		}
	        	});
	    		
	    	});
   	 	}
    	
    }
    
// 포인트 유효성 검증 (내가 가지고있는 포인트보다 높은 포인트를 입력했을 경우 오류코드 )
function maxPoint(tag) {
	var maxPoint = Number($('.max-point').html());
	
	if($(tag).val() > maxPoint){
		swal('warn','가지고있는 포인트보다 높은 금액을 입력하였습니다','warn');
		$(tag).val(0);
		return false;
	}else if($(tag).val() < 0){
		swal('warn','포인트가 0 이하일수 없습니다','warn');
		$(tag).val(0);
	}else{
		changePrice();
	}
	
}

// 유효성 검증
function validate() {
	// 배송 유효성
	if($('.postcode').val()=='' && $('.street_address').val()==''){
		alert('배송 정보를 입력해주세요');
		return false;
	}
	
	if($('.parcel_address').val()==''){
		alert('배송 정보를 입력해주세요');
		return false;
	}
	if($('.detail_address').val()==''){
		alert('배송 정보를 입력해주세요');
		return false;
	}
	
	// 주문자 정보 유효성
	if($('#sender').val()==''){
		alert('주문자 정보를 입력해주세요');
		return false;
	}
	if($('.tel').val()==''){
		alert('주문자 정보를 입력해주세요');
		return false;
	}
	if($('#email')==''){
		alert('주문자 정보를 입력해주세요');
		return false;
	}
	
}
    
$(document).ready(function() {
	// 포인트 입력햇을때
	$('.cosmetic-point').blur(function() {
		changePrice();
	});
});
</script>
<jsp:include page="../info/footer.jsp"></jsp:include>