<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<c:if test="${type==null }">
	<script>
		alert('잘못된접근입니다');
		location.href='${pageContext.request.contextPath }';
	</script>
</c:if>

<jsp:include page="../info/header2.jsp"></jsp:include>

<!-- ?? -->

<div class="container">
	<div class="bread-crumb flex-w  p-r-15 p-t-30 p-lr-0-lg">
		<a href="${pageContext.request.contextPath }" class="stext-109 cl8 hov-cl1 trans-04"> 홈
		 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> 
		<a href="#" class="stext-109 cl8 hov-cl1 trans-04"> 
		화장품
		 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> 
		<span class="stext-109 cl4"> ${type } </span>
	</div>
</div> 

<!-- Product -->
<div class="bg0 m-t-23 p-b-140">
	<div class="container">
		<!-- Type 제목 -->
		<h2 id="type-name" class="text-left font-weight-bold">${type }</h2>
		
			<!-- 화장품 유형 필터 -->
			<div class="d-flex justify-content-center align-items-center">
			<span class="mtext-106 m-r-10" style="font-weight : bolder; border-bottom: 2px solid #888;">유형별</span>
			
			<div class="flex-w flex-c-m m-tb-10 ">
				<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-type-filter type-filter">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/></svg><span>닫기</span>
				</div>
			</div>
		</div>
		<div class="type-panel w-full p-t-10" style="display: none;">
				<table class="table table-bordered">
					<tbody>
						<c:set var="count" value="1" />
						<c:set var="len" value="${fn:length(tList)}" />
						
						<c:forEach var="type"  items="${tList }">
							<!-- tr열기 -->
							<c:if test="${count%5 == 1  }">
								<tr>
							</c:if>
							
							<td class="cursor_finger text-center z-index-10 sub_type"  style="width: 20%" data-name="${type.sub_type}" data-category="sub_type">${type.sub_type}</td>
							
							<!-- tr닫기 -->
							<c:if test="${count%5 == 0  }">
								</tr>
							</c:if>
							<c:if test="${count==len}">
								<td class="cursor_finger text-center sub_type" style="width: 20%" data-name="All" data-category="sub_type">ALL</td>
								</tr>
							</c:if>
							
							
							<c:set var="count" value="${count+1 }" />
						</c:forEach>
					</tbody>
				</table>
			</div>
		
		<!-- 브랜드 필터 -->
		<div class="d-flex justify-content-center align-items-center">
			<span class="mtext-106 m-r-10" style="font-weight : bolder; border-bottom: 2px solid #888;">브랜드</span>
			
			<div class="flex-w flex-c-m m-tb-10 ">
				<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-brand-filter brand-filter">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/></svg><span>닫기</span>
				</div>
			</div>
		</div>
		<div class="brand-panel w-full p-t-10" style="display: none;" >
				<table class="table table-bordered border-secondary">
					<tbody>
						<c:set var="count" value="1" />
						<c:set var="blen" value="${fn:length(bList)}" />
						
						<c:forEach var="brand"  items="${bList }">
							<!-- tr열기 -->
							<c:if test="${count%5 == 1  }">
								<tr>
							</c:if>
							
							<td class="cursor_finger text-center z-index-10 brand" style="width: 20%" data-name="${brand.name}" data-category="brand">${brand.name}</td>
							
							<!-- tr닫기 -->
							<c:if test="${count%5 == 0  }">
								</tr>
							</c:if>
							<c:if test="${count==blen}">
								<td class="cursor_finger text-center brand" style="width: 20%" data-name="All" data-category="brand">ALL</td>
								</tr>
							</c:if>
							
							
							<c:set var="count" value="${count+1 }" />
						</c:forEach>
					</tbody>
				</table>
			</div>
		
		<!-- 피부타입 필터 -->
		<div class="d-flex justify-content-center align-items-center">
			<span class="mtext-106 m-r-10" style="font-weight : bolder; border-bottom: 2px solid #888;">피부타입</span>
			
			<div class="flex-w flex-c-m m-tb-10 ">
				<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-skinType-filter">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg> 더보기
				</div>
			</div>
		</div>
		<div class="skinType-panel w-full p-t-10" style="display: none;">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="cursor_finger text-center skinType" style="width: 20%" data-name="지성" data-category="skinType">지성</td>
						<td class="cursor_finger text-center skinType" style="width: 20%" data-name="건성"  data-category="skinType">건성</td>
						<td class="cursor_finger text-center skinType" style="width: 20%" data-name="지/건성"  data-category="skinType">지/건성</td>
						<td class="cursor_finger text-center skinType" style="width: 20%" data-name="All"  data-category="skinType">ALL</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr class="m-t-15 m-b-15" />
		
		<!-- 정렬기준 -->
		<div class="flex-w flex-l-m filter-tope-group m-b-10 p-b-10"> <!-- how-active1 -->
				<button class="stext-106 cl6 hov1 bor3  m-r-32 m-tb-5 cosmetic-filter" data-filter="All">All Products</button>

				<button class="stext-106 cl6 hov1 bor3  m-r-32 m-tb-5 cosmetic-filter" data-filter="인기순">인기순</button>

				<button class="stext-106 cl6 hov1 bor3  m-r-32 m-tb-5 cosmetic-filter" data-filter="최신순">최신순</button>

				<button class="stext-106 cl6 hov1 bor3  m-r-32 m-tb-5 cosmetic-filter" data-filter="낮은가격순">낮은 가격순</button>
				
				<button class="stext-106 cl6 hov1 bor3  m-r-32 m-tb-5 cosmetic-filter" data-filter="높은가격순">높은 가격순</button>
			</div>
		
		<!-- 화장품 리스트 -->
		<div class="row isotope-grid">

			<c:forEach var="cosmetic" items="${cList }">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<div class="block2">
						<!-- 사진영역 -->
						<div class="block2-pic hov-img0">
							<c:if test="${cosmetic.mappingURL==null}">
								<img src="${pageContext.request.contextPath }/resources/images/product-02.jpg" alt="사진 없음">
							</c:if>
							<c:if test="${cosmetic.mappingURL!=null}">
								<img src="${cosmetic.mappingURL }" alt="${cosmetic.name }">
							</c:if>
							<!-- 퀵뷰 -->
							<a href="${pageContext.request.contextPath }/cosmetic/cosmetic_ok?cno=${cosmetic.cno}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 "> Quick View </a>
							<!-- js-show-modal1 -->
						</div>
						
						
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<span class="stext-105 cl3" style="width: 100%; text-align: center;"> [${cosmetic.brand }] </span>
								<!-- 화장품 이름 -->
								<a href="${pageContext.request.contextPath }/cosmetic/cosmetic_ok?cno=${cosmetic.cno}" class="stext-105 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 p-t-6" 
								style="width: 100%; text-align: center; color: black;"> ${cosmetic.name } </a>
								
								<!-- 할인률 적용 -->
								<c:if test="${cosmetic.discountPersent == 0}">
									<span class="stext-105 cl3" style="width: 100%; text-align: center; color: red;"><fmt:formatNumber value="${cosmetic.price }" type="number" groupingUsed="true" />원</span>
								</c:if>
								<c:if test="${cosmetic.discountPersent != 0}">
									<span class="stext-105 cl3" style="width: 100%; text-align: center; color: #222;"><del><fmt:formatNumber value="${cosmetic.price }" type="number" groupingUsed="true" />원 </del></span>
									<span class="stext-105 cl3" style="width: 100%; text-align: center; color: red;">
										<!-- 소수점 버리기 -->
										<fmt:parseNumber var= "discountPrice" integerOnly= "true" value= "${cosmetic.price*(100-cosmetic.discountPersent)/100 }" />
										<fmt:formatNumber value="${discountPrice}" type="number" groupingUsed="true"></fmt:formatNumber>원</span>
								</c:if>
							</div>

							<!-- 좋아요 -->
							<div class="block2-txt-child2 flex-r p-t-3">
								<button class="likey-button" data-cno="${cosmetic.cno }"> <!-- btn-addwish-b2 dis-block pos-relative js-addwish-b2 -->
									<img class="trans-04" src="${pageContext.request.contextPath }/resources/images/icons/icon-heart-02.png" alt="ICON">
									<!-- <img class="trans-04" src="${pageContext.request.contextPath }/resources/images/icons/icon-heart-02.png" alt="ICON">  -->
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>

		<!-- Load more -->
		<div class="flex-c-m flex-w w-full p-t-45">
			<div class="flex-c-m flex-w w-full p-t-10 m-lr--7">
				<c:if test="${cosmeticPageDTO.prev == true }">
					<button class="flex-c-m how-pagination1 trans-04 m-all-7" date-startPage="${cosmeticPageDTO.startPage }" onclick="return prevPage(this)"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" /></svg></button>
				</c:if>
				<c:if test="${cosmeticPageDTO.prev == false }">
					<button class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="alert('처음페이지 입니다');"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" /></svg></button>
				</c:if>
				
				<!-- 숫자 -->
				<c:forEach var="num" begin="${cosmeticPageDTO.startPage }" end="${cosmeticPageDTO.endPage }" step="1" >
					<c:if test="${cosmeticPageDTO.cri.pageNum == num}">
						<a href="#" data-page="${num }" class="flex-c-m how-pagination1 trans-04 m-all-7 cosmetic-page active-pagination2">${num}</a>
					</c:if>
					<c:if test="${cosmeticPageDTO.cri.pageNum != num}">
						<a href="#" data-page="${num}" class="flex-c-m how-pagination1 trans-04 m-all-7 cosmetic-page">${num}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${cosmeticPageDTO.next == true }">
					<button class="flex-c-m how-pagination1 trans-04 m-all-7" date-startPage="${cosmeticPageDTO.startPage }" onclick="return nextPage(this);"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path></svg></button>
				</c:if>
				<c:if test="${cosmeticPageDTO.next == false }">
					<button class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="alert('마지막페이지 입니다');"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path></svg></button>
				</c:if>
				
				<!-- <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"> 1 </a>
				<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7"> 2 </a> -->
			</div>
		</div>
	</div>
