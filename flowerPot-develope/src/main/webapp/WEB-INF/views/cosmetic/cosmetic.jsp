<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<jsp:include page="../info/header2.jsp"></jsp:include>

<!-- breadcrumb -->
<!-- 
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
			Home <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>

		<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
			Men <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>

		<span class="stext-109 cl4"> Lightweight Jacket </span>
	</div>
</div> -->


<!-- Product Detail -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-30 p-lr-0-lg">
					<div class="wrap-slick3 flex-sb flex-w">
						<div class="wrap-slick3-dots"></div>
						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
						<div class="slick3 gallery-lb">
						
						<c:forEach var="cosmeticImg" items="${cosmetic.mappingList }">
							<div class="item-slick3" data-thumb="${cosmeticImg }">
								<div class="wrap-pic-w pos-relative">
									<img src="${cosmeticImg }" alt="IMG-PRODUCT">

									<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${cosmeticImg }">
										<i class="fa fa-expand"></i>
									</a>
								</div>
							</div>
						</c:forEach>

						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg">

					<!-- 브랜드 -->
					<div class="mtext-106 cl2 py-2">
						<a href="#">${cosmetic.brand }</a>
						<span class="float-right">
							
						</span>
					</div>
					<!-- 화장품이름 -->
					<h4 class="ltext-103 cl2 js-name-detail py-2">${cosmetic.name }</h4>
					<hr />
					<!-- 평점 -->
					<div class="d-flex justify-content-between border-top border-secondary ">
						<span> <!-- <i class="item-rating pointer zmdi zmdi-star-outline"></i>  -->
							<c:forEach begin="1" end="${cosmetic.rating }"> 
								<i class="item-rating pointer zmdi zmdi-star"></i>
							</c:forEach>
						</span> 
						<span>평점 : ${cosmetic.drating }점</span>
					</div>
					<hr />
					<!-- 좋아요 -->
					<div class="d-flex justify-content-between border-top border-secondary ">
						<span> <!-- <i class="item-rating pointer zmdi zmdi-star-outline"></i>  -->
							<img class="trans-04" src="${pageContext.request.contextPath }/resources/images/icons/icon-heart-02.png" alt="ICON">
						</span> 
						<span>좋아요 : ${cosmetic.likey }개</span>
					</div>
					<hr />
					<!-- 배송정보 -->
					<div class="d-flex justify-content-between py-2">
						<span class="mtext-106">배송정보</span> <span class="mtext-106">2,500원</span>
					</div>
					
					<!-- 재고정보 -->
					<div class="d-flex justify-content-between py-2">
						<span class="mtext-106">재고</span> <span class="mtext-106">${cosmetic.stockNumber }개</span>
					</div>

					<!-- 화장품가격 -->
					<div class="d-flex justify-content-between py-2">
						<span class="mtext-106"> 가격 </span><span class="mtext-106"><span class="product-price">${cosmetic.price }</span><span>원</span></span>
					</div>
					
					<!-- 할인율정보 -->
					<div class="d-flex justify-content-between py-2">
						<span class="mtext-106">할인율</span><span class="mtext-106"><span data-discountPersent="${cosmetic.discountPersent }"  class="product-discountPersent" >${cosmetic.discountPersent }</span><span>%</span></span>
					</div>

					<!-- 결제 혜택 -->
					<div class="row py-2">
						<div class="col-12 mtext-106 pb-2">결제 해택</div>
						<div class="col-12">
							<span class="mtext-104"> THE CJ 카드 추가 10%할인 카드혜택<br> 회원등급별 할인 <a href="#">+회원등급별 할인 보러가기</a> <br /> <a href="#">+로그인 페이지</a>
							</span>
						</div>
					</div>
					
					<!-- 제출폼 -->
					<form method="post" id="cosmetic-form" >
					<input type="hidden"  name="cno" value="${cosmetic.cno }"/>
					<input type="hidden" id="isNextpage" name="isNextpage" />
					<!-- 구매수량 -->
					<div class="d-flex justify-content-between py-2">
						<span class="d-flex align-items-center mtext-106">수량</span>

						<div class="d-flex align-items-center  wrap-num-product flex-w m-r-20 m-tb-10" ">
							<div class="num-product-down cl8 hov-btn3 trans-04 flex-c-m" onclick="return changeValue(this,0);">
								<i class="fs-16 zmdi zmdi-minus"></i>
							</div>
							<input class="mtext-104 cl3 txt-center num-product cosmetic-amount" type="number" id="buy-number" name="numProduct" value="1" >
							<div class="num-product-up cl8 hov-btn3 trans-04 flex-c-m" onclick="return changeValue(this,1);">
								<i class="fs-16 zmdi zmdi-plus"></i>
							</div>
						</div>
					</div>

					<!-- 총 결제 금액 -->
					<div class="d-flex justify-content-between py-2">
						<span class="mtext-106"> 총 결제 금액 </span> <span class="mtext-106"><span class="total-price"></span><span>원</span></span>
					</div>

					<!-- 장바구니, 구매 박스 -->
					<div class="d-flex justify-content-center py-2">
						<!-- 장바구니 버튼 -->
						<button type="submit" class="btn btn-outline-secondary btn-lg mr-2" id="shoppingCart">장바구니</button>
						<!--바로구매 버튼 -->
						<button type="submit" class="btn btn-outline-secondary btn-lg" id="nowBuy">바로구매</button>
					</div>
					
					</form>

					<!-- 페이스북, 구글, 트위터 공유하기  -->
					<div class="d-flex justify-content-center py-2">

						<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
							<i class="fa fa-google-plus"></i>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="bor10 m-t-50 p-t-43 p-b-40">
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10"><a class="nav-link active" data-toggle="tab" href="#description" role="tab">상세정보</a></li>

					<li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#reviews" role="tab">상품리뷰</a></li>

					<li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#information" role="tab">상품문의</a></li>

				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">
					<!-- 상세정보 -->
					<div class="tab-pane fade show active" id="description" role="tabpanel">
						<div class="how-pos2 p-lr-15-md">
							<p class="stext-102 cl6">${cosmetic.content }</p>
							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">용량</th>
										<td>${description.capacity }ML</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>${description.period }일</td>
									</tr>
									<tr>
										<th scope="row">사용방법</th>
										<td>${description.useMethod }</td>
									</tr>
									<tr>
										<th scope="row">제조국</th>
										<td>${description.nation }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 상품문의 -->
					<div class="tab-pane fade " id="information" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<c:forEach var="cr" items="${crList }">
									<c:if test="${cr.category== \'query\' }">
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="${pageContext.request.contextPath }/resources/img/profile-image.png" alt="AVATAR">
											</div>
											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20"> ${cr.title } </span> 

												</div>

												<p class="stext-102 cl6">${cr.content }</p>
											</div>
										</div>
									</c:if>
								</c:forEach>
								
								<c:if test="${flag ne false }">
								<form action="${pageContext.request.contextPath }/cosmeticReviewRegister" class="w-full cosmeticReview-form" onsubmit="return onsubmitCometicReview();">
									<input type="hidden" name="mno" value="${member.mno }">
									<input type="hidden" name="id" value="${member.id }">
									<input type="hidden" name="nickname" value="${member.nickname }">
									<input type="hidden" name="cno" value="${cosmetic.cno }">
									<input type="hidden" name="category" value="query">
									<h5 class="mtext-108 cl2 p-b-7">문의 작성</h5>

									<div class="row p-b-25">
										<div class="col-12 form-group">
											<input type="text" class="form-control" id="title" name="title" placeholder="제목">
										</div>
										<div class="col-12 p-b-5">
											<textarea class="form-control size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="content" placeholder="댓글내용"></textarea>
										</div>
									</div>

									<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">제출</button>
								</form>
								</c:if>
							</div>
						</div>
					</div>

					<!-- 상품리뷰 -->
					<div class="tab-pane fade" id="reviews" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm">
									<!-- Review -->
									<c:forEach var="cr" items="${crList }">
										<c:if test="${cr.category== \'rating\' }">
											<div class="flex-w flex-t p-b-68">
												<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
													<img src="${pageContext.request.contextPath }/resources/img/profile-image.png" alt="AVATAR">
												</div>
	
												<div class="size-207">
													<div class="flex-w flex-sb-m p-b-17">
														<span class="mtext-107 cl2 p-r-20"> ${cr.title } </span> <span class="fs-18 cl11 show-rating" data-rating="${cr.rating }"> <i class="zmdi zmdi-star"></i> <i class="zmdi zmdi-star"></i> <i class="zmdi zmdi-star"></i> <i class="zmdi zmdi-star"></i> <i class="zmdi zmdi-star-half"></i>
														</span>
	
													</div>
	
													<p class="stext-102 cl6">${cr.content }</p>
												</div>
											</div>
										</c:if>
									</c:forEach>
									<!-- /Review -->
									
									<c:if test="${flag ne false }">
									<!-- 로그인하고 상품을 구입해야 댓글 작성할수 있게 -->
									<!-- Add review -->
									<form action="${pageContext.request.contextPath }/cosmeticReviewRegister" class="w-full cosmeticReview-form" onsubmit="return onsubmitCometicReview();">
										<input type="hidden" name="mno" value="${member.mno }">
										<input type="hidden" name="id" value="${member.id }">
										<input type="hidden" name="nickname" value="${member.nickname }">
										<input type="hidden" name="cno" value="${cosmetic.cno }">
										<input type="hidden" name="category" value="rating">
										<h5 class="mtext-108 cl2 p-b-7">리뷰 작성</h5>

										<div class="flex-w flex-m">
											<span class="stext-102 cl3 m-r-16"> 별점 : </span> <span class="wrap-rating fs-18 cl11 pointer"> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <input class="dis-none rating" type="number" name="rating">
											</span>
										</div>

										<div class="row p-b-25">
											<div class="col-12 form-group">
												<input type="text" class="form-control" id="title" name="title" placeholder="제목">
											</div>
											<div class="col-12 p-b-5">
												<textarea class="form-control size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="content" placeholder="댓글내용"></textarea>
											</div>
										</div>

										<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">제출</button>
									</form>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
		<span class="stext-107 cl6 p-lr-25"> SKU: JAK-01 </span> <span class="stext-107 cl6 p-lr-25"> Categories: Jacket, Men </span>
	</div>
