<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<jsp:include page="../info/header2.jsp"></jsp:include>
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
			Home <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>

		<span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>
<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85">
	<div class="container">
		<div class="row">
			<div class="col-12 m-lr-0-xl">
					<h2 class="my-5 text-center">장바구니</h2>
					<div class="wrap-table-shopping-cart">
						<table class="table table-hover border" style="margin: 0;">
							<tr>
								<!-- <th class="column-1 text-center"></th> -->
								<th scope="col" class="text-center">상품사진</th>
								<th scope="col" class="text-center">상품이름</th>
								<th scope="col" class="text-center">가격</th>
								<th scope="col" class="text-center">개수</th>
								<th scope="col" class="text-center">총 가격</th>
								<th scope="col" class="text-center">삭제</th>
							</tr>

							<c:forEach var="cosmetic" items="${shoppingCartList }">
								<tr data-cno="${cosmetic.cno }" class="">
									<!-- <td class="column-1 text-center"><input class="align-self-center m-l-10" type="checkbox" id=""></td>  --><!-- 요부분 생각좀하자 -->
									<td class="align-self-center text-center" >
										<div class="how-itemcart1" style="margin : 0 auto;">
										   <img src="${cosmetic.mappingList[0] }" alt="상품사진" >
										</div>
									</td>
									<td class="text-center align-middle">${cosmetic.name }</td>
									<!-- 상품하나의 가격 -->
									<td class="text-center align-middle">
										<c:if test="${cosmetic.discountPersent == 0 }">
											<span class="price">${cosmetic.price }</span><span>원</span>
										</c:if>
										<c:if test="${cosmetic.discountPersent != 0 }">
											<del><span class="pricex">${cosmetic.price }</span><span>원</span></del><br />
											
											<span class="price">
												<fmt:parseNumber var= "discountPrice" integerOnly= "true" value= "${cosmetic.price*(100-cosmetic.discountPersent)/100 }" />
												<fmt:formatNumber value="${discountPrice}" type="number" groupingUsed="false" />
											</span>
											<span>원</span>
										</c:if>
										
										
										
									</td>
									<!-- 개수선택 -->
									<td class="text-center align-middle">
										<div class="wrap-num-product flex-w" style="margin : 0 auto;">
											<div class="num-product-down cl8 hov-btn3 trans-04 flex-c-m" onclick="return changeValue(this,0);">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product cosmetic-amount" type="text" name="" value="${cosmetic.numProduct}">

											<div class="num-product-up cl8 hov-btn3 trans-04 flex-c-m" onclick="return changeValue(this,1);">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
									</td>
									<!--  -->
									<td class="text-center align-middle"><span class="price-product"></span><span>원</span></td>
									<td class="text-center align-middle"><button type="button" class="btn btn-outline-secondary cosmetic-delete">상품삭제</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
			</div>

			<div class="col-12 m-lr-0-xl p-t-30">
				<div class="text-left mtext-106 font-weight-bold py-2 my-2" style="border-bottom: 2px solid #888;">결재금액</div>
				<div class="row text-center" style="margin: 0;">
					<div class="col-6 py-2 my-2" >
						<div class="my-2">
							<span class="mtext-110 cl2 "> 상품금액 </span>
						</div>
						<div class="">
							<span class="mtext-110 cl2 "> <span class="product-price"></span><span>원</span> </span>
						</div>
					</div>
					
					<div class="col-6 py-2 my-2">
						<div class=" my-2">
							<span class="mtext-110 cl2 "> 배송비 </span>
						</div>
						<div class="">
							<span class="mtext-110 cl2 "> <span class="delivery-price">2500</span><span>원</span></span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 m-lr-0-xl p-t-30">
				<div class="py-2 my-2 text-center">
					<div class="my-2">
						<span class="mtext-101 cl2 "> 결재예정금액 </span>
					</div>

					<div class="p-t-1">
						<span class="mtext-110 cl2"> <span class="total-price"></span><span>원</span>
						</span>
					</div>
					<div class="p-t-1">
						<span class="mtext-101 cl2" style="font-size: 11px;"> 쿠폰, 적립금 적용은 다음페이지인 '주문서'페이지에서 사용가능합니다 </span>
					</div>
				</div>
				<!-- root=2는 장바구니에서 결재페이지로 갔다는것 -->
				
				<a href="${pageContext.request.contextPath}/cosmetic/payment?root=2" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 m-t-25 p-lr-15 trans-04 pointer">구매하기</a>
				
			</div>
		</div>
	</div>
</form>

<script>
console.log(typeof $($('.price').get(0)).html());
console.log(typeof $($('.cosmetic-amount').get(0)).val());


function changeValue(tag,flag) {
	if(flag==0){
		//console.log(tag);
		var amount = $(tag).siblings("input").val();
		//console.log(amount);
		if(amount>=1){
			$(tag).siblings("input").attr("value",--amount);
			
			var cno = $($(tag).parent().parent().parent()).data('cno');
			
			$.ajax({
				type: "POST", 
				url: "${pageContext.request.contextPath}/cosmetic/shopping_list_update", 
				data: {'cno':cno, 'numProduct':amount }, 
				success: 
					function(data) { 
					console.log(data); 
				}
			});
		}
	}else if(flag==1){
		//console.log(tag);
		var amount = $(tag).siblings("input").val();
		//console.log(amount);
		$(tag).siblings("input").attr("value",++amount);
		//console.log($(tag).siblings("input"));$
		console.log($($(tag).parent().parent().parent()));
		var cno = $($(tag).parent().parent().parent()).data('cno');
		
		$.ajax({
			type: "POST", 
			url: "${pageContext.request.contextPath}/cosmetic/shopping_list_update", 
			data: {'cno':cno, 'numProduct':amount }, 
			success: 
				function(data) { 
				console.log(data); 
			}
		});
	}
	//console.log($('.price').get(1));  get이라는 함수를 통해서,, 배열인덱스를 가져올수있음.
	var productPrice=0;
	
	// console.log($('.price').length);
	for(var i=0; i<$('.price').length; i++){
		var price = Number($($('.price').get(i)).html());
		var amount = Number($($('.cosmetic-amount').get(i)).val());
		var discountPrice =  Number($($('.discountPrice').get(i)).val());  
		console.log(price);
		console.log(amount);
		// 한 종류의 상품가격
		$($('.price-product').get(i)).html(price*amount); 
		productPrice = productPrice + price*amount;  // 전체 상품 금액 
		
	}
	// 전체 상품의 가격의 합
	$('.product-price').html(String(productPrice));
	
	
	// 할인금액 적용된 최종가격
	var totalPrice = Number($('.product-price').html())+Number($('.delivery-price').html())
	$('.total-price').html( String(totalPrice));
}
changeValue();

$(document).ready(function() {
	
	// 장바구니에서 상품 삭제
	$('.cosmetic-delete').click(function() {
		// console.log(this);
		// console.log($(this));
		$tr=$(this).parent().parent();
		var cno = $tr.data('cno');		
		// console.log(cno);
		$tr.remove();  // 삭제
		$.ajax({
			type: "POST", 
			url: "${pageContext.request.contextPath}/cosmetic/shopping_list_del", 
			data: {'cno':cno}, 
			success: 
				function(data) { 
				console.log(data); 
				changeValue();
			}
		});
	});
	
});
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>