</div>

<input type="hidden" value="${CosmeticCriteria.sub_type }">
<input type="hidden" value="${CosmeticCriteria.brand }">
<input type="hidden" value="${CosmeticCriteria.skinType }">

<script>
// el로 받은거  active 처리하기
$(document).ready(function() {
	console.log( $($('.sub_type').get(0)).data('name') );
	console.log( $('.sub_type').length );
	
	for(var i=0; i<$('.sub_type').length ; i++){
		$tag = $($('.sub_type').get(i));
		if($tag.data('name')=='${CosmeticCriteria.sub_type}'){
			$tag.addClass('fix-actice');
			
		}
	}
	for(var i=0; i<$('.brand').length ; i++){
		$tag = $($('.brand').get(i));
		if($tag.data('name')=='${CosmeticCriteria.brand}'){
			$tag.addClass('fix-actice');
			
		}
	}
	for(var i=0; i<$('.skinType').length ; i++){
		$tag = $($('.skinType').get(i));
		if($tag.data('name')=='${CosmeticCriteria.skinType}'){
			$tag.addClass('fix-actice');
			
		}
	}
	for(var i=0; i<$('.cosmetic-filter').length; i++){
		$tag = $($('.cosmetic-filter').get(i));
		if($tag.data('filter')=='${CosmeticCriteria.filter}'){
			$tag.addClass('how-active1');
		}
	}
	
	// 클릭시 좋아요처리
	$('.likey-button').click(function() {
		$button = $(this);
		var cno =  $(this).data('cno');
		console.log(cno);
		$.ajax({
			url: '${pageContext.request.contextPath }/cosmetic/addlikey',
			type: 'post',
			data: {'cno' : cno},
			dataType: 'html',
			success : function(data) {
				console.log(data);
				if(data == 'plus'){
					//$button.empty();
					//$button.append($('<img class="trans-04" src="${pageContext.request.contextPath }/resources/images/icons/icon-heart-02.png" alt="ICON">'));
					swal('success','좋아요 성공','success');
				}else if(data == 'not'){
					swal('warning','좋아요는 30분에 한번만 가능합니다','warning');
				}
			}
		});		
	});
	
});