</section>


<!-- Related Products -->
<section class="sec-relate-product bg0 p-t-45 p-b-105">
	<div class="container">
		<div class="p-b-45">
			<h3 class="ltext-106 cl5 txt-center">Related Products</h3>
		</div>

		<!-- Slide2 -->
		<div class="wrap-slick2">
			<div class="slick2">

				<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${pageContext.request.contextPath }/resources/images/product-08.jpg" alt="IMG-PRODUCT">

							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"> Quick View </a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> Pieces Metallic Printed </a>

								<span class="stext-105 cl3"> $18.96 </span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath }/resources/images/icons/icon-heart-01.png" alt="ICON"> <img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath }/resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

function changeValue(tag,flag) {
	var amount=0;
	if(flag==0){
		//console.log(tag);
		amount = $(tag).siblings("input").val();
		//console.log(amount);
		if(amount>=1){
			$(tag).siblings("input").attr("value",--amount);	
		}
	}else if(flag==1){
		//console.log(tag);
		amount = $(tag).siblings("input").val();
		//console.log(amount);
		$(tag).siblings("input").attr("value",++amount);
		//console.log($(tag).siblings("input"));
	}else if(flag==2){
		amount = $('.cosmetic-amount').val();
	}
	
	//console.log("계산양 :"+amount);
	var price = $('.product-price').html();
	var discountPersent = $('.product-discountPersent').data('discountpersent');   // data- 속성은 대문자가 적용이 안되나?
	console.log(discountPersent);
	console.log(typeof discountPersent);
	//console.log(price);
	$('.total-price').html(amount*Number(price)*(100-discountPersent)/100);

}
changeValue(null,2);

