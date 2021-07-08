<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<div id="main">
	<div id="content">

		<div class="page_aticle">
			<div class="lnb_menu" id="lnbMenu" >
				<div id="bnrCategory" class="bnr_category">
					<div class="thumb">
						<img src="" alt="카테고리배너">
					</div>
				</div>
				<div class="inner_lnb">
					<div class="ico_cate">
						<span class="tit">매거진</span>
					</div>
				</div>
			</div>
			<div id="goodsList" class="page_section section_goodslist">
				<!-- 신상품순,, 등등 select -->
				
				<!-- <div class="list_ability">
					<div class="sort_menu">
						<div>
						<div class="select_type user_sort">
							<a class="name_select"></a>
							<ul class="list">
								<li><a>신상품순</a></li>
								<li><a>인기상품순</a></li>
								<li><a>낮은가격순</a></li>
								<li><a>높은가격순</a></li>
							</ul>
						</div>
						<view-sort :page-type="pageType" :sort-data="sortData" :sort-delivery="sortDelivery" :delivery-check="deliveryCheck" :sort-user-check="sortUserCheck" :type="type" @sort-regist="sortRegist" @sort-layer-view="sortLayerView"></view-sort> 
						</div>
					</div>
				</div> -->
				<div class="list_goods">
					<div class="inner_listgoods">
						<ul class="list">
							<!-- 하나의 리스트 -->
							<li>
								<div class="item">
									<div class="thumb">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										
									</div>
									<a class="info"> 
										<span class="name">화장품...</span> 
										<span class="desc">내 마음대로 골라담고 세척되어 바로 바를 수 있는 신선한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
							<!-- 하나의 리스트 -->
							<li>
								<div class="item">
									<div class="thumb">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										
									</div>
									<a class="info"> 
										<span class="name">화장품...</span> 
										<span class="desc">내 마음대로 골라담고 세척되어 바로 바를 수 있는 신선한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
							<!-- 하나의 리스트 -->
							<li>
								<div class="item">
									<div class="thumb">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										
									</div>
									<a class="info"> 
										<span class="name">화장품...</span> 
										<span class="desc">내 마음대로 골라담고 세척되어 바로 바를 수 있는 신선한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="thumb" id="magazine-test">
										<a class="img" style="background-image: url('${pageContext.request.contextPath }/resources/img/cometic/abc.jpg');">
											<img alt="aaa" src="${pageContext.request.contextPath }/resources/img/cometic/abc.jpg" width="308" height="396">
										</a>
										
									</div>
									<a class="info"> 
										<span class="name" id="magazine-title">화장품...</span> 
										<span class="desc" id="magazine-content">내 마음대로 골라담고 세척되어 바로 바를 수 있는 신선한 화장품</span>
									</a>
									<span class="tag"></span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				
				<!-- 버튼 부분이네 -->
				<div class="layout-pagination" v-if="!noData">
					<div class="pagediv">
						<a href="#main" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a>
						 <a href="#main" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
			
						<a href="#main" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a> 
						<a href="#main" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
						<a href="${pageContext.request.contextPath }/magazine/magazine_writer" class="y-float-right"><button type="button" class="btn_magazin">매거진 등록</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

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

</script>

<jsp:include page="../info/footer.jsp"></jsp:include>