//$('.filter-button').trigger("click");
//$('.js-show-filter').toggleClass('show-filter');
$('.brand-panel').slideToggle(400);
$('.type-panel').slideToggle(400);

// 유형선택
$('.cursor_finger').on({
	click : function() {
		var category = $(this).data('category');
		var name = $(this).data('name');
		// 쿼리스트링 작업,, 기본적으로 type 값을 받음
		var query = category+'='+name+'&type=${type}';
		// 필터방법
		query += '&filter='+'${CosmeticCriteria.filter}';
		
		// 
		if(category != 'skinType'){
			query += '&skinType='+'${CosmeticCriteria.skinType}';
		}
		if(category != 'sub_type'){
			query += '&sub_type='+'${CosmeticCriteria.sub_type}';
		}
		if(category != 'brand'){
			query += '&brand='+'${CosmeticCriteria.brand}';
		}

		
		location.href='${pageContext.request.contextPath }/cosmetic/cosmetic_list?'+query;
	},
	mouseenter : function() {
		$(this).addClass('fluid-actice');
	},
	mouseleave : function() {
		$(this).removeClass('fluid-actice');
	}
});

// 정렬방법 선택
$('.cosmetic-filter').on({
	click : function() {
		var category = $(this).data('category');
		var name = $(this).data('name');
		var query = category+'='+name+'&type=${type}';
	
		var filter = $(this).data('filter');
		// 필터방법
		query += '&filter='+filter;
		
		if(category != 'skinType'){
			query += '&skinType='+'${CosmeticCriteria.skinType}';
		}
		if(category != 'sub_type'){
			query += '&sub_type='+'${CosmeticCriteria.sub_type}';
		}
		if(category != 'brand'){
			query += '&brand='+'${CosmeticCriteria.brand}';
		}
		
		location.href='${pageContext.request.contextPath }/cosmetic/cosmetic_list?'+query;
	},
	mouseenter : function() {
		$(this).addClass('how-active1');
	},
	mouseleave : function() {
		$(this).removeClass('how-active1');
	}
});