function onsubmitCometicReview() {
	var star = $('.wrap-rating').children('.zmdi-star');
	console.log(star.length); // 별표시 개수 찍기
	$('.rating').val(star.length);
}

$(document).ready(function() {
	var ratingTag = $('.show-rating');
	console.log(ratingTag);
	console.log(ratingTag[1]);

	// 쇼핑카트 버튼 클릭시 
	$('#shoppingCart').click(function() {
		// 알림창 띄우기
		var flag = confirm("상품이 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
		// 컨트롤로에서 분기
		if(flag==true){
			$('#isNextpage').val("1");
		}else{
			$('#isNextpage').val("0");
		}
		console.log($('#isNextpage').val());
		$('#cosmetic-form').attr("action", "${pageContext.request.contextPath }/cosmetic/shoppingCart_register");
	});
	
	// 바로구입 버튼 클릭시
	$('#nowBuy').click(function() {
		$('#cosmetic-form').attr("action", "${pageContext.request.contextPath }/cosmetic/payment?root=1");   // root=1 은 바로구입
	});
	
	for (var i = 0; i < ratingTag.length; i++) {
		var rating = $(ratingTag[i]).data('rating');
		console.log(rating);
		$(ratingTag[i]).empty();

		for (var j = 0; j < rating; j++) {
			$(ratingTag[i]).append($('<i class="item-rating pointer zmdi zmdi-star"></i>'));}
			for (var j = rating; j < 5; j++) {
				$(ratingTag[i]).append($('<i class="item-rating pointer zmdi zmdi-star-outline"></i>'))
			}
		}
	});
</script>	
	
	
	<jsp:include page="../info/footer.jsp"></jsp:include>