//page 클릭
$('.cosmetic-page').on({
	click : function() {
		var page = $(this).data('page');
		// var category = $(this).data('category');
		// var name = $(this).data('name');
		var query = 'type=${type}';
	
		// 필터방법
		query += '&filter='+'${CosmeticCriteria.filter}';
		query += '&skinType='+'${CosmeticCriteria.skinType}';
		query += '&sub_type='+'${CosmeticCriteria.sub_type}';
		query += '&brand='+'${CosmeticCriteria.brand}';
		query += '&pageNum='+page;
		
		location.href='${pageContext.request.contextPath }/cosmetic/cosmetic_list?'+query;
	},
	mouseenter : function() {
		$(this).addClass('active-pagination1');
	},
	mouseleave : function() {
		$(this).removeClass('active-pagination1');
	}
});

// 이전 10개 페이지
function prevPage(tag) {
	var startPage = $(tag).data('startPage');
	console.log(startPage);
	startPage += 10;
	
	var query = category+'='+name+'&type=${type}';
	query += '&filter='+'${CosmeticCriteria.filter}';
	query += '&skinType='+'${CosmeticCriteria.skinType}';
	query += '&sub_type='+'${CosmeticCriteria.sub_type}';
	query += '&brand='+'${CosmeticCriteria.brand}';
	query += '&pageNum='+page;
}

// 다음 10개 페이지
function nextPage(tag) {
	var startPage = $(tag).data('startPage');
	console.log(startPage);
	startPage -= 10;
	
	var query = category+'='+name+'&type=${type}';
	query += '&filter='+'${CosmeticCriteria.filter}';
	query += '&skinType='+'${CosmeticCriteria.skinType}';
	query += '&sub_type='+'${CosmeticCriteria.sub_type}';
	query += '&brand='+'${CosmeticCriteria.brand}';
	query += '&pageNum='+startPage;
}

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